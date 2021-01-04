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
import pickle
import sys
import os
import argparse
import matplotlib.pyplot as plt
import matplotlib.lines as mlines
import traceback
plt.rcParams["font.size"] = 45
#my imports
from pddm.utils.helper_funcs import plot_mean_std

def main():

    # Parse arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('-j', '--jobs', action='append', nargs='+', help='job/experiment')
    parser.add_argument('-l', '--labels', action='append', nargs='?', help='label for plotting that experiment')
    parser.add_argument('-plot_rew', '--plot_rew', action='store_true')
    parser.add_argument(
        '--save_dir', type=str,
        default='../output/cheetah')
    parser.add_argument(
        '--data_type', type=str,
        default='rewards')
    parser.add_argument(
        '--save_num', type=str,
        default='1')

    args = parser.parse_args()
    jobs = args.jobs[0]

    # scan labels
    if args.labels is not None:
        assert (len(jobs)==len(args.labels)), "The number of labels has to be same as the number of jobs"
    else:
        args.labels = ['']*len(jobs)

    # Scan jobs and plot
    colors=['b','r', 'g',  'k', 'c', 'm', 'pink', 'purple']
    for i in range(len(jobs)):
        if args.plot_rew:
            print("LOOKING AT REW")
            resulting_states_list = np.load(jobs[i] + '/MPE_GT_0.npy')
            true_states = np.load(jobs[i] + '/MPE_NN_0.npy')
        else:
            print("LOOKING AT SCORE")

            if args.data_type=="gravity0":
                resulting_states_list_0 = np.load(jobs[i] + '/MPE_GT_0.npy')
                true_states_0 = np.load(jobs[i] + '/MPE_NN_0.npy')
                indices_to_vis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            elif args.data_type=="gravity0mass":
                resulting_states_list_0 = np.load(jobs[i] + '/MPE_GT_0_0.33.npy')
                true_states_0 = np.load(jobs[i] + '/MPE_NN_0_0.33.npy')
                resulting_states_list_981 = np.load(jobs[i] + '/MPE_GT_0_1.0.npy')
                true_states_981 = np.load(jobs[i] + '/MPE_NN_0_1.0.npy')
                indices_to_vis = [0, 1, 2, 3, 4, 5, 6, 7]#[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            elif args.data_type=="gravity981":
                resulting_states_list_981 = np.load(jobs[i] + '/MPE_GT_981.npy')
                true_states_981 = np.load(jobs[i] + '/MPE_NN_981.npy')
                indices_to_vis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            elif args.data_type == "gravityall":
                resulting_states_list_0 = np.load(jobs[i] + '/MPE_GT_0_0.33.npy')
                true_states_0 = np.load(jobs[i] + '/MPE_NN_0_0.33.npy')
                resulting_states_list_981 = np.load(jobs[i] + '/MPE_GT_981_0.33.npy')
                true_states_981 = np.load(jobs[i] + '/MPE_NN_981_0.33.npy')
                indices_to_vis = [0, 1, 2, 3, 4, 5, 6, 7]#[0, 1, 2, 3, 4, 5, 6, 7, -4, -3, -2, -1]
            elif args.data_type == "gravityallhc":
                resulting_states_list_0 = np.load(jobs[i] + '/MPE_GT_881.npy')
                true_states_0 = np.load(jobs[i] + '/MPE_NN_881.npy')
                resulting_states_list_981 = np.load(jobs[i] + '/MPE_GT_981.npy')
                true_states_981 = np.load(jobs[i] + '/MPE_NN_981.npy')
                indices_to_vis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

        curr_plot = 1

        num_plots = len(indices_to_vis)
        fig = plt.figure(figsize=(30.0, 35.0))
        for index_state_to_vis in (indices_to_vis):

            plt.subplot(num_plots, 1, curr_plot)
            # plt.ylabel(index_state_to_vis)

            #color = cmap(num_sims.index(sim_num) / len(num_sims))

            ###if(step_number%10==0):
            if args.data_type=="gravity0":
                plt.plot(resulting_states_list_0[:, index_state_to_vis], '--', color=colors[i])
                plt.plot(true_states_0[:, index_state_to_vis], '-', color=colors[i])
                # plt.plot(resulting_states_list_981[:, index_state_to_vis], '--', color=colors[i+1])
                # plt.plot(true_states_981[:, index_state_to_vis], '-', color=colors[i+1])
            elif args.data_type=="gravity981":
                plt.plot(resulting_states_list_981[:, index_state_to_vis], '--', color=colors[i + 1])
                plt.plot(true_states_981[:, index_state_to_vis], '-', color=colors[i+1])
            elif args.data_type == "gravityall" or args.data_type == "gravityallhc"or args.data_type == "gravity0mass":
                plt.plot(resulting_states_list_0[:, index_state_to_vis], '--', color=colors[i])
                plt.plot(true_states_0[:, index_state_to_vis], '-', color=colors[i])
                plt.plot(resulting_states_list_981[:, index_state_to_vis], '--', color=colors[i+1])
                plt.plot(true_states_981[:, index_state_to_vis], '-', color=colors[i+1])


            curr_plot += 1
    plt.xlabel("step")
    plt.ylabel("state{}".format(index_state_to_vis))

    plt.savefig(args.save_dir + "/{}_{}".format(args.data_type, args.save_num), bbox_inches='tight')
    #plt.show()

if __name__ == '__main__':
    main()