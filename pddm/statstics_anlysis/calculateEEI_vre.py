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
plt.rcParams["font.size"] = 18
def vis_iter_graph(args, load_dir0):

    ##########################
    ## load in data
    ##########################

    #params0
    paramfile0 = open(load_dir0 + '/params.pkl', 'rb')
    params0 = pickle.load(paramfile0)
    env_name0 = params0.env_name

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


    ##########################
    ## visualize
    ##########################

    #create env
    #use_env, dt_from_xml = create_env(env_name)

    ###added by hamada
    #use_env=wrappers.Monitor(use_env, args.save_dir, force=True)

    rewards = []
    scores = []
    #save_dir =load_dir0+"/{}_aftercal/".format(time.strftime("%Y-%m-%d"))
    save_dir = load_dir0 + "/aftercaleei/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    iter_num ="iter"+str(args.iter_num)
    print("env name {}".format(re.findall('r.?a',env_name0)))
    for vis_index in range(len(rollouts_info0)):

        print("\n\nROLLOUT NUMBER ", vis_index, " .... num steps loaded: ",
              rollouts_info0[vis_index]['actions'].shape[0])

        # visualize rollouts from this iteration
        states0 = rollouts_info0[vis_index]["observations"]
        actions0 = rollouts_info0[vis_index]["actions"]
        if args.perturb:
            perturb0 = rollouts_info0[vis_index]["disturbances"].reshape([500, 1])


        fig = plt.figure()
        until_where = 200
        error = 0
        energy = 0
        energy2 = 0
        error2 = 0

        for ind in range(actions0.shape[0]):
            new_energy = np.abs(states0[ind, 6] * actions0[ind, 0]) +np.abs(states0[ind, 7] * actions0[ind, 1])
            new_error = states0[ind, 8] ** 2 +states0[ind, 9] ** 2
            #new_error2 = np.abs(states0[ind, 1])
            energy = energy + new_energy
            error = error + new_error

            #error2 = error2 + new_error2

        EEI = 1 / error / energy
        # EEI2 = 1/error/enrrgy2
        #EEI3 = 1 / error2 / energy

        print("EEI:{} Ene:{} Error:{}".format(EEI, energy, error))
        # print("EEI2:{} Ene2:{} Error:{}".format(EEI2, energy2, error))
        #print("EEI:{} Ene:{} Error:{}".format(EEI3, energy, error2))

        if args.eval:
            np.save(save_dir + "/eval_eeis_{}.npy".format(args.iter_num), np.array(EEI))
            np.save(save_dir + "/eval_ers_{}.npy".format(args.iter_num), np.array(error))
            np.save(save_dir + "/eval_enes_{}.npy".format(args.iter_num), np.array(energy))
            # np.save(save_dir + "/eval_eeis2_{}.npy".format(args.iter_num), np.array(EEI2))
            # np.save(save_dir + "/eval_ers2_{}.npy".format(args.iter_num), np.array(error2))
            # np.save(save_dir + "/eval_enes2_{}.npy".format(args.iter_num), np.array(energy2))
            # np.save(save_dir + "/eval_eeis3_{}.npy".format(args.iter_num), np.array(EEI3))
        else:
            np.save(save_dir + "/eeis_{}.npy".format(args.iter_num), np.array(EEI))
            np.save(save_dir + "/ers_{}.npy".format(args.iter_num), np.array(error))
            np.save(save_dir + "/enes_{}.npy".format(args.iter_num), np.array(energy))
            # np.save(save_dir + "/eeis2_{}.npy".format(args.iter_num), np.array(EEI2))
            # np.save(save_dir + "/ers2_{}.npy".format(args.iter_num), np.array(error2))
            # np.save(save_dir + "/enes2_{}.npy".format(args.iter_num), np.array(energy2))
            # np.save(save_dir + "/eeis3_{}.npy".format(args.iter_num), np.array(EEI3))




def main():
    ##########################
    ## vars to specify
    ##########################

    parser = argparse.ArgumentParser()
    parser.add_argument('--job_path0', type=str)  #address this path WRT your working directory
    #parser.add_argument('--job_path3', type=str)  # address this path WRT your working directory
    parser.add_argument('--iter_num', type=int, default=1)  #if eval is False, visualize rollouts from this iteration
    parser.add_argument('--eval', action="store_true")  # if this is True, visualize rollouts from rollouts_eval.pickle
    ##added by hamadda
    parser.add_argument('--perturb', action="store_true")


    #parser.add_argument('--agent_type', type=str)
    args = parser.parse_args()

    ##########################
    ## do visualization
    ##########################

    #directory to load from
    load_dir0 = os.path.abspath(args.job_path0)


    print("LOADING FROM: ", load_dir0)

    assert os.path.isdir(load_dir0)

    try:
        vis_iter_graph(args, load_dir0)
    except (KeyboardInterrupt, SystemExit):
        print('Terminating...')
        sys.exit(0)
    except Exception as e:
        print('ERROR: Exception occured while running a job....')
        traceback.print_exc()


if __name__ == '__main__':
    main()
