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
import traceback

#my imports
from pddm.utils.helper_funcs import visualize_rendering
from pddm.utils.helper_funcs import create_env
import pddm.envs


###import by hamada
from gym import wrappers
import matplotlib.pyplot as plt
import time
import re
from pylab import rcParams
rcParams['figure.figsize'] = 30,30
plt.rcParams["font.size"] = 25
plt.rcParams["lines.linewidth"]= 8
def vis_iter_graph(args, load_dir0,load_dir1,load_dir2):

    ##########################
    ## load in data
    ##########################

    #params0
    paramfile0 = open(load_dir0 + '/params.pkl', 'rb')
    params0 = pickle.load(paramfile0)
    env_name0 = params0.env_name

    # params1
    paramfile1 = open(load_dir1 + '/params.pkl', 'rb')
    params1 = pickle.load(paramfile1)
    env_name1 = params1.env_name

    # params2
    paramfile2 = open(load_dir2 + '/params.pkl', 'rb')
    params2 = pickle.load(paramfile2)
    env_name2 = params2.env_name

    #data to visualize
    if args.eval:
        with open(load_dir0 + '/saved_rollouts/rollouts_eval'+ str(args.iter_num) +'.pickle',
                  'rb') as handle:
            rollouts_info0 = pickle.load(handle)
    else:
        with open(
                load_dir0 + '/saved_rollouts/rollouts_info_' + str(args.iter_num) +
                '.pickle', 'rb') as handle0:
            rollouts_info0 = pickle.load(handle0)

    #data to visualize
    if args.eval:
        with open(load_dir1 + '/saved_rollouts/rollouts_eval'+ str(args.iter_num) +'.pickle',
                  'rb') as handle1:
            rollouts_info1 = pickle.load(handle1)
    else:
        with open(
                load_dir1 + '/saved_rollouts/rollouts_info_' + str(args.iter_num) +
                '.pickle', 'rb') as handle1:
            rollouts_info1 = pickle.load(handle1)

    #data to visualize
    if args.eval:
        with open(load_dir2 + '/saved_rollouts/rollouts_eval'+ str(args.iter_num) +'.pickle',
                  'rb') as handle2:
            rollouts_info2 = pickle.load(handle2)
    else:
        with open(
                load_dir2 + '/saved_rollouts/rollouts_info_' + str(args.iter_num) +
                '.pickle', 'rb') as handle2:
            rollouts_info2 = pickle.load(handle2)



    ##########################
    ## visualize
    ##########################

    #create env
    #use_env, dt_from_xml = create_env(env_name)

    ###added by hamada
    #use_env=wrappers.Monitor(use_env, args.save_dir, force=True)

    rewards = []
    scores = []
    save_name=args.save_name
    save_dir =args.save_dir+"/{}_rowdata/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    if re.findall('i.?v', env_name1 ):
        agent_type="ip"
    elif re.findall('r.?a',env_name1):
        agent_type = "re"
    iter_num ="iter"+str(args.iter_num)
    print("env name {}".format(re.findall('r.?a',env_name1)))
    for vis_index in range(len(rollouts_info0)):

        print("\n\nROLLOUT NUMBER ", vis_index, " .... num steps loaded: ", rollouts_info0[vis_index]['actions'].shape[0])

        #visualize rollouts from this iteration
        states0=rollouts_info0[vis_index]["observations"]
        actions0=rollouts_info0[vis_index]["actions"]
        if args.perturb:
            perturb0 = rollouts_info0[vis_index]["disturbances"].reshape([500,1])
        # visualize rollouts from this iteration
        states1 = rollouts_info1[vis_index]["observations"]
        actions1 = rollouts_info1[vis_index]["actions"]
        if args.perturb:
            perturb1 = rollouts_info1[vis_index]["disturbances"].reshape([500, 1])
        # visualize rollouts from this iteration
        states2 = rollouts_info2[vis_index]["observations"]
        actions2 = rollouts_info2[vis_index]["actions"]
        if args.perturb:
            perturb2 = rollouts_info2[vis_index]["disturbances"].reshape([500, 1])
        if args.perturb:
            subfigs = actions0.shape[1] +states1.shape[1] +perturb0.shape[1]
        else:
            subfigs = actions0.shape[1] + states1.shape[1]

        cm0 = plt.get_cmap('Blues')  # 他にも'jet'など
        cm0_interval = [(i) / ((states0.shape[0]) - 1) for i in range((states0.shape[0]))]
        cm0 = cm0(cm0_interval)

        cm1 = plt.get_cmap('Reds')  # 他にも'jet'など
        cm1_interval = [(i) / ((states1.shape[1]) - 1) for i in range((states1.shape[0]))]
        cm1 = cm1(cm1_interval)

        cm2 = plt.get_cmap('Greens')  # 他にも'jet'など
        cm2_interval = [(i) / ((states2.shape[0]) - 1) for i in range((states2.shape[0]))]
        cm2 = cm2(cm2_interval)

        plt.scatter(x=states0[:, 1], y=states0[:, 3], c=cm0, s=300, zorder=2)  # marker=">"
        plt.plot(states0[:, 1], states0[:, 3], markersize=100, marker="4", zorder=1, color=cm0[400], linestyle='None')
        #plt.scatter(x=states1[:, 1], y=states1[:, 3], c=cm1, s=300, zorder=2)  # marker=">"
        #plt.plot(states1[:, 1], states1[:, 3], markersize=100, marker="4", zorder=1, color=cm1[400], linestyle='None')
        plt.scatter(x=states2[:, 1], y=states2[:, 3], c=cm2, s=300, zorder=2)  # marker=">"
        plt.plot(states2[:, 1], states2[:, 3], markersize=100, marker="4", zorder=1, color=cm2[400], linestyle='None')

        plt.ylabel("Pendulum ang. vel. [rad/s]")
        plt.xlabel("Pendulum ang. [rad]")



        if args.eval:
            plt.savefig(save_dir + "/eval_{}_iter{}_rollout{}_{}_phase".format(args.save_name, str(args.iter_num), str(vis_index),args.data_type),
                        bbox_inches='tight')
        else:
            plt.savefig(save_dir + "/{}_iter{}_rollout{}_{}_phase".format(args.save_name,str(args.iter_num),str(vis_index),args.data_type), bbox_inches='tight')





