# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import copy
import time
import tensorflow as tf
import numpy as np
import matplotlib
#
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import math
from matplotlib import rc
import matplotlib.font_manager
#rc('font', **{'family': 'serif', 'serif': ['Palatino']})

import pddm.envs
from pddm.envs.gym_env import GymEnv
from pddm.envs.mb_env import MBEnvWrapper
from pddm.utils.data_structures import *

##added by hamada
#import pylab
import re

#mngmngr = plt.get_current_fig_manager()
# to put it into the upper left corner for example:
#mngmngr.window.setGeometry = (0, 120, 1280, 1024)

###########################
####### CREATE ENV ########
###########################


def create_env(env_name):

    # setup environment
    env = MBEnvWrapper(GymEnv(env_name))

    # dimensions
    dt_from_xml = env.unwrapped_env.skip * env.unwrapped_env.model.opt.timestep
    dimO = env.env.env.observation_space.shape
    dimA = env.env.env.action_space.shape
    print('--------------------------------- \nSimulation dt: ', dt_from_xml)
    print('State space dimension: ', dimO)
    print('Action space dimension: ', dimA,
          "\n-----------------------------------")

    return env, dt_from_xml


###########################
###### TF GPU CONFIG ######
###########################


def get_gpu_config(use_gpu, gpu_frac=0.6):

    if use_gpu:
        gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=gpu_frac)
        config = tf.ConfigProto(
            gpu_options=gpu_options,
            log_device_placement=False,
            allow_soft_placement=True,
            inter_op_parallelism_threads=1,
            intra_op_parallelism_threads=1)
    else:
        config = tf.ConfigProto(device_count={'GPU': 0})
    return config


###########################
###### DATA HELPERS #######
###########################


def get_num_data(rollouts):
    num_data = 0
    for rollout in rollouts:
        num_data += rollout.states.shape[0]

    return num_data


def concat_datasets(a, b):

    x = np.concatenate([a.dataX, b.dataX])
    y = np.concatenate([a.dataY, b.dataY])
    z = np.concatenate([a.dataZ, b.dataZ])

    return Dataset(x, y, z)


def add_noise(data_inp, noiseToSignal):
    """
    Add supervised learning noise
    trick for helping the learning process
    """

    data = copy.deepcopy(data_inp)

    #when data is of shape (data,dim)
    if len(data.shape)==2:

        #mean of data
        mean_data = np.mean(data, axis=0)

        #if mean is 0,
        #make it 0.001 to avoid 0 issues later for dividing by std
        mean_data[mean_data == 0] = 0.000001

        #width of normal distribution to sample noise from
        #larger magnitude number = could have larger magnitude noise
        std_of_noise = mean_data * noiseToSignal
        for j in range(mean_data.shape[0]):
            data[:, j] = np.copy(data[:, j] + np.random.normal(
                0, np.absolute(std_of_noise[j]), (data.shape[0],)))

    #when data is of shape (data,K,dim)
    else:
        all_points = np.concatenate(data_inp, 0)
        mean_data = np.mean(all_points, axis=0)
        mean_data[mean_data == 0] = 0.000001
        std_of_noise = mean_data * noiseToSignal

        for j in range(mean_data.shape[0]):
            data[:, :, j] = np.copy(data[:, :, j] + np.random.normal(
                0, np.absolute(std_of_noise[j]), data[:, :, j].shape))

    return data


def check_dims(dataset_trainRand, env):

    ### assign dims
    acSize = env.action_dim
    inputSize = dataset_trainRand.dataX.shape[
        2] + dataset_trainRand.dataY.shape[2]  #[points, K, inp_dim]
    outputSize = dataset_trainRand.dataZ.shape[1]  #[points, outp_dim]

    #x/y/z rand datasets should have same number of data points
    assert dataset_trainRand.dataX.shape[0] == dataset_trainRand.dataY.shape[
        0] == dataset_trainRand.dataZ.shape[0]

    #inp-ac = outp
    assert (inputSize - acSize) == outputSize

    print("\n\n######################\nDone getting data....")
    print("input size: ", inputSize)
    print("action size: ", acSize)
    print("output size: ", outputSize)
    print("dataX dims: ", dataset_trainRand.dataX.shape)
    print("dataY dims: ", dataset_trainRand.dataY.shape)
    print("dataZ dims: ", dataset_trainRand.dataZ.shape,
          "\n######################\n")

    return inputSize, outputSize, acSize


