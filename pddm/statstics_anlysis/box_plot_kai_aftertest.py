import numpy as  np
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns
import argparse
import os
from statannot import add_stat_annotation
import time
from pylab import rcParams
#rcParams['figure.figsize'] = 20,20
#plt.rcParams["font.size"] = 25



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
        '--data_type', type=str,
        default='rewards')
    parser.add_argument(
        '--save_num', type=str,
        default='1')

    args = parser.parse_args()
    if not os.path.isdir(args.save_dir):
        os.makedirs(args.save_dir)
    jobs = args.jobs[0]
    save_dir = args.save_dir + "/{}_boxplot/".format(time.strftime("%Y-%m-%d"))
    if not os.path.isdir(save_dir):
        os.makedirs(save_dir)
    # scan labels
    """
    if args.labels is not None:
        assert (len(jobs)==len(args.labels)), "The number of labels has to be same as the number of jobs"
    else:
        args.labels = ['']*len(jobs)
        """
    start=3
    end=30
    # Scan jobs and plot
    colors=['b','r', 'g',  'k', 'c', 'm', 'pink', 'purple']
    all_data=[]
    for i in range(len(jobs)):
        if args.data_type=="rewards":
            print("LOOKING AT REW")
            data=[]
            for j in range(start,end):
                data.append(np.load(jobs[i] + "/eval_rewards_{}.npy".format(j))[0])
                #data.append(np.load(jobs[i] + "/aftercaleei/"+"/eval_rewards_{}.npy".format(j)).reshape(1,)[0])
            data=np.array(data).flatten()
            all_data.append(data)
        elif args.data_type=="eei":
            data = []
            for j in range(start,end):
                #data.append(np.array([np.load(jobs[i] + "/aftercaleei/eval_eeis_{}.npy".format(j))])[0])
                data.append(np.load(jobs[i] + "/aftercaleei/"+ "eval_eeis_{}.npy".format(j)).reshape(1,)[0])
            data = np.array(data).flatten()
            all_data.append(data)
        elif args.data_type=="ene":
            data = []
            for j in range(start,end):
                #data.append(np.load(jobs[i] +"/eval_enes_{}.npy".format(j))[0])
                data.append(np.load(jobs[i] + "/aftercaleei/" + "/eval_enes_{}.npy".format(j)).reshape(1,)[0])
            data = np.array(data).flatten()
            all_data.append(data)
        elif args.data_type == "er":
            data = []
            for j in range(start,end):
                #data.append(np.load(jobs[i] +"/eval_ers_{}.npy".format(j))[0])
                data.append(np.load(jobs[i] + "/aftercaleei/" + "eval_ers_{}.npy".format(j)).reshape(1,)[0])
            data = np.array(data).flatten()
            all_data.append(data)
        elif args.data_type == "sp":
            data = []
            for j in range(start,end):
                #data.append(np.load(jobs[i] +"/eval_ers_{}.npy".format(j))[0])
                data.append(np.load(jobs[i] + "/aftercaleei/" + "eval_ers_{}.npy".format(j)).reshape(1,)[0])
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
    if len(all_data)==5:
        my_pal = {"data0": "b", "data1": "b", "data2": "b","data3":"r","data4":"g"}
    elif len(all_data) == 4:
        #my_pal = {"data0": "b", "data1": "b","data2":"r","data3":"g"}
        my_pal = {"data0": "b", "data1": "b", "data2": "b", "data3": "r"}
    elif len(all_data) == 3:
        #my_pal = {"data0": "b",  "data1": "r", "data2": "g"}
        my_pal = {"data0": "b", "data1": "b", "data2": "r"}
    elif len(all_data)==10:
        my_pal = {"data0": "b", "data1": "b", "data2": "b","data3":"r","data4":"g","data5": "b", "data6": "b", "data7": "b","data8":"r","data9":"g"}
    sns.set()
    sns.set_style('whitegrid')
    sns.set_palette('Set3')
    sns.stripplot(x='variable', y='value', data=df_melt, jitter=True, color="black", ax=ax)
    # sns.boxplot(x='variable', y='value', data=df_melt, showfliers=True, ax=ax, palette=my_pal )
    sns.boxplot(x='variable', y='value', data=df_melt, showfliers=True, ax=ax, showmeans=True, palette=my_pal,
                meanprops={"marker": "s", "markerfacecolor": "white", "markeredgecolor": "blue"})
    # sns.violinplot(x='variable', y='value', data=df_melt, showfliers=True, ax=ax,showmeans=True, palette=my_pal ,meanprops={"marker":"s","markerfacecolor":"white", "markeredgecolor":"blue"})
    ax.set_xlabel('controller')
    if args.data_type == "eei":
        ax.set_ylabel('EEI')
        plt.ylim([0.010, 0.015])
    elif args.data_type == "rewards":
        ax.set_ylabel('Rewards')
    elif args.data_type == "ene":
        ax.set_ylabel('Energy')
    elif args.data_type == "er":
        ax.set_ylabel('Error')
    elif args.data_type == "sp":
        ax.set_ylabel('Speed')

    if len(all_data)==5:
        order = ['data0', 'data1', 'data2','data3','data4']
        """
        test_results = add_stat_annotation(ax, data=df_melt, x='variable', y='value', order=order,
                                           box_pairs=[('data0', 'data3'), ('data1', 'data3'), ('data2', 'data3'),('data0', 'data4'), ('data1', 'data4'), ('data2', 'data4'), ('data3', 'data4')],
                                           test='t-test_welch', text_format='simple',
                                           loc='outside', verbose=2)
                                           """
        test_results = add_stat_annotation(ax, data=df_melt, x='variable', y='value', order=order,
                                           box_pairs=[('data0', 'data3'), ('data1', 'data3'), ('data2', 'data3'),
                                                      ],
                                           test='t-test_welch', text_format='simple',
                                           loc='outside', verbose=2)
    elif len(all_data) == 4:
        order = ['data0', 'data1', 'data2','data3']
        test_results = add_stat_annotation(ax, data=df_melt, x='variable', y='value', order=order,
                                           box_pairs=[('data0', 'data3'), ('data1', 'data3'), ('data2', 'data3'),],
                                           test='t-test_welch', text_format='simple',
                                           loc='outside', verbose=2)
    elif len(all_data) == 3:
        order = ['data0', 'data1', 'data2']
        test_results = add_stat_annotation(ax, data=df_melt, x='variable', y='value', order=order,
                                           box_pairs=[('data0', 'data2'), ('data2', 'data1')],
                                           test='t-test_welch', text_format='simple',
                                           loc='outside', verbose=2)
    """
    order = ['mbrl_f', 'mbrl_nf', 'pid']
    test_results = add_stat_annotation(ax, data=df_melt, x='variable', y='value', order=order,
                                       box_pairs=[('mbrl_f', 'mbrl_nf'), ('mbrl_nf', 'pid'), ('pid', 'mbrl_f')],
                                       test='t-test_welch', text_format='simple',
                                       loc='outside', verbose=2)
                                       """
    # test_results
    #ax.legend()
    # handler, label = ax.get_legend_handles_labels()
    # ax.legend(handler,["mbrl_f","mbrl_nf","pid"],loc='upper left',bbox_to_anchor=(1.05,1))
    # ind = 0
    # plt.ion()
    # plt.subplots_adjust(left=0.1, right=0.95, bottom=0.1, top=0.95)
    plt.savefig(save_dir + "/{}_{}.png".format(args.data_type, args.save_num), bbox_inches='tight')

    #plt.show()

if __name__ == '__main__':
    main()