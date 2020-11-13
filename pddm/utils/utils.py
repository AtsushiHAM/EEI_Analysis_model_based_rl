##this code is created by Hamada


import numpy as np
import copy
import matplotlib
#
matplotlib.use('Agg')
import matplotlib.pyplot as plt

# my imports
from pddm.samplers import trajectory_sampler
from pddm.utils.helper_funcs import do_groundtruth_rollout
from pddm.utils.helper_funcs import turn_acs_into_acsK
from pddm.utils.calculate_costs import calculate_costs
import re
import os
import time
#hamada added


def state_prediction_inverted_pendulum(env,reward_func,resulting_states_list,all_samples,starting_fullenvstate,actions_taken_so_far,
                                       save_dir,plot_sideRollouts,best_sim_num,worst_sim_num,iter,rollout_num,step_number):

        cmap = plt.get_cmap('jet_r')
        # num_sims = 5
        num_sims = [worst_sim_num, best_sim_num]
        list_of_candidate = []
        list_of_candidate.append("Worst Act:k={}".format(worst_sim_num))
        list_of_candidate.append("Worst Pred:k={}".format(worst_sim_num))
        list_of_candidate.append("Best Act:k={}".format(best_sim_num))
        list_of_candidate.append("Best Pre:k={}".format(best_sim_num))
        # indices_to_vis = [0, 1, 2, 3, 4, 6, -3, -2]
        if re.findall('I.?P', str(type(env.env.env))):
            #print("What's {}".format(re.findall('I.?P', str(type(env.env.env)))))
            indices_to_vis = [0, 1, 2, 3, ]  # dimendion of agent env by hamada
        elif str(
                type(env.env.env)) == '<class \'pddm.envs.furuta_inverted_pendulum_force.IP_env.InvertedPendulumEnv\'>':
            indices_to_vis = [0, 1, 2, 3, 4]
        elif str(
                type(env.env.env)) == '<class \'pddm.envs.cheetah.cheetah.HalfCheetahEnv\'>':
            indices_to_vis = [0, 1, 2, 3, 4,5,6,7,8,9]
        elif re.findall('R.?e', str(type(env.env.env))):
            indices_to_vis = [4,5,6,7,8,9 ]

        curr_plot = 1
        num_plots = len(indices_to_vis)
        fig = plt.figure(figsize=(30.0, 35.0))
        for index_state_to_vis in indices_to_vis:

            plt.subplot(num_plots, 1, curr_plot)
            # plt.ylabel(index_state_to_vis)
            for sim_num in (num_sims):
                true_states = do_groundtruth_rollout(
                    all_samples[sim_num], env,
                    starting_fullenvstate, actions_taken_so_far)
                # color = cmap(float(sim_num) / num_sims)
                color = cmap(num_sims.index(sim_num) / len(num_sims))

                ###if(step_number%10==0):
                plt.plot(
                    resulting_states_list[-1]
                    [:, sim_num, index_state_to_vis],
                    '--',
                    c=color,
                    label=sim_num,
                linewidth=5)
                plt.plot(
                    np.array(true_states)[:, index_state_to_vis],
                    '-',
                    c=color,
                linewidth=5)

            curr_plot += 1
            plt.xlabel("step",fontsize=25)
            plt.ylabel("state{}".format(index_state_to_vis),fontsize=25)
            plt.tick_params(labelsize=25)
            # plt.legend(list_of_candidate,loc='upper left', bbox_to_anchor=(1, 1))
        #plt.legend(list_of_candidate, loc='upper right', )
        #plt.legend(list_of_candidate,fontsize=25)
        plt.tight_layout()
        # plot_sideRollouts = False

        save_dir = save_dir + "/{}_mpe/".format(time.strftime("%Y-%m-%d"))
        if not os.path.isdir(save_dir):
            os.makedirs(save_dir)
        if plot_sideRollouts:
            plt.savefig(save_dir + "iter{}_rollout{}_step{}".format(iter, rollout_num, step_number))
            #plt.show()
            plt.clf()


