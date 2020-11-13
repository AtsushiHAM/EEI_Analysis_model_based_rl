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

def vis_iter_graph(args, load_dir):

    ##########################
    ## load in data
    ##########################

    #params
    paramfile = open(load_dir + '/params.pkl', 'rb')
    params = pickle.load(paramfile)
    env_name = params.env_name

    #data to visualize
    if args.eval:
        with open(load_dir + '/saved_rollouts/rollouts_eval'+ str(args.iter_num) +'.pickle',
                  'rb') as handle:
            rollouts_info = pickle.load(handle)
    else:
        with open(
                load_dir + '/saved_rollouts/rollouts_info_' + str(args.iter_num) +
                '.pickle', 'rb') as handle:
            rollouts_info = pickle.load(handle)

    ##########################
    ## visualize
    ##########################

    #create env
    use_env, dt_from_xml = create_env(env_name)

    ###added by hamada
    #use_env=wrappers.Monitor(use_env, args.save_dir, force=True)

    rewards = []
    scores = []
    save_name=args.save_name
    save_dir =args.save_dir+"/{}_eachrowdata/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    iter_num ="iter"+str(args.iter_num)
    for vis_index in range(len(rollouts_info)):

        print("\n\nROLLOUT NUMBER ", vis_index, " .... num steps loaded: ", rollouts_info[vis_index]['actions'].shape[0])

        #visualize rollouts from this iteration
        states=rollouts_info[vis_index]["observations"]
        actions=rollouts_info[vis_index]["actions"]
        perturb = rollouts_info[vis_index]["disturbances"].reshape([rollouts_info[vis_index]["disturbances"].shape[0],1])
        subfigs = actions.shape[1] +states.shape[1] +perturb.shape[1]
        fig = plt.figure()
        for k in range(perturb.shape[1]):
            plt.subplot(subfigs,1,k+1)
            plt.plot(perturb,'m')
            plt.ylabel("perturb{}".format(k))
        for i in range(actions.shape[1]):
            plt.subplot(subfigs,1,perturb.shape[1]+i+1)
            plt.plot(actions[:,i],'k')
            plt.ylabel("action{}".format(i))
        for j in range(states.shape[1]):
            plt.subplot(subfigs, 1, j+actions.shape[1]+1+perturb.shape[1])
            plt.plot(states[:, j])
            plt.ylabel("state{}".format(j))
        plt.savefig(save_dir + "/{}_iter{}_rollout{}".format(args.save_name,str(args.iter_num),str(vis_index)), bbox_inches='tight')





def main():
    ##########################
    ## vars to specify
    ##########################

    parser = argparse.ArgumentParser()
    parser.add_argument('--job_path', type=str)  #address this path WRT your working directory
    parser.add_argument('--iter_num', type=int, default=1)  #if eval is False, visualize rollouts from this iteration
    parser.add_argument('--eval', action="store_true")  # if this is True, visualize rollouts from rollouts_eval.pickle
    ##added by hamada
    parser.add_argument('--save_dir', type=str)
    parser.add_argument('--perturb', action="store_true")
    parser.add_argument('--save_name', type=str)
    args = parser.parse_args()

    ##########################
    ## do visualization
    ##########################

    #directory to load from
    load_dir = os.path.abspath(args.job_path)
    print(load_dir)
    print("LOADING FROM: ", load_dir)
    assert os.path.isdir(load_dir)

    try:
        vis_iter_graph(args, load_dir)
    except (KeyboardInterrupt, SystemExit):
        print('Terminating...')
        sys.exit(0)
    except Exception as e:
        print('ERROR: Exception occured while running a job....')
        traceback.print_exc()


if __name__ == '__main__':
    main()
