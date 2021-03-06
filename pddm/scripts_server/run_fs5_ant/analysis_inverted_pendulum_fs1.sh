#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ##########
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_21-59-26/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-06/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-06_11-23-24/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_21-45-59/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_21-34-09/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_13-09-22/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_1/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_16-16-26/inverted_pendulum"


job_path_rand_test="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/short_furuta_test/2020-11-06/control_delta_1/rand/Controller_20_Horizon500_Can2/Iter1_Rollout30_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_17-37-05/inverted_pendulum"
job_path_mppi_test="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/short_furuta_test/2020-11-06/control_delta_1/mppi/Controller_20_Horizon500_Can2/Iter1_Rollout30_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_17-38-01/inverted_pendulum"


##############################
###palameter ##########
##############################
iter_num=29
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
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 1 torque sensor####
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 2 torque sensor####
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 3 torque sensor####
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### pid ####
  python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta
done

###################
##simulation result
###################
<<COMMENTOUT
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name mppi_delta_5_sen1 --iter_num 29 --job_path $job_path_mppi_f1 --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name mppi_delta_5_sen2 --iter_num 29 --job_path $job_path_mppi_f2 --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name mppi_delta_5_sen3 --iter_num 29 --job_path $job_path_mppi_f3 --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name mppi_delta_5 --iter_num 29 --job_path $job_path_mppi --save_dir $job_path_pid

python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name rand_delta_5_sen1 --iter_num 29 --job_path $job_path_rand_f1 --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name rand_delta_5_sen2 --iter_num 29 --job_path $job_path_rand_f2 --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name rand_delta_5_sen3 --iter_num 29 --job_path $job_path_rand_f3 --save_dir $job_path_pid
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name rand_delta_5 --iter_num 29 --job_path $job_path_rand --save_dir $job_path_pid

python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name rand_delta_5 --iter_num 29 --job_path $job_path_pid --save_dir $job_path_pid
COMMENTOUT
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_rand --iter_num 0 --job_path $job_path_rand_test --save_dir $job_path_rand_test
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 0 --job_path $job_path_mppi_test --save_dir $job_path_mppi_test
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