def main():
    ##########################
    ## vars to specify
    ##########################

    parser = argparse.ArgumentParser()
    parser.add_argument('--job_path0', type=str)  #address this path WRT your working directory
    parser.add_argument('--job_path1', type=str)  # address this path WRT your working directory
    parser.add_argument('--job_path2', type=str)  # address this path WRT your working directory
    #parser.add_argument('--job_path3', type=str)  # address this path WRT your working directory
    parser.add_argument('--iter_num', type=int, default=1)  #if eval is False, visualize rollouts from this iteration
    parser.add_argument('--eval', action="store_true")  # if this is True, visualize rollouts from rollouts_eval.pickle
    ##added by hamada
    parser.add_argument('--save_dir', type=str)
    parser.add_argument('--perturb', action="store_true")
    parser.add_argument('--save_name', type=str)
    parser.add_argument('--data_type', type=str)
    #parser.add_argument('--agent_type', type=str)
    args = parser.parse_args()

    ##########################
    ## do visualization
    ##########################

    #directory to load from
    load_dir0 = os.path.abspath(args.job_path0)
    load_dir1 = os.path.abspath(args.job_path1)
    load_dir2 = os.path.abspath(args.job_path2)

    print("LOADING FROM: ", load_dir0)
    print("LOADING FROM: ", load_dir1)
    print("LOADING FROM: ", load_dir2)
    assert os.path.isdir(load_dir0)
    assert os.path.isdir(load_dir1)
    assert os.path.isdir(load_dir2)

    try:
        vis_iter_graph(args, load_dir0,load_dir1,load_dir2)
    except (KeyboardInterrupt, SystemExit):
        print('Terminating...')
        sys.exit(0)
    except Exception as e:
        print('ERROR: Exception occured while running a job....')
        traceback.print_exc()


if __name__ == '__main__':
    main()
