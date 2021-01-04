#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"


##############################
###job path ########## st_0.01at target2 up an down same iniit
##############################
job_path_mppi="/data/atsushi_data/output/vre/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v0/2020-12-21_00-07-14/vreacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f11="/data/atsushi_data/output/vre_force/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v11/2020-12-21_00-07-45/vreacher"
#job_path_rand_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f14="/data/atsushi_data/output/vre_force/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v14/2020-12-21_00-08-06/vreacher"
#job_path_rand_f14="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f214="/data/atsushi_data/output/vre_force/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v214/2020-12-21_00-08-28/vreacher"
#job_path_rand_f214="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_12-50-19/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
job_path_mppi_2="/data/atsushi_data/output/vre/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v0/2020-12-21_13-48-05/vreacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f11_2="/data/atsushi_data/output/vre_force/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v11/2020-12-21_13-48-11/vreacher"
#job_path_rand_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f14_2="/data/atsushi_data/output/vre_force/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v14/2020-12-21_13-48-17/vreacher"
#job_path_rand_f14="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f214_2="/data/atsushi_data/output/vre_force/2020-12-21/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_vreacher-v214/2020-12-21_13-48-24/vreacher"
#job_path_rand_f214="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_12-50-19/reacher"
#job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"

##############################
###palameter ##########
##############################
iter_num=29
control_delta=1


##########################
###10 times evaluation####
##########################
for running_times in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
do
  echo $running_times
  ### No torque sensor####
  ### No torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_2 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f11_2 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f14_2 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f214_2 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu

  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f11 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f14 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f214 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu

done


###cal eei
for running_times in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
do
  echo running_times $running_times
python ~/Documents/pddm/statstics_anlysis/calculateEEI_vre.py --eval --job_path0 $job_path_mppi --iter_num $running_times
python ~/Documents/pddm/statstics_anlysis/calculateEEI_vre.py --eval --job_path0 $job_path_mppi_f11 --iter_num $running_times
python ~/Documents/pddm/statstics_anlysis/calculateEEI_vre.py --eval --job_path0 $job_path_mppi_f14 --iter_num $running_times
python ~/Documents/pddm/statstics_anlysis/calculateEEI_vre.py --eval --job_path0 $job_path_mppi_f214 --iter_num $running_times
done
###################
##simulation result
###################
#python ~/Documents/pddm/scripts/visualize_iteration_graph.py --save_name test_rand --iter_num 0 --job_path $job_path_mppi --save_dir $job_path_mppi
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 0 --job_path $job_path_mppi_test --save_dir $job_path_mppi_test
<<COMMENTOUT
COMMENTOUT
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --save_name compare_mppi_delta_1_sen1 --iter_num 29 --job_path0 $job_path_mppi_f1 --job_path1 $job_path_mppi --job_path2 $job_path_pid --save_dir $job_path_mppi
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --save_name compare_rand_delta_1_sen1 --iter_num 29 --job_path0 $job_path_rand_f1 --job_path1 $job_path_rand --job_path2 $job_path_pid --save_dir $job_path_pid


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