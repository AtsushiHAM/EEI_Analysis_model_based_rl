#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"



##############################
###job path ########## 11 14 st_0.01at
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-14_14-26-13/reacher"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-14_14-27-58/reacher"
job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-14_14-28-46/reacher"
job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################
###palameter ##########
##############################
iter_num=29
control_delta=1
rewards="rewards_04be"
eei="eei_04be"


<< COMMENTOUT

COMMENTOUT
##########################
###10 times evaluation####
##########################

for running_times in 100 #0 1 2 3 4 5 6 7 8 9
do
  if $running_times<1 ; then
   ### No torque sensor####
   echo running_times and mpe $running_times
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 1 torque sensor####

   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f12 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f12 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 2 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f15 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f15 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   ### 3 torque sensor####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f225 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f225 --running_times $running_times --iter_num $iter_num --execute_sideRollouts --control_delta $control_delta --use_gpu

   ### pid ####
   #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --reward_type st
  else
    echo running_times $running_times
    ### No torque sensor####
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu #false
    ### 1 torque sensor####
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f12 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f12 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
    ### 2 torque sensor####
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f15 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f15 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
    ### 3 torque sensor####
    python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f225 --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --use_gpu
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand_f225 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu

    ### pid ####
    #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_pid --running_times $running_times --iter_num $iter_num  --control_delta $control_delta --reward_type st

  fi

  done

###################
##simulation result
###################
<<COMMENTOUT
COMMENTOUT
#python ~/Documents/pddm-master/pddm/statstics_anlysis/visualize_iteration_graph_noperturb.py --save_name pid_delta_1 --iter_num 29 --job_path $job_path_pid --save_dir $job_path_pid

#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_rand --iter_num 0 --job_path $job_path_rand_test --save_dir $job_path_rand_test
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 0 --job_path $job_path_mppi_test --save_dir $job_path_mppi_test
#python ~/Documents/pddm-master/pddm/scripts/visualize_iteration_graph.py --save_name test_mppi --iter_num 29 --job_path $job_path__test --save_dir $job_path_mppi_test

for running_times in 0 #1 2 3 4 5 6 7 8 9 10

do
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --eval  --save_name compare_mppi_delta_5_sen225 --data_type $rewards --iter_num $running_times --job_path0 $job_path_mppi_f225 --job_path1 $job_path_mppi --job_path2 $job_path_pid --save_dir $job_path_pid
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --eval  --save_name compare_rand_delta_5_sen225 --data_type $rewards --iter_num $running_times --job_path0 $job_path_rand_f225 --job_path1 $job_path_rand --job_path2 $job_path_pid --save_dir $job_path_pid
echo running_times $running_times
done

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

python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f12 $job_path_mppi_f15 $job_path_mppi_f225 $job_path_mppi  --save_dir $job_path_pid  --data_type rewards --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f12 $job_path_mppi_f15 $job_path_mppi_f225 $job_path_mppi   --save_dir $job_path_pid  --data_type eei --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f12 $job_path_mppi_f15 $job_path_mppi_f225 $job_path_mppi   --save_dir $job_path_pid  --data_type ene --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_mppi_f12 $job_path_mppi_f15 $job_path_mppi_f225 $job_path_mppi  --save_dir $job_path_pid  --data_type er --save_num mppi_delta1_all

#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f12 $job_path_rand_f15 $job_path_rand_f225 $job_path_rand  --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f12 $job_path_rand_f15 $job_path_rand_f225 $job_path_rand   --save_dir $job_path_pid  --data_type eei --save_num rand_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f12 $job_path_rand_f15 $job_path_rand_f225 $job_path_rand   --save_dir $job_path_pid  --data_type ene --save_num rand_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f12 $job_path_rand_f15 $job_path_rand_f225 $job_path_rand  --save_dir $job_path_pid  --data_type er --save_num rand_delta1_all


#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f12 $job_path_rand_f15 $job_path_mppi_f225 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type rewards --save_num rand_delta1_all
#python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_test.py -j $job_path_rand_f12 $job_path_rand_f15 $job_path_mppi_f225 $job_path_rand $job_path_pid  --save_dir $job_path_pid  --data_type eei --save_num rand_delta1_all


python /home/ashrising/Documents/notify_line/notify.py analysis