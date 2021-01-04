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

import numpy as np
import copy
import matplotlib.pyplot as plt

# my imports
from pddm.samplers import trajectory_sampler
from pddm.utils.helper_funcs import do_groundtruth_rollout
from pddm.utils.helper_funcs import turn_acs_into_acsK
from pddm.utils.calculate_costs import calculate_costs

# Hamada imports
#from pddm.scripts.train import JOB_PATH
from pddm.utils.utils import state_prediction_inverted_pendulum
from pddm.utils.utils import reward_prediction
#from pddm.utils.utils import state_prediction_inverted_pendulum
from pddm.utils.utils import eei_inverted_pendulum

class MPPI(object):

    def __init__(self, env, dyn_models, reward_func, rand_policy, use_ground_truth_dynamics,
                 execute_sideRollouts, plot_sideRollouts, params,save_dir,iter,sim_ver,control_delta):

        ###########
        ## params
        ###########
        self.K = params.K
        self.horizon = params.horizon
        self.N = params.num_control_samples
        self.rand_policy = rand_policy
        self.use_ground_truth_dynamics = use_ground_truth_dynamics
        self.dyn_models = dyn_models
        self.execute_sideRollouts = execute_sideRollouts
        self.plot_sideRollouts = plot_sideRollouts
        self.reward_func = reward_func
        self.env = copy.deepcopy(env)

        #############
        ## init mppi vars
        #############
        self.sample_velocity = params.rand_policy_sample_velocities
        self.ac_dim = self.env.env.action_space.shape[0]
        self.mppi_kappa = params.mppi_kappa
        self.sigma = params.mppi_mag_noise * np.ones(self.env.action_dim)
        self.beta = params.mppi_beta
        self.mppi_mean = np.zeros((self.horizon, self.ac_dim))  #start mean at 0

        #aded by Hamada
        self._iter= iter
        self._save_dir = save_dir
        self._sim_ver = sim_ver
        self._control_delta = control_delta
        print("action low: {}".format(self.env.env.action_space.low)[0])


    ###################################################################
    ###################################################################
    #### update action mean using weighted average of the actions (by their resulting scores)
    ###################################################################
    ###################################################################

    def mppi_update(self, scores, mean_scores, std_scores, all_samples):

        #########################
        ## how each sim's score compares to the best score
        ##########################
        S = np.exp(self.mppi_kappa * (scores - np.max(scores)))  # [N,]
        denom = np.sum(S) + 1e-10

        ##########################
        ## weight all actions of the sequence by that sequence's resulting reward
        ##########################
        S_shaped = np.expand_dims(np.expand_dims(S, 1), 2)  #[N,1,1]
        weighted_actions = (all_samples * S_shaped)  #[N x H x acDim]
        self.mppi_mean = np.sum(weighted_actions, 0) / denom

        ##########################
        ## return 1st element of the mean, which corresps to curr timestep
        ##########################
        return self.mppi_mean[0]

    def get_action(self, step_number, curr_state_K, actions_taken_so_far,
                   starting_fullenvstate, evaluating, take_exploratory_actions,iter,rollout_num):

        # init vars
        curr_state_K = np.array(curr_state_K)  #[K, sa_dim]

        # remove the 1st entry of mean (mean from past timestep, that was just executed)
        # and copy last entry (starting point, for the next timestep)
        past_action = self.mppi_mean[0].copy()
        self.mppi_mean[:-1] = self.mppi_mean[1:]

        ##############################################
        ## sample candidate action sequences
        ## by creating smooth filtered trajecs (noised around a mean)
        ##############################################

        np.random.seed()  # to get different action samples for each rollout

        # sample noise from normal dist, scaled by sigma
        # hamada scale change from 1to 3
        if self._sim_ver =="inverted_pendulum":
            #all_samples = np.clip(all_samples, -1, 1)*self.env.env.env.action_space.high
            if (self.sample_velocity):
                eps_higherRange = np.random.normal(
                    loc=0, scale=1.0, size=(self.N, self.horizon,
                                            self.ac_dim)) * self.sigma
                lowerRange = 0.3 * self.sigma
                num_lowerRange = int(0.1 * self.N)
                eps_lowerRange = np.random.normal(
                    loc=0, scale=1.0, size=(num_lowerRange, self.horizon,
                                            self.ac_dim)) * lowerRange
                eps_higherRange[-num_lowerRange:] = eps_lowerRange
                eps = eps_higherRange.copy()
            else:
                eps = np.random.normal(
                    loc=0, scale=1.0, size=(self.N, self.horizon,
                                            self.ac_dim)) * self.sigma
        else:
            if (self.sample_velocity):
                eps_higherRange = np.random.normal(
                    loc=0, scale=1.0, size=(self.N, self.horizon,
                                            self.ac_dim)) * self.sigma
                lowerRange = 0.3 * self.sigma
                num_lowerRange = int(0.1 * self.N)
                eps_lowerRange = np.random.normal(
                    loc=0, scale=1.0, size=(num_lowerRange, self.horizon,
                                            self.ac_dim)) * lowerRange
                eps_higherRange[-num_lowerRange:] = eps_lowerRange
                eps = eps_higherRange.copy()
            else:
                eps = np.random.normal(
                    loc=0, scale=1.0, size=(self.N, self.horizon,
                                            self.ac_dim)) * self.sigma




        # actions = mean + noise... then smooth the actions temporally
        all_samples = eps.copy()
        for i in range(self.horizon):

            if(i==0):
                all_samples[:, i, :] = self.beta*(self.mppi_mean[i, :] + eps[:, i, :]) + (1-self.beta)*past_action
                #print("step number {} horizon {} mppi mean{}".format(step_number,i,self.mppi_mean[i, :]))
            else:
                all_samples[:, i, :] = self.beta*(self.mppi_mean[i, :] + eps[:, i, :]) + (1-self.beta)*all_samples[:, i-1, :]
                #print("step number {} horizon {} mppi mean{}".format(step_number,i,self.mppi_mean[i, :]))


        for i in range(0,self.horizon,self._control_delta):
            for j in range(self._control_delta):
                all_samples[:,i+j,:]=all_samples[:,i,:]# TODO: check wheter it keep for control frquency added hamada
        # The resulting candidate action sequences:
        # all_samples : [N, horizon, ac_dim]

        if self._sim_ver =="inverted_pendulum":
            all_samples = np.clip(all_samples, -1, 1)#*self.env.env.env.action_space.high
            #all_samples = np.clip(all_samples, self.env.env.env.action_space.low, self.env.env.env.action_space.high)
        else:
            all_samples = np.clip(all_samples, -1, 1)


        ########################################################################
        ### make each action element be (past K actions) instead of just (curr action)
        ########################################################################

        #all_samples : [N, horizon, ac_dim]
        #all_acs : [N, horizon, K, ac_dim]
        all_acs = turn_acs_into_acsK(actions_taken_so_far, all_samples, self.K,
                                     self.N, self.horizon)

        #################################################
        ### Get result of executing those candidate action sequences
        #################################################

        if self.use_ground_truth_dynamics:
            paths = trajectory_sampler.sample_paths_parallel(
                self.N,
                all_samples,
                actions_taken_so_far,
                starting_fullenvstate,
                self.env,
                suppress_print=True,
            )  #list of dicts, each w observations/actions/etc.

            #the taken number of paths is num_cpu*(floor(self.N/num_cpu))
            #rather than self.N, so update parameter accordingly
            self.N = len(paths)
            all_samples = all_samples[:self.N]

            resulting_states = [entry['observations'] for entry in paths]
            resulting_states = np.swapaxes(resulting_states, 0, 1)
            resulting_states_list = [resulting_states]
        else:
            resulting_states_list = self.dyn_models.do_forward_sim(
                [curr_state_K, 0], np.copy(all_acs))
            resulting_states_list = np.swapaxes(resulting_states_list, 0,1)  #[ensSize, horizon+1, N, statesize]

        ############################
        ### evaluate the predicted trajectories
        ############################

        # calculate costs [N,]
        costs, mean_costs, std_costs = calculate_costs(resulting_states_list, all_samples,
                                self.reward_func, evaluating, take_exploratory_actions)

        # uses all paths to update action mean (for horizon steps)
        # Note: mppi_update needs rewards, so pass in -costs
        selected_action = self.mppi_update(-costs, -mean_costs, std_costs, all_samples)

        ####added by hamada
        best_sim_num = np.argmin(costs)
        worst_sim_num = np.argmax(costs)

        #########################################
        ### execute the candidate action sequences on the real dynamics
        ### instead of just on the model
        ### useful for debugging/analysis...
        #########################################
        if self.execute_sideRollouts :
            if (step_number ) == 0 :
            #if (step_number % 500) == 400:

                state_prediction_inverted_pendulum(self.env,self.reward_func,resulting_states_list,all_samples,starting_fullenvstate,actions_taken_so_far,
                                       self._save_dir,self.plot_sideRollouts,best_sim_num,worst_sim_num,iter,rollout_num,step_number)


                #print("Hello")
                """
                if self._sim_ver == "inverted_pendulum":

                    eei_inverted_pendulum(self.env, self.reward_func, resulting_states_list, all_samples,
                                               starting_fullenvstate,
                                               actions_taken_so_far,
                                               self._save_dir, self.plot_sideRollouts, best_sim_num,
                                               worst_sim_num,
                                               iter, rollout_num, step_number)
                    

                    print("Hello")"""

        return selected_action, resulting_states_list