###########################
######### RENDER ##########
###########################


def render_env(env):
    render_fn = getattr(env.unwrapped_env, 'mj_render', None)
    if not render_fn:
        render_fn = env.unwrapped_env.render
    else:
        env.unwrapped_env.mujoco_render_frames = True
    render_fn()

def render_stop(env):
    render_fn = getattr(env.unwrapped_env, 'mj_render', None)
    if render_fn:
        env.unwrapped_env.mujoco_render_frames = False


###########################
##### ROLLOUT HELPERS #####
###########################

## Collect random rollouts

def collect_random_rollouts(env,
                            random_policy,
                            num_rollouts,
                            rollout_length,
                            dt_from_xml,
                            params,
                            visualize=False):

    #get desired sampler
    if params.use_threading:
        from pddm.samplers.collect_samples_threaded import CollectSamples
    else:
        from pddm.samplers.collect_samples import CollectSamples

    #random sampling params
    random_sampling_params = dict(
        sample_velocities = params.rand_policy_sample_velocities,
        vel_min = params.rand_policy_vel_min,
        vel_max = params.rand_policy_vel_max,
        hold_action = params.rand_policy_hold_action,)

    #setup sampler
    print("Beginning to do ", num_rollouts, " random rollouts.")
    c = CollectSamples(
        env, random_policy, visualize, dt_from_xml, is_random=True, random_sampling_params=random_sampling_params)

    #collect rollouts
    rollouts = c.collect_samples(num_rollouts, rollout_length)

    #done
    print("Performed ", len(rollouts), " rollouts, each with ",
          len(rollouts[0].states), " steps.")
    return rollouts


## Perform a rollout, given actions

def do_groundtruth_rollout(acs, env, starting_fullenvstate,
                           actions_taken_so_far):
    """
    get results of running acs (which is a sequence of h actions)

    inputs:
    env: the env
    starting_fullenvstate: state of the env at the beginning of the rollout
    actions_taken_so_far: acs taken to get from (starting_fullenvstate) to (current state)
    acs: sequence of (H) actions, to execute on the env (from some current state)

    outputs:
    true_states : sequence of (H+1) observations, achieved from executing acs
    """

    #init
    curr_env = copy.deepcopy(env)
    true_states = []
        #reset env to starting state
    o = curr_env.reset(reset_state=starting_fullenvstate)

    #hamada adeded
    job = re.findall('I.?P', str(type(
        env.env.env)))
    i=0


    #get the env to do what it's done so far
    for ac in actions_taken_so_far:
    #hamada changed
    #for i, ac in enumerate(actions_taken_so_far):
        if (ac.shape[0] == 1):
            ac = ac[0]
        if not job:
            pass
        elif job[0] == 'IP':
            if i == 0:
                curr_env.env.env.perturb_joint(30)
            else:
                curr_env.env.env.perturb_joint(0)

        o, _, _, _ = curr_env.step(ac)
        #print("lengh action_taken_so_far{}".format(len(actions_taken_so_far)))
        i+=1

    true_states.append(o)
    for ac in acs:
        if not job:
            pass
        elif job[0] == 'IP':
            if i == 0:
                curr_env.env.env.perturb_joint(30)
            else:
                curr_env.env.env.perturb_joint(0)
        o, _, _, _ = curr_env.step(ac)
        true_states.append(o)

    #print("observation {} & {}".format(o,o2))

    return true_states


## Visualize a rollout, given actions