def reward_prediction(env, reward_func, resulting_states_list, all_samples,
                                               starting_fullenvstate, actions_taken_so_far,
                                               save_dir, plot_sideRollouts, best_sim_num, worst_sim_num, iter,
                                               rollout_num, step_number):
    # num_sims = 5
    cmap = plt.get_cmap('jet_r')
    num_sims = [worst_sim_num, best_sim_num]
    list_of_candidate = []
    list_of_candidate.append("Worst Act:k={}".format(worst_sim_num))
    list_of_candidate.append("Worst Pred:k={}".format(worst_sim_num))
    list_of_candidate.append("Best Act:k={}".format(best_sim_num))
    list_of_candidate.append("Best Pre:k={}".format(best_sim_num))
    # indices_to_vis = [0, 1, 2, 3, 4, 6, -3, -2]
    if re.findall('I.?P', str(type(env.env.env))):
        indices_to_vis = [0, 1, 2, 3, ]  # dimendion of agent env by hamada
    elif str(
            type(env.env.env)) == '<class \'pddm.envs.furuta_inverted_pendulum_force.IP_env.InvertedPendulumEnv\'>':
        indices_to_vis = [0, 1, 2, 3, 4]
    elif str(
            type(env.env.env)) == '<class \'pddm.envs.cheetah.cheetah.HalfCheetahEnv\'>':


        indices_to_vis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    curr_plot = 1
    # plt.legend(list_of_candidate,loc='upper left', bbox_to_anchor=(1, 1))
    plt.subplot(1, 1, curr_plot)
    for sim_num in (num_sims):
        true_states = do_groundtruth_rollout(
            all_samples[sim_num], env,
            starting_fullenvstate, actions_taken_so_far)
        # color = cmap(float(sim_num) / num_sims)
        color = cmap(num_sims.index(sim_num) / len(num_sims))
        predict_rewards = []
        actual_rewards = []
        actual_reward = 0
        predict_reward = 0
        for i in range(len(all_samples[sim_num])):
            ind_predict_reward, _ = reward_func(resulting_states_list[-1][i, sim_num, :], all_samples[sim_num, i])
            ind_actual_reward, _ = reward_func(np.array(true_states)[i, :], all_samples[sim_num, i])

            predict_reward = predict_reward + ind_predict_reward
            actual_reward = actual_reward + ind_actual_reward

            predict_rewards.append(predict_reward)
            actual_rewards.append(actual_reward)
            # print("ind predict: {}. total predict:{}. in {} times,{} rollout and {} iter".format(ind_predict_reward,predict_reward,
            #                                                                                     i,sim_num,index_state_to_vis))
        ###if(step_number%10==0):
        plt.plot(
            np.array(predict_rewards),  # predict_reward[0],
            '--',
            c=color,
            label=sim_num)
        plt.plot(
            np.array(actual_rewards),
            '-',
            c=color)
    curr_plot += 1
    plt.xlabel("step", fontsize=25)
    plt.ylabel("reward", fontsize=25)
    plt.legend(list_of_candidate)
    # plt.legend()
    plt.tight_layout()
    save_dir = save_dir + "/{}_mpe_reward/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    if plot_sideRollouts:
        plt.savefig(save_dir + "_iter{}_rollout{}_step{}".format(iter, rollout_num, step_number))
        # plt.show()
        plt.clf()


def eei_inverted_pendulum(env,reward_func,resulting_states_list,all_samples,starting_fullenvstate,actions_taken_so_far,
                                       save_dir,plot_sideRollouts,best_sim_num,worst_sim_num,iter,rollout_num,step_number):
    if plot_sideRollouts:
        Final_EEI =False
        test_EEI =False
        indices_to_vis = ["EEI", "Control Accuracy", "Energy"]
        num_plots = len(indices_to_vis)
        cmap = plt.get_cmap('jet_r')
        # num_sims = 5
        num_sims = [worst_sim_num, best_sim_num]
        list_of_candidate = []
        list_of_candidate.append("Worst Act:k={}".format(worst_sim_num))
        list_of_candidate.append("Worst Pred:k={}".format(worst_sim_num))
        list_of_candidate.append("Best Act:k={}".format(best_sim_num))
        list_of_candidate.append("Best Pre:k={}".format(best_sim_num))
        if plot_sideRollouts:
            curr_plot = 1
            # plt.legend(list_of_candidate,loc='upper left', bbox_to_anchor=(1, 1))
            for index,index_state_to_vis in enumerate( indices_to_vis):
                plt.subplot(num_plots, 1, curr_plot)
                for sim_num in (num_sims):
                    true_states = do_groundtruth_rollout(
                        all_samples[sim_num], env,
                        starting_fullenvstate, actions_taken_so_far)
                    # color = cmap(float(sim_num) / num_sims)
                    color = cmap(num_sims.index(sim_num) / len(num_sims))

                    predict_EEI = get_EEI(resulting_states_list[-1][:, sim_num, :],
                                          all_samples[sim_num, :], Final_EEI, test_EEI)
                    actual_EEI = get_EEI(np.array(true_states)[:, :], all_samples[sim_num, :], Final_EEI, test_EEI)

                    # print("ind predict: {}. total predict:{}. in {} times,{} rollout and {} iter".format(ind_predict_reward,predict_reward,
                    #                                                                                     i,sim_num,index_state_to_vis))
                    ###if(step_number%10==0):

                    plt.plot(
                        np.array(predict_EEI[index]),  # predict_reward[0],
                        '--',
                        c=color,
                        label=sim_num)
                    plt.plot(
                        np.array(actual_EEI[index]),
                        '-',
                        c=color)
                curr_plot += 1
                plt.xlabel("step")
                plt.ylabel("{}".format(index_state_to_vis))

            plt.legend(list_of_candidate)
            plt.tight_layout()
            plt.savefig(save_dir + "/EEI_iter{}_rollout{}_step{}".format(iter, rollout_num, step_number))
            #plt.show()
            plt.clf()


