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

#my imports
from pddm.samplers import trajectory_sampler
from pddm.utils.helper_funcs import do_groundtruth_rollout
from pddm.utils.helper_funcs import turn_acs_into_acsK
from pddm.utils.calculate_costs import calculate_costs
import pddm

##added by hamada
from pddm.utils.utils import state_prediction_inverted_pendulum
from pddm.utils.utils import eei_inverted_pendulum

class Step_Experiment(object):

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
        self.random_sampling_params = dict(sample_velocities = params.rand_policy_sample_velocities,
                                        vel_min = params.rand_policy_vel_min,
                                        vel_max = params.rand_policy_vel_max,
                                        hold_action = params.rand_policy_hold_action,)

        #aded by Hamada
        self._iter= iter
        self._save_dir = save_dir
        self._sim_ver = sim_ver
        self._control_delta = control_delta

    def get_action(self, step_number, curr_state_K, actions_taken_so_far,
                   starting_fullenvstate, evaluating, take_exploratory_actions,iter,rollout_num):
        """Select optimal action

        Args:
            curr_state_K:
                current "state" as known by the dynamics model
                actually a concatenation of (1) current obs, and (K-1) past obs
            step_number:
                which step number the rollout is currently on (used to calculate costs)
            actions_taken_so_far:
                used to restore state of the env to correct place,
                when using ground-truth dynamics
            starting_fullenvstate
                full state of env before this rollout, used for env resets (when using ground-truth dynamics)
            evaluating
                if True: default to not having any noise on the executing action
            take_exploratory_actions
                if True: select action based on disagreement of ensembles
                if False: (default) select action based on predicted costs

        Returns:
            best_action: optimal action to perform, according to this controller
            resulting_states_list: predicted results of executing the candidate action sequences
        """

        ############################
        ### sample N random candidate action sequences, each of length horizon
        ############################

        np.random.seed()  # to get different action samples for each rollout

        all_samples = []
        junk = 1
        for i in range(self.N):
            sample = []
            for num in range(self.horizon):
                #sample.append(self.rand_policy.get_action(junk, prev_action=None,
                 #                                        random_sampling_params=self.random_sampling_params,
                 #                                       hold_action_overrideToOne=True)[0])
                #sample.append(np.array([0.4,0.2]))
                sample.append(np.array([1, 0.]))
                #sample.append(np.array([-0.1, -0.1,-0.1,-0.1]))
                #print("hello")
            all_samples.append(np.array(sample))
        all_samples = np.array(all_samples)

        for i in range(0, self.horizon, self._control_delta):
            for j in range(self._control_delta):
                all_samples[:, i + j, :] = all_samples[:, i,:]  # TODO: check wheter it keep for control frquency added hamada

        ########################################################################
        ### make each action element be (past K actions) instead of just (curr action)
        ########################################################################

        #all_samples : [N, horizon, ac_dim]
        all_acs = turn_acs_into_acsK(actions_taken_so_far, all_samples, self.K,
                                     self.N, self.horizon)
        #all_acs : [N, horizon, K, ac_dim]

        ############################
        ### have model predict the result of executing those candidate action sequences
        ############################

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
            resulting_states_list = np.swapaxes(resulting_states_list, 0, 1)  #[ensSize, horizon+1, N, statesize]

        ############################
        ### evaluate the predicted trajectories
        ############################

        #calculate costs
        costs, mean_costs, std_costs = calculate_costs(resulting_states_list, all_samples,
                                self.reward_func, evaluating, take_exploratory_actions)

        #pick best action sequence
        best_score = np.min(costs)
        best_sim_number = np.argmin(costs)
        best_sequence = all_samples[best_sim_number]
        best_action = np.copy(best_sequence[0])

        #pick worst action sequense added by Hamada
        worst_sim_number = np.argmax(costs)

        #########################################
        ### execute the candidate action sequences on the real dynamics
        ### instead of just on the model
        ### useful for debugging/analysis...
        #########################################

        if self.execute_sideRollouts:
            #print("step number{}".format(step_number))
            if step_number  == self.K-1 :
                print("step number {}".format(step_number))

                state_prediction_inverted_pendulum(self.env,self.reward_func, resulting_states_list, all_samples, starting_fullenvstate,
                                                   actions_taken_so_far,
                                                   self._save_dir, self.plot_sideRollouts, best_sim_number, worst_sim_number,
                                                  iter, rollout_num, step_number)

                #print("Hello")
                """
                if self._sim_ver == "inverted_pendulum":
                    eei_inverted_pendulum(self.env, self.reward_func, resulting_states_list, all_samples,
                                               starting_fullenvstate,
                                               actions_taken_so_far,
                                               self._save_dir, self.plot_sideRollouts, best_sim_number,
                                               worst_sim_number,
                                               iter, rollout_num, step_number)
                    print("Hello")
                """

        return best_action, resulting_states_list