def visualize_rendering(rollout_info,
                        env,
                        args,
                        save_dir,
                        iter_num,
                        vis_index,
                        disturb,
                        visualize=True,
                        visualize_mpes=False):

    #####added by hamada
    perturb=disturb
    job = re.findall('I.?P', str(type(
        env.env.env)))


    ### reset env to the starting state
    curr_state = env.reset(reset_state=rollout_info['starting_state'])

    ### vars to specify here
    which_index_to_plot = 1
    which_index_to_plot1 = 3
    which_index_to_plot2 = 4
    which_index_to_plot3 = 5
    which_index_to_plo4 = 6

    slowdown = 1
    #print("env.dt {}: ".format(env.env.env.dt))


    mpe_1step = rollout_info['mpe_1step']
    if visualize_mpes:
        slowdown = 5
        time.sleep(1.0)

    traj_taken = []
    traj_taken.append(curr_state)
    count = 0

    plotting_list = []
    plotting_list.append(curr_state[which_index_to_plot])
    plotting_list1 = []
    plotting_list1.append(curr_state[which_index_to_plot1])
    plotting_list2 =[] #action
    plotting_list2.append(0)
    plotting_list3 = []#perturb
    if curr_state.shape[0]==7:
        plotting_list4 = []
        plotting_list4.append(curr_state[which_index_to_plot2])
        plotting_list5 = []
        plotting_list5.append(curr_state[which_index_to_plot3])
        plotting_list6 = []
        plotting_list6.append(curr_state[which_index_to_plo4])


    lasttime = time.time()
    starttime = time.time()
    dt = args.dt_from_xml * slowdown

    scores, rewards = [], []
    for action in rollout_info['actions']:

        if not job:
            pass
        elif job[0]=='IP':
            if perturb:
                if count==0:
                    print("previous state {} ".format(env.env.env.state_vector()))
                env.env.env.perturb_joint(rollout_info["disturbances"][count])
                if count==0:
                    print("after state {} ".format(env.env.env.state_vector()))
                #print("disturbances {} ".format(rollout_info["disturbances"][count]))
                plotting_list3.append(rollout_info["disturbances"][count])


        if visualize_mpes:

            #print('job name {}'.format(job))
            #print("step {} and theta {}    ".format(count, plotting_list[count]))
            if  job[0]=='IP':
                print("step {} and theta {}    ".format(count,plotting_list[count]))
                #plt.plot(plotting_list)

                if curr_state.shape[0]==7:
                    plot_visualize_ip_force(plotting_list,plotting_list1,plotting_list2,plotting_list3,plotting_list4,
                                            plotting_list5,plotting_list6)
                else:
                    plot_visualize_ip(plotting_list, plotting_list1, plotting_list2, plotting_list3)

                plt.pause(0.0001)
                plt.clf()
                 #plt.close()

        ##hamada changed
        if action.shape[0] == 1:
            next_state, rew, done, env_info = env.step(action[0])
            # print("action shape is 1")
        else:
            next_state, rew, done, env_info = env.step(action)


        if (visualize):
            render_env(env)

        scores.append(env_info['score'])
        rewards.append(rew)
        just_one = True
        curr_state = np.copy(next_state)
        traj_taken.append(curr_state)



        """
        orginal
        if visualize_mpes:
            plotting_list.append(curr_state[which_index_to_plot])

            plotting_list1.append(curr_state[which_index_to_plot1])
            if action.shape[0] == 1:
                plotting_list2.append(action[0])
            if curr_state.shape[0] == 7:
                plotting_list4.append(curr_state[which_index_to_plot2])
                plotting_list5.append(curr_state[which_index_to_plot3])
                plotting_list6.append(curr_state[which_index_to_plo4])
                """
        #hamada changed
        plotting_list.append(curr_state[which_index_to_plot])

        plotting_list1.append(curr_state[which_index_to_plot1])
        if action.shape[0] == 1:
            plotting_list2.append(action[0])
        if curr_state.shape[0] == 7:
            plotting_list4.append(curr_state[which_index_to_plot2])
            plotting_list5.append(curr_state[which_index_to_plot3])
            plotting_list6.append(curr_state[which_index_to_plo4])

        ##time check
        dt_check = time.time() - lasttime
        while (dt_check < dt):
            dt_check = time.time() - lasttime
            pass
        lasttime = time.time()
        count += 1

        if not job:
            pass
        elif job[0]=='IP':
            if perturb:
                env.env.env.remove_all_perturbation()

    print("Done taking ", count, " steps.")
    print("FINAL REW: ", np.sum(rewards))
    print("    TIME TAKEN : {:0.4f} s".format(time.time() - starttime))
    if curr_state.shape[0] == 7:
        plot_visualize_ip_force(plotting_list, plotting_list1, plotting_list2, plotting_list3, plotting_list4,
                                plotting_list5, plotting_list6)
    else:
        plot_visualize_ip(plotting_list, plotting_list1, plotting_list2, plotting_list3)

    plt.savefig(save_dir + "/{}_{}_{}".format(args.controller_type,str(iter_num),str(vis_index)),bbox_inches='tight')
    plt.clf()
        #plt.savefig(save_dir + "/result", bbox_inches='tight')
        #plt.show()
        #plt.close()

    return traj_taken, rewards, scores


###########################
##### OTHER HELPERS #######
###########################


## convert dict into list of command line flags
def config_dict_to_flags(config):
    """Converts a dictioanry to command line flags.
    e.g. {a:1, b:2, c:True} to ['--a', '1', '--b', '2', '--c']
    """
    result = []
    for key, val in config.items():

        if key in {'job_name', 'output_dir', 'config'}:
            continue

        key = '--' + key

        if isinstance(val, bool) and (val is False):
            continue
        result.append(key)

        if not isinstance(val, bool):

            assert isinstance(val, (str, int, float))
            result.append(str(val))

    return result

## calculate angle difference and return radians [-pi, pi]
def angle_difference(x, y):
    angle_difference = np.arctan2(np.sin(x - y), np.cos(x - y))
    return angle_difference

## return concatenated entries of length K
def turn_acs_into_acsK(actions_taken_so_far, all_samples, K, N, horizon):

    """
    start with array, where each entry is (a_t)
    end with array, where each entry is (a_{t-(K-1)}..., a_{t-1}, a_{t})
    """

    #this will become [K-1, acDim]
    past_Kminus1_actions = actions_taken_so_far[-(K - 1):]
    #[K-1, acDim] --> [N, K-1, acDim] --> [N, 1, K-1, acDim]
    past_Kminus1_actions_tiled = np.expand_dims(
        np.tile(np.expand_dims(past_Kminus1_actions, 0), (N, 1, 1)), 1)
    ##[N, 1, K-1, acDim]
    prevKminus1 = past_Kminus1_actions_tiled

    #all_samples is [N, horizon, ac_dim]
    for z in range(horizon):

        #get, for each sim, action to execute at this timestep
        thisStep_acs_forAllSims = np.expand_dims(
            np.expand_dims(all_samples[:, z, :], 1),
            1)  ## [N, horizon, ac_dim] --> [N,1,acDim] --> [N,1,1,acDim]

        #add this action onto end of previous points
        #[N, 1, K-1, acDim] plus [N, 1, 1, acDim] --> [N, 1, K, acDim]
        if K==1:
            thisStep_K_acs_forAllSims = thisStep_acs_forAllSims
        else:
            thisStep_K_acs_forAllSims = np.append(prevKminus1,
                                                  thisStep_acs_forAllSims, 2)

        #append onto final list
        if z==0:
            all_acs = copy.deepcopy(thisStep_K_acs_forAllSims)
        else:
            all_acs = np.append(all_acs, thisStep_K_acs_forAllSims, 1)

        #update prevK for next step (delete 0th entry from axis2)
        if K>1:
            prevKminus1 = np.delete(thisStep_K_acs_forAllSims, 0,
                                    2)  ##[N, 1, K-1, acDim]

    return all_acs

## Plot
def plot_mean_std(mean_data, std_data, filename=None, label=None, newfig=True, color='b'):

    if newfig:
        fig, ax = plt.subplots(1, figsize=(5, 10))
        xvals = np.arange(len(mean_data))
        if label is None:
            ax.plot(xvals, mean_data, color=color)
        else:
            ax.plot(xvals, mean_data, color=color, label=label)
            ax.legend()
        ax.fill_between(
            xvals,
            mean_data - std_data,
            mean_data + std_data,
            color=color,
            alpha=0.25)
        if filename is not None:
            fig.savefig(filename + '.png', dpi=200, bbox_inches='tight')
    else:
        xvals = np.arange(len(mean_data))
        if label is None:
            plt.plot(xvals, mean_data, color=color)
        else:
            plt.plot(xvals, mean_data, color=color, label=label)
            plt.legend()
        plt.fill_between(
            xvals,
            mean_data - std_data,
            mean_data + std_data,
            color=color,
            alpha=0.25)
        if filename is not None:
            fig.savefig(filename + '.png', dpi=200, bbox_inches='tight')



