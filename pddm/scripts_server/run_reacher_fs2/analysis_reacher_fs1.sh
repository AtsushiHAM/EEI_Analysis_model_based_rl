#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ########## 1216 st_0.01at toqque limit
##############################
job_path_mppi="/data/atsushi_data/output/re/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v0/2020-12-16_15-30-46/reacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/data/atsushi_data/output/re_force/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v12/2020-12-16_15-31-55/reacher"
#job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/data/atsushi_data/output/re_force/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v15/2020-12-16_15-33-11/reacher"
#job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/data/atsushi_data/output/re_force/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v225/2020-12-16_15-34-04/reacher"
#job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
#job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################
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

for running_times in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
do


  ### No torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  ### 1 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f12 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  ### 2 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f15 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  ### 3 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f225 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
COMMENTOUT
  ### pid ####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --reward_type st
done

