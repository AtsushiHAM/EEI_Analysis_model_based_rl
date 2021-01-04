#####################################
#
# Written by Atsushi Hamada
# E-mail: a.hamada@neuro.mech.tohoku.ac.jp
#
# 12/15/2020
#
#######################################

import numpy as np
import pickle
import sys
import os
import argparse
import traceback

###import by hamada
import matplotlib.pyplot as plt
import time
from pylab import rcParams
rcParams['figure.figsize'] = 30,30
plt.rcParams["font.size"] = 25
plt.rcParams["lines.linewidth"]= 10

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
        with open(
                #load_dir + '/training_data/val_rollouts_rand.pickle','rb') as handle:
                load_dir + '/training_data/train_rollouts_rand.pickle', 'rb') as handle:
            rollouts_info = pickle.load(handle)
    else:
        with open(
             load_dir + '/training_data/train_rollouts_rand.pickle','rb') as handle:
            #load_dir + '/training_data/normalization_data_0.pickle', 'rb') as handle:

            #load_dir + '/training_data/val_rollouts_onPol_iter0.pickle', 'rb') as handle:
            #load_dir + '/training_data/val_rollouts_rand.pickle', 'rb') as handle:#normalization_data_0.pickle

            rollouts_info = pickle.load(handle)

    ##########################
    ## visualize
    ##########################

    save_dir =args.save_dir+"/{}_eachrowdata/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    from_where=450
    until_where=100
    for vis_index in range(1):
    #for vis_index in range(len(rollouts_info)):

        print("\n\nROLLOUT NUMBER ", vis_index, " .... num steps loaded: ", rollouts_info[vis_index]['actions'].shape[0])

        #visualize rollouts from this iteration
        states=rollouts_info[vis_index]["observations"]
        states=states[from_where:,:]
        #actions=rollouts_info[vis_index]["actions"]

        cm = plt.get_cmap('Blues')  # with torque sensor
        #cm = plt.get_cmap('Reds')  # without torque sensor
        # m = plt.get_cmap('Greens')  # Baseline
        cm_interval = [(i) / ((states.shape[0]) - 1) for i in range((states.shape[0]))]
        cm = cm(cm_interval)

        # drawing phase orbit for 6 joints of HC
        """
        for k in range(6):
            plt.subplot(2, 3, k+1)
            plt.plot(states[:, 3+k], states[:, 3 + 9+k], color=cm[10], zorder=1, markersize=200)
            plt.scatter(x=states[:, 3+k], y=states[:, 3 + 9+k], s=400, c=cm, zorder=2)
            plt.ylabel("Ang velocity{}".format(3 + 9+k))
            plt.xlabel("Ang{}".format(3+k))
            plt.subplots_adjust(right=0.7)"""

        for k in range(2):
            plt.subplot(2, 3, k + 1)
            plt.plot(states[:, 3 + k], states[:, 3 + 5 + k], color=cm[10], zorder=1, markersize=200)
            plt.scatter(x=states[:, 3 + k], y=states[:, 3 + 5 + k], s=400, c=cm, zorder=2)
            plt.ylabel("Ang velocity{}".format(3 + 5 + k))
            plt.xlabel("Ang{}".format(3 + k))
            plt.subplots_adjust(right=0.7)

            """"""

        plt.savefig(save_dir + "/{}_iter{}_rollout{}_speed".format(args.save_name,str(args.iter_num),str(vis_index)), bbox_inches='tight')



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
