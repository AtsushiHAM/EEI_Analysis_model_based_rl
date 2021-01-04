#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ##########maybe st
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_09-08-22/reacher"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_08-58-03/reacher"
job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_09-04-29/reacher"
job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_09-06-41/reacher"
job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_12-50-19/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"

##############################
###job path ########## 11 14 st_0.01at
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-14_14-26-13/reacher"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-14_14-27-58/reacher"
job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15=":/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-14_14-28-46/reacher"
job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_09-06-41/reacher"
job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-12_12-50-19/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
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
###job path ########## 11 15 st_beta0.6
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v0/2020-11-15_13-10-29/reacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="//media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v12/2020-11-15_13-12-07/reacher"
#job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v15/2020-11-15_13-13-27/reacher"
#job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v225/2020-11-15_13-14-25/reacher"
#job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################
###job path ########## 11 15 st_beta0.4
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v0/2020-11-15_19-18-44/reacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v12/2020-11-15_19-19-16/reacher"
#job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v15/2020-11-15_19-20-17/reacher"
#job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v225/2020-11-15_19-20-56/reacher"
#job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################
###job path ########## 11 18 st_0.01at toqque limit
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v0/2020-11-18_23-17-30/reacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v12/2020-11-18_23-18-20/reacher"
#job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v15/2020-11-18_23-18-41/reacher"
#job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v225/2020-11-18_23-19-05/reacher"
#job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################
python /home/ashrising/Documents/notify_line/notify.py analysis
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
##############################
###job path ########## 1216 st_0.01at toqque limit
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v0/2020-12-16_15-30-46/reacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v12/2020-12-16_15-31-55/reacher"
#job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v15/2020-12-16_15-33-11/reacher"
#job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v225/2020-12-16_15-34-04/reacher"
#job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
#job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################

##############################
###job path ########## 1216 st_0.01at 2 goal
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-12-20/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v0/2020-12-20_19-02-54/reacher"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v0/2020-11-12_12-47-10/reacher"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-12-20/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v12/2020-12-20_19-03-57/reacher"
#job_path_rand_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v12/2020-11-12_12-44-14/reacher"
job_path_mppi_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-12-20/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v15/2020-12-20_19-04-36/reacher"
#job_path_rand_f15="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-12/control_delta_1/rand_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v15/2020-11-12_12-51-06/reacher"
job_path_mppi_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-12-20/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_reacher-v225/2020-12-20_19-05-25/reacher"
#job_path_rand_f225="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v225/2020-11-14_14-29-18/reacher"
#job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/re_pid/2020-11-11/control_delta_1/reacher_pid_st/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_reacher-v6/2020-11-11_14-54-03/reacher"
##############################