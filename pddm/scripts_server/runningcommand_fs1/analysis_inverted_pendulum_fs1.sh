#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ########## 1214 petrub 20-40 same
##############################
job_path_mppi="/data/atsushi_data/output/ip/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-12-17_12-20-08/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/data/atsushi_data/output/ip_force/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-12-17_12-21-59/inverted_pendulum"
job_path_mppi_f11="/data/atsushi_data/output/ip_force/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v11/2020-12-17_12-23-06/inverted_pendulum"
job_path_mppi_f12="/data/atsushi_data/output/ip_force/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v12/2020-12-17_12-24-20/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"

##############################
###palameter ##########
##############################
iter_num=29
control_delta=1
#rewards="rewards_st_0.01at"
#eei="eei_st_0.01at"

<< COMMENTOUT
COMMENTOUT

##########################
###10 times evaluation####
##########################
for running_times in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
do
  echo $running_times
  ### No torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
  ### 1 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f1 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
  ### 2 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f11 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
  ### 3 torque sensor####
  python ~/Documents/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f12 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu --gpu_frac=0.1
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
  ### pid ####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta
  #echo $running_times
done

###################
##simulation result
###################
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_rand --iter_num 0 --job_path $job_path_rand_test --save_dir $job_path_rand_test
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 0 --job_path $job_path_mppi_test --save_dir $job_path_mppi_test

##########
##box plot all
##########

#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num mppi_delta1_all

#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num rand_delta1_all


#python /home/ashrising/Documents/notify_line/notify.py analysis

