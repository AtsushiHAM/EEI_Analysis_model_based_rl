#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ########## st_0.01at target2 up an down same iniit
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/vre/2020-12-19/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v0/2020-12-19_21-16-17/vreacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/vre_force/2020-12-19/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v11/2020-12-19_21-16-52/vreacher"
#job_path_rand_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f14="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/vre_force/2020-12-19/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v14/2020-12-19_21-17-31/vreacher"
#job_path_rand_f14="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f214="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/vre_force/2020-12-19/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v214/2020-12-19_21-17-53/vreacher"
#job_path_rand_f214="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_12-50-19/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"

#job_path_rand_test="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/short_furuta_test/2020-11-06/control_delta_1/rand/Controller_20_Horizon500_Can2/Iter1_Rollout30_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_17-37-05/inverted_pendulum"
#job_path_mppi_test="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/short_furuta_test/2020-11-06/control_delta_1/mppi/Controller_20_Horizon500_Can2/Iter1_Rollout30_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_17-38-01/inverted_pendulum"

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

for running_times in 100 #0 1 2 3 4 5 6 7 8 9
do

  ### No torque sensor####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  ### 1 torque sensor####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f11 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 2 torque sensor####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f14 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 3 torque sensor####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f214 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
<< COMMENTOUT
COMMENTOUT
  ### pid ####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --reward_type st
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
COMMENTOUT
#python ~/Documents/pddm-master/pddm/statstics_anlysis/visualize_iteration_graph_noperturb.py --save_name pid_delta_1 --iter_num 0 --job_path $job_path_pid --save_dir $job_path_pid

#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_rand --iter_num 0 --job_path $job_path_rand_test --save_dir $job_path_rand_test
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 0 --job_path $job_path_mppi_test --save_dir $job_path_mppi_test
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 29 --job_path $job_path__test --save_dir $job_path_mppi_test

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

#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f12 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f12 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi  --save_dir $job_path_pid  --data_type eei --save_num mppi_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi --save_dir $job_path_pid  --data_type er --save_num mppi_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi  --save_dir $job_path_pid  --data_type ene --save_num mppi_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num rand_delta1_all


##########
##box plot
##########
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f11 $job_path_mppi_f14 $job_path_mppi_f214 $job_path_mppi --save_dir $job_path_mppi  --data_type rewards --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f11 $job_path_mppi_f14 $job_path_mppi_f214 $job_path_mppi --save_dir $job_path_mppi  --data_type ene --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f11 $job_path_mppi_f14 $job_path_mppi_f214 $job_path_mppi --save_dir $job_path_mppi  --data_type er --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f11 $job_path_mppi_f14 $job_path_mppi_f214 $job_path_mppi --save_dir $job_path_mppi  --data_type eei --save_num mppi_delta1_all
<< COMMENTOUT
COMMENTOUT
python /home/ashrising/Documents/notify_line/notify.py analysis