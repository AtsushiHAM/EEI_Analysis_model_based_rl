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
from pddm.classic_pollicy.base_programing.PID import PID

class PID_Policy(object):

    def __init__(self, env, dyn_models, reward_func, rand_policy, use_ground_truth_dynamics,
                 execute_sideRollouts, plot_sideRollouts, params,save_dir,iter):

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

        ###param for PID by Hamada
        self.pid = PID(P=7., I=0., D=2., delta_time=self.env.env.env.dt, target_pos=0.)

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
                sample.append(self.rand_policy.get_action(junk, prev_action=None, random_sampling_params=self.random_sampling_params, hold_action_overrideToOne=True)[0])
            all_samples.append(np.array(sample))
        all_samples = np.array(all_samples)

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

        theta = curr_state_K[0][1]
        best_action,_= self.pid.update(theta)
        best_action = best_action.reshape([1])
        best_action=np.clip(best_action,-1,1)

        #pick worst action sequense added by Hamada
        worst_sim_number = np.argmax(costs)
        resulting_states_list=[]



        return best_action, resulting_states_list
