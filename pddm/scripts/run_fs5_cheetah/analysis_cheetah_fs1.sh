#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

#############
###############################
####job path ########## speed limit 4 500step
###############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout10_Step500/ensemble3_num2_depth250/pddm_cheetah-v0/2020-12-16_16-51-09/cheetah"
##job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout10_Step500/ensemble3_num2_depth250/pddm_cheetah-v2/2020-12-16_16-53-33/cheetah"
##job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout10_Step500/ensemble3_num2_depth250/pddm_cheetah-v6/2020-12-16_16-55-07/cheetah"
#job_path_rand_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"

##############################
###palameter ##########
##############################
iter_num=49
control_delta=1


<< COMMENTOUT
COMMENTOUT

##########################
###10 times evaluation####
##########################
for running_times in 101 #0 1 2 3 4 5 6 7 8 9 10
do
  echo $running_times
  ### No torque sensor####
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f2 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_mppi_f6 --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
  #python ~/Documents/pddm-master/pddm/scripts/eval_iteration.py --job_path $job_path_rand --running_times $running_times --iter_num $iter_num --control_delta $control_delta --use_gpu
done


###cal eei
for running_times in 0 1 2 3 4 5 6 7 8 9 10
do
  echo running_times $running_times
  #python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI_hc.py  --job_path0 $job_path_mppi --iter_num $running_times #--eval
  #python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI_hc.py  --job_path0 $job_path_mppi_f2 --iter_num $running_times #--eval
  #python ~/Documents/pddm-master/pddm/statstics_anlysis/calculateEEI_hc.py --job_path0 $job_path_mppi_f6 --iter_num $running_times #--eval
done
###################
##simulation result
###################
#python ~/Documents/pddm-master/pddm/scripts/compare_visualize_iteration_graph.py --save_name compare_rand_delta_1_sen1 --iter_num 29 --job_path0 $job_path_mppi --job_path1 $job_path_rand --job_path2 $job_path_pid --save_dir $job_path_pid
#python ~/Documents/pddm-master/pddm/statstics_anlysis/visualize_iteration_phase_graph_hc.py --save_name test_mppi --iter_num $iter_num --job_path $job_path_mppi  --save_dir $job_path_mppi #--eval
#python ~/Documents/pddm-master/pddm/statstics_anlysis/visualize_iteration_phase_graph_hc.py --save_name test_mppi --iter_num $iter_num --job_path $job_path_mppi_f2  --save_dir $job_path_mppi_f2 #--eval
#python ~/Documents/pddm-master/pddm/statstics_anlysis/visualize_iteration_phase_graph_hc.py --save_name test_mppi --iter_num $iter_num --job_path $job_path_mppi_f6  --save_dir $job_path_mppi_f6 #--eval

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
##box plot all rewards
##########
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f2 $job_path_mppi_f6 $job_path_mppi --save_dir $job_path_mppi  --data_type rewards --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f2 $job_path_mppi_f6 $job_path_mppi --save_dir $job_path_mppi  --data_type ene --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f2 $job_path_mppi_f6 $job_path_mppi --save_dir $job_path_mppi  --data_type sp --save_num mppi_delta1_all
python ~/Documents/pddm-master/pddm/statstics_anlysis/box_plot_kai_aftertest.py -j $job_path_mppi_f2 $job_path_mppi_f6 $job_path_mppi --save_dir $job_path_mppi  --data_type eei --save_num mppi_delta1_all

