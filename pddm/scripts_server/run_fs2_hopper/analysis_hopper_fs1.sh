#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ##########
##############################
# it's iter_num=20 okjob_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hp/2020-12-07/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.7/Iter50_Rollout20_Step500/ensemble3_num2_depth250/pddm_hopper-v0/2020-12-07_10-38-25/hopper"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hp/2020-12-10/control_delta_1/Controller_mppi_Horizon30_Can4000_beta0.9/Iter50_Rollout20_Step500/ensemble3_num2_depth250/pddm_hopper-v0/2020-12-10_20-22-16/hopper"

##############################
###palameter ##########
##############################
iter_num=20
control_delta=1


<< COMMENTOUT
COMMENTOUT

##########################
###10 times evaluation####
##########################
for running_times in 0 1 2 3 4 5 6 7 8 9 10
do
  ### No torque sensor####
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
done

###################
##simulation result
###################

python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name mppi --iter_num 0 --job_path $job_path_mppi --save_dir $job_job_path_mppi --eval
<<COMMENTOUT
python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --save_name compare_mppi_delta_1_sen1 --iter_num 29 --job_path0 $job_path_mppi_f1 --job_path1 $job_path_mppi --job_path2 $job_path_pid --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --save_name compare_rand_delta_1_sen1 --iter_num 29 --job_path0 $job_path_rand_f1 --job_path1 $job_path_rand --job_path2 $job_path_pid --save_dir $job_path_pid
COMMENTOUT

###############
##Learning Plot
##############
<<COMMENTOUT
#python ~/Documents/pddm-master/pddm/statstics_anlysis/compare_results.py -j $job_path_mppi $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3  $job_path_pid -l 'no torque sen' -l '1 torque sen' -l '2 torque sen' -l '3 torque sen'  -l 'pid' --save_dir $job_path_pid  --plot_rew
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_mppi_f1 --job_path2 $job_path_mppi  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_mppi_f2 --job_path2 $job_path_mppi  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_mppi_f3 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_sen3


python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f1 --job_path2 $job_path_rand  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f2 --job_path2 $job_path_rand  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f3 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_sen3

COMMENTOUT

##########
##box plot all
##########
<< COMMENTOUT
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num mppi_delta1_all

python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num rand_delta1_all


##########
##box plot
##########
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_mppi_f1 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid --data_type rewards --save_num mppi_delta1_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_mppi_f2 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid --data_type rewards --save_num mppi_delta1_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_mppi_f3 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid --data_type rewards --save_num mppi_delta1_sen3
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_mppi_f1 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid --data_type eei --save_num mppi_delta1_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_mppi_f2 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid --data_type eei --save_num mppi_delta1_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_mppi_f3 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid --data_type eei --save_num mppi_delta1_sen3

python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_rand_f1 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid --data_type rewards --save_num rand_delta1_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_rand_f2 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid --data_type rewards --save_num rand_delta1_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_rand_f3 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid --data_type rewards --save_num rand_delta1_sen3
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_rand_f1 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid --data_type eei --save_num rand_delta5_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_rand_f2 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid --data_type eei --save_num rand_delta1_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot.py --job_path1 $job_path_rand_f3 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid --data_type eei --save_num rand_delta1_sen3
COMMENTOUT
python /home/ashrising/Documents/notify_line/notify.py analysis