def get_EEI(observations, actions,Final_EEI,test_rollout):
        """get rewards of a given (observations, actions) pair

                Args:
                    observations: (batchsize, obs_dim) or (obs_dim,)
                    actions: (batchsize, ac_dim) or (ac_dim,)

                Return:
                    EEI_total: (batchsize,1) or (1,), reward for that pair
                    done: (batchsize,1) or (1,), True if reaches terminal state
                """
        reward_dict = {}
        # initialize and reshape as needed, for batch mode
        if len(observations.shape) == 1:
            observations = np.expand_dims(observations, axis=0)
            actions = np.expand_dims(actions, axis=0)
            batch_mode = False
        else:
            batch_mode = True

            # get vars
            pendulum_angle = observations[:-1, 1]
            arm_angulr_velocity = observations[:-1, 2]
            action = actions[:,0]

            total_error=0
            total_energy=0
            total_control_accurecy = []
            total_energies = []
            total_EEIs=[]


            # calc EEI element #############don't change above
            for i in range(len(pendulum_angle)):
                new_error= pendulum_angle[i]**2
                new_energy= np.abs(arm_angulr_velocity[i]*action[i])
                total_error += new_error
                total_energy += new_energy
                total_control_accurecy.append(1/total_error)
                total_energies.append(total_energy)
                total_EEIs.append(1/total_error/total_energy)

            total_control_accurecy = np.array(total_control_accurecy)
            total_energies = np.array(total_energies)
            total_EEIs = np.array(total_EEIs)


            if Final_EEI:
                print("hello")
                ind_error = pendulum_angle ** 2
                ind_energy = (np.dot(np.abs(action), np.abs(arm_angulr_velocity)))
                final_error = np.sum(ind_error)
                final_energy = np.sum(ind_energy)
                final_EEI = 1 / final_energy / final_error


                if test_rollout:
                    print("final EEI:{} & {}. final control accuracy:{} & {}. final energy{} & {}".format(total_EEIs[-1],final_EEI,
                                                                                          total_control_accurecy[-1],1/final_error,
                                                                                          total_energies[-1],final_energy))

            # return
            #if not Final_EEI:
             #   return final_EEI,final_error,final_energy
            return total_EEIs,total_control_accurecy,total_energies



def get_actual_EEI(observation, action,previous_Error,previous_Ene,Final_EEI,test_rollout):

    #define EEI
    pendulum_angle= observation[1]
    arm_angulr_velocity=observation[2]
    torque=action[0]


    # calc EEI element #############don't change above

    new_error = pendulum_angle ** 2
    new_energy = np.abs(arm_angulr_velocity * torque)
    total_error = new_error +previous_Error
    total_energy = new_energy + previous_Ene
    total_EEI = 1/total_error/total_energy

    return total_EEI, total_error, total_energy


def get_actual_EEI_kai(observation_list, action_list):
    pendulum_angles = np.array(observation_list)[1:,1]
    arm_angulr_velocites = np.array(observation_list)[1:,2]
    action_list = np.array(action_list)[:,0,0]
    #ind_error = pendulum_angles ** 2
    #print("shape angle{} velocity {} action {}".format(pendulum_angles.shape,arm_angulr_velocites.shape,action_list.shape))

    ind_error =np.dot(pendulum_angles, pendulum_angles)
    ind_energy = (np.dot(np.abs(action_list), np.abs(arm_angulr_velocites)))
    #print("observe {} & action {} ".format(observation_list.shape, action_list.shape))
    #print("ind error{} {} & ind energy{} {} ".format(ind_error.shape,ind_error,ind_energy.shape,ind_energy))
    final_error = np.sum(ind_error)
    final_energy = np.sum(ind_energy)
    final_EEI = 1 / final_energy / final_error
    """
    final_error = 0
    final_energy = 0
    final_EEI = 0
    """


    return final_EEI, final_error, final_energy


def get_actual_EEI_reacher(observation, action,previous_Error,previous_Ene,Final_EEI,test_rollout):

    #define EEI
    tip_xerr= observation[8]
    tip_yerr = observation[9]
    arm_angulr_velocity0=observation[6]
    arm_angulr_velocity1 = observation[7]
    torque0=action[0]
    torque1 = action[1]


    # calc EEI element #############don't change above

    new_error = tip_xerr ** 2 + tip_yerr ** 2
    new_energy = np.abs(arm_angulr_velocity0 * torque0) +np.abs(arm_angulr_velocity1 * torque1)
    total_error = new_error +previous_Error
    total_energy = new_energy + previous_Ene
    total_EEI = 1/total_error/total_energy

    return total_EEI, total_error, total_energy
