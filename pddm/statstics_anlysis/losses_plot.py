import numpy as  np
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns
import argparse
import os
from statannot import add_stat_annotation
import time
from pylab import rcParams
#rcParams['figure.figsize'] = 30,30
plt.rcParams["font.size"] = 15



#df_melt=df


def main():

    # Parse arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('-j', '--jobs', action='append', nargs='+', help='job/experiment')
    #parser.add_argument('-l', '--labels', action='append', nargs='?', help='label for plotting that experiment')
    #parser.add_argument('-plot_rew', '--plot_rew', action='store_true')
    parser.add_argument(
        '--save_dir', type=str,
        default='../output/cheetah')
    parser.add_argument(
        '--save_num', type=str,
        default='1')

    args = parser.parse_args()
    if not os.path.isdir(args.save_dir):
        os.makedirs(args.save_dir)
    jobs = args.jobs[0]
    save_dir = args.save_dir + "/{}_lossesplot/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    # scan labels
    """
    if args.labels is not None:
        assert (len(jobs)==len(args.labels)), "The number of labels has to be same as the number of jobs"
    else:
        args.labels = ['']*len(jobs)
        """
    start=0
    end=30
    # Scan jobs and plot
    colors=['b','r', 'g',  'k', 'c', 'm', 'pink', 'purple']
    all_data=[]
    for i in range(len(jobs)):
        data = []
        for j in range(start,end):
                data.append(np.load(jobs[i] +"/losses/validation_onPol_losses_iter{}.npy".format(j))[0])
                #data.append(np.load(jobs[i] + "/aftercaleei/" + "eval_ers_{}.npy".format(j)).reshape(1,)[0])
        data = np.array(data).flatten()
        all_data.append(data)
    data_dic={"data{}".format(i):all_data[i] for i in range(len(all_data))}

    df = pd.DataFrame(data_dic
    )

    df_melt = pd.melt(df)
    # print(df_melt.head())
    print(df_melt)
    ##   variable      value
    ## 0     leaf   9.446465
    ## 1     leaf  11.163702
    ## 2     leaf  14.296799
    ## 3     leaf   7.441026
    ## 4     leaf  11.004554

    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1)

    plt.plot(data_dic["data0"],"b", linestyle="solid")
    plt.plot(data_dic["data1"],"b", linestyle="dashed")
    plt.plot(data_dic["data2"],"b", linestyle="dotted")
    plt.plot(data_dic["data3"],"r")
    ax.set_xlabel('Iteration')
    ax.set_ylabel('Loss')

    plt.savefig(save_dir + "/losses_{}.png".format(args.save_num), bbox_inches='tight')

    #plt.show()

if __name__ == '__main__':
    main()