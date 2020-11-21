#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
##############################
###job path ########## 1115 nomarl be0.9 perturb st
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-15_21-44-53/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-15_21-44-38/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-15_21-44-24/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_21-43-21/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"

##############################
###job path ########## 1115 #11-15 beta 0.9  perturb st st
##############################
#job_path_mppi_fs5="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-15_21-46-33/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_06-34-34/inverted_pendulum"
#job_path_mppi_f1_fs5="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-15_21-47-12/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_06-37-52/inverted_pendulum"
#job_path_mppi_f2_fs5="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-15_21-47-41/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_06-42-42/inverted_pendulum"
#job_path_mppi_f3_fs5="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_21-48-13/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_14-19-09/inverted_pendulum"
#job_path_pid_fs5="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"

##############################
###palameter ##########
##############################
iter_num=29
control_delta=1
rewards="rewards_be09_st"
eei="eei_be09_st"

<< COMMENTOUT
COMMENTOUT


##########################
###10 times evaluation####0 1 2 3 4 5 6 7 8 9
##########################
for running_times in 10 11 12 13 14 15 16 17 18 19
do
  if $running_times -lt 1 ; then
   ### No torque sensor####
   echo running_times and mpe $running_times
   ### No torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --save_name compare_mppi_delta_1_sen1 --data_type $rewards --iter_num $running_times --job_path0 $job_path_mppi --job_path1 $job_path_mppi --job_path2 $job_path_pid --save_dir $job_path_pid
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 1 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 2 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 3 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### pid ####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta
  else
    echo running_times $running_times
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 1 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f1 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f1 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 2 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f2 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f2 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 3 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f3 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f3 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### pid ####
   #python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --eval --perturb --save_name compare_mppi_delta_1_sen1 --data_type $rewards --iter_num $running_times --job_path0 $job_path_mppi_f1 --job_path1 $job_path_mppi --job_path2 $job_path_pid --save_dir $job_path_pid
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta
  fi
done
COMMENTOUT
###################
##simulation result
###################
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name mmppi_sen1 --iter_num 0 --job_path $job_path_mppi_f1 --save_dir $job_path_pid
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 0 --job_path $job_path_pid  --save_dir $job_path_pid

for running_times in 0 #1 2 3 4 5 6 7 8 9 10
do
  echo running_times $running_times
python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --eval --perturb --save_name compare_mppi_delta_1_sen1 --data_type $rewards --iter_num $running_times --job_path0 $job_path_mppi_f1 --job_path1 $job_path_mppi --job_path2 $job_path_pid --save_dir $job_path_pid
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --eval --perturb --save_name compare_rand_delta_1_sen1 --data_type $rewards --iter_num $running_times --job_path0 $job_path_rand_f1 --job_path1 $job_path_rand --job_path2 $job_path_pid --save_dir $job_path_pid
done
<< COMMENTOUT
COMMENTOUT

###cal eei
for running_times in 0 1 2 3 4 5 6 7 8 9 10
do
  echo running_times $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_mppi --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_mppi_f1 --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_mppi_f2 --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_mppi_f3 --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_rand --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_rand_f1 --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_rand_f2 --iter_num $running_times
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_rand_f3 --iter_num $running_times
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --eval --perturb --save_name compare_rand_delta_1_sen1 --data_type $rewards --iter_num $running_times --job_path0 $job_path_rand_f1 --job_path1 $job_path_rand --job_path2 $job_path_pid --save_dir $job_path_pid
#python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI.py --eval --perturb --job_path0 $job_path_pid --iter_num $running_times
done
###############
##Learning Plot
##############


<< COMMENTOUT
#python ~/Documents/pddm-master/pddm/statstics_anlysis/compare_results.py -j $job_path_mppi $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3  $job_path_pid -l 'no torque sen' -l '1 torque sen' -l '2 torque sen' -l '3 torque sen'  -l 'pid' --save_dir $job_path_pid  --plot_rew
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_mppi_f1 --job_path2 $job_path_mppi  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type $rewards --save_num mppi_delta5_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_mppi_f2 --job_path2 $job_path_mppi  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type $rewards --save_num mppi_delta5_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_mppi_f3 --job_path2 $job_path_mppi --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type $rewards --save_num mppi_delta5_sen3

python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f1 --job_path2 $job_path_rand  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type $rewards --save_num rand_delta5_sen1
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f2 --job_path2 $job_path_rand  --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type $rewards --save_num rand_delta5_sen2
python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f3 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type $rewards --save_num rand_delta5_sen3

COMMENTOUT
#python ~/Documents/pddm-master/pddm/statstics_anlysis/test_RL.py --job_path1  $job_path_rand_f3 --job_path2 $job_path_rand --job_path3 $job_path_pid --save_dir $job_path_pid  --data_type rewards --save_num rand_delta5_sen3

##########
##box plot all
##########

#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_all2
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num mppi_delta1_all2
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid  --data_type er --save_num mppi_delta1_all2
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid  --save_dir $job_path_pid --data_type ene --save_num mppi_delta1_all2


python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid $job_path_mppi_f1_fs5 $job_path_mppi_f2_fs5 $job_path_mppi_f3_fs5 $job_path_mppi_fs5 $job_path_pid_fs5 --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta15_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid $job_path_mppi_f1_fs5 $job_path_mppi_f2_fs5 $job_path_mppi_f3_fs5 $job_path_mppi_fs5 $job_path_pid_fs5 --save_dir $job_path_pid  --data_type eei --save_num mppi_delta15_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid $job_path_mppi_f1_fs5 $job_path_mppi_f2_fs5 $job_path_mppi_f3_fs5 $job_path_mppi_fs5 $job_path_pid_fs5 --save_dir $job_path_pid  --data_type er --save_num mppi_delta15_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi $job_path_pid $job_path_mppi_f1_fs5 $job_path_mppi_f2_fs5 $job_path_mppi_f3_fs5 $job_path_mppi_fs5 $job_path_pid_fs5  --save_dir $job_path_pid --data_type ene --save_num mppi_delta15_all

##########
##loss plot
##########
#python ~/Documents/pddm-master/pddm/statstics_anlysis/losses_plot.py -j $job_path_mppi_f1 $job_path_mppi_f2 $job_path_mppi_f3 $job_path_mppi  --save_dir $job_path_pid  --save_num mppi_delta1_all


<< COMMENTOUT
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num rand_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type er --save_num rand_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f1 $job_path_rand_f2 $job_path_rand_f3 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type ene --save_num rand_delta1_all
COMMENTOUT
python /home/ashrising/Documents/notify_line/notify.py analysis