def plot_visualize_ip(plotting_list,plotting_list1,plotting_list2,plotting_list3):
    cmap = plt.get_cmap('jet_r')
    indices_to_vis =[plotting_list,plotting_list1]
    #thismanager = plt.get_current_fig_manager()
    #thismanager.window.setGeometry(50,100,640, 545)
    #plt.canvas.manager.window.move(0, 0)
    #plt.axes([-5,0,20,10])
    #curr_plot = 1
    #num_plots = len(indices_to_vis)
    #plt.figure(figsize=(6, 2))  # figureの
    # 縦横の大きさ
    #plt.rcParams["figure.figsize"] = (6, 10)
    #plt.figure()
    #plt.axes([0.3, 0.3, .5, .5])

    #plt.subplots_adjust(bottom=0)
    plt.subplot(411)

    # top
    #x1 = np.random.uniform(0, 100, 20)
    y1 = plotting_list#x1 * np.random.uniform(1, 2, 20)

    plt.plot(y1)
    plt.ylabel("angle")
    #plt.axis
    #ax1.set_ylabel("length [cm]")
    #ax1.set_xlim(0, 110)
    #ax1.set_ylim(0, 190)

    # bottom
   # x2 = plotting_list1
    plt.subplot(412)
    #x2_position = np.arange(len(x2))
    y2 = plotting_list1
    plt.plot(y2)

    plt.ylabel("anguler velocity")
    #ax2 = fig.add_subplot(2, 1, 2)
    #ax2.plot(y2)
    #ax2.bar(x2_position, y2, tick_label=x2)
    #ax2.set_xlabel("gene")
    #ax2.set_ylabel("expression [log(TPM)]")

    plt.subplot(413)
    # x2_position = np.arange(len(x2))
    y3 = plotting_list2
    plt.plot(y3,'k')

    plt.ylabel("torque")

    plt.subplot(414)
    # x2_position = np.arange(len(x2))
    y4 = plotting_list3
    plt.plot(y4,'m')

    plt.ylabel("purturb")
    plt.tight_layout()


def plot_visualize_ip_force(plotting_list,plotting_list1,plotting_list2,plotting_list3,
                            plotting_list4,plotting_list5,plotting_list6):
    cmap = plt.get_cmap('jet_r')
    #indices_to_vis =[plotting_list,plotting_list1]
    #thismanager = plt.get_current_fig_manager()
    #thismanager.window.setGeometry(50,100,640, 545)
    #plt.canvas.manager.window.move(0, 0)
    #plt.axes([-5,0,20,10])
    #curr_plot = 1
    #num_plots = len(indices_to_vis)
    #plt.figure(figsize=(6, 2))  # figureの
    # 縦横の大きさ4
    plt.rcParams["figure.figsize"] = (6, 10)
    #plt.figure()
    #plt.axes([0.3, 0.3, .5, .5])

    #plt.subplots_adjust(bottom=0)
    plt.subplot(711)

    # top
    #x1 = np.random.uniform(0, 100, 20)
    y1 = plotting_list#x1 * np.random.uniform(1, 2, 20)

    plt.plot(y1)
    plt.ylabel("angle")
    #plt.axis
    #ax1.set_ylabel("length [cm]")
    #ax1.set_xlim(0, 110)
    #ax1.set_ylim(0, 190)

    # bottom
   # x2 = plotting_list1
    plt.subplot(712)
    #x2_position = np.arange(len(x2))
    y2 = plotting_list1
    plt.plot(y2)

    plt.ylabel("anguler velocity")
    #ax2 = fig.add_subplot(2, 1, 2)
    #ax2.plot(y2)
    #ax2.bar(x2_position, y2, tick_label=x2)
    #ax2.set_xlabel("gene")
    #ax2.set_ylabel("expression [log(TPM)]")

    plt.subplot(713)
    # x2_position = np.arange(len(x2))
    y3 = plotting_list2
    plt.plot(y3,'k')
    plt.ylabel("torque")

    plt.subplot(714)
    # x2_position = np.arange(len(x2))
    y4 = plotting_list3
    plt.plot(y4,'m')
    plt.ylabel("purturb")

    plt.subplot(715)
    # x2_position = np.arange(len(x2))
    y5 = plotting_list4
    plt.plot(y5)
    plt.ylabel("torque sensor")

    plt.subplot(716)
    # x2_position = np.arange(len(x2))
    y6 = plotting_list5
    plt.plot(y6)
    plt.ylabel("torque sensor")

    plt.subplot(717)
    # x2_position = np.arange(len(x2))
    y7 = plotting_list6
    plt.plot(y7)
    plt.ylabel("torque sensor")


    plt.tight_layout()