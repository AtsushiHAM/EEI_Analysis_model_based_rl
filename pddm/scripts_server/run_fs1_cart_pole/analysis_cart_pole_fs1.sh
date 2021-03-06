#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ##########perturb 140-160
##############################
job_path_mppi="/data/atsushi_data/output/cp/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_cart_pole-v0/2020-12-16_22-47-51/cart_pole"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f10="/data/atsushi_data/output/cp/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_cart_pole-v10/2020-12-16_22-49-12/cart_pole"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f14="/data/atsushi_data/output/cp/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_cart_pole-v14/2020-12-16_22-49-48/cart_pole"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f214="/data/atsushi_data/output/cp/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_cart_pole-v214/2020-12-16_22-51-01/cart_pole"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_13-09-22/inverted_pendulum"
#job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_1/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_16-16-26/inverted_pendulum"


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
for running_times in 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 #0 1 2 3 4 5 6 7 8 9 10
do
  ### No torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 1 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f10 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 2 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f14 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### 3 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f214 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
  ### pid ####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta
done

