#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

##############################
###job path ##########
##############################
##############################
##############################
##############################
##############################
##############################
 ##1105
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_21-59-26/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_21-45-59/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_21-45-59/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_21-34-09/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_13-09-22/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
COMMENTOUT
<< COMMENTOUT ##1026
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_11-57-23/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/control_delta_1/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-10-28_20-13-56/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/control_delta_1/inverted_pendulum/Controller_rand_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-10-29_17-22-54/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/control_delta_1/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-10-28_20-10-37/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/control_delta_1/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-28_20-05-28/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_13-09-22/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_1/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_16-16-26/inverted_pendulum"

COMMENTOUT

<< COMMENTOUT ##1112
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_11-57-23/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_12-10-10/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_12-19-43/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_21-34-09/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-05_13-09-22/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_1/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_16-16-26/inverted_pendulum"
COMMENTOUT

##############################
###job path ########## beta0.6
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-15_13-03-58/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-15_13-05-47/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-15_13-06-43/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_13-07-20/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
##############################
###job path ########## beta0.4
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-15_17-22-26/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-15_17-23-07/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-15_17-21-35/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_17-23-44/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
#############################
###job path ########## st-0.01at torque no limit
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-16_16-59-16/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-16_17-00-35/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-16_17-00-58/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-16/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-16_17-01-20/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
##############################
###job path ########## 1115 nomarl perturb st
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
###job path ########## torque 20 to 60
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-17_14-23-37/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-17_14-22-14/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-17_14-24-11/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-17_14-24-33/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"

########
##############################
###job path ########## torque 30 to 50 st-0.001at
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-17_23-43-19/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-17_23-43-05/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-17_23-42-28/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-17/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-17_23-41-51/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
##############################
###job path ########## torque 30 to 50 st-0.002at
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-18_11-29-35/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-18_11-30-50/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-18_11-31-29/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-18_11-33-41/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
##############################
###job path ########## 1118 torque 20 to 40 st-0.001at
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-18_20-43-38/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-18_17-38-53/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-18_17-39-36/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-18/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-18_17-42-09/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
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
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-21_04-09-40/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-21_04-04-04/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-21_04-06-54/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-21_04-08-11/inverted_pendulum"
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

#middle diffence
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
#job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"

job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-21_04-09-40/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-21_04-04-04/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-21_04-06-54/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-21/control_delta_1/Controller_rand_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-21_04-08-11/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_1/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_10-55-42/inverted_pendulum"



#####check the model difference

##############################
###job path ########## 1210 check first model cause the diferrence of results
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-12-10_10-21-16/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-12-10_10-21-34/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-12-10_10-21-45/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-12-10_10-22-10/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
job_path_mppi_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v11/2020-12-10_10-22-24/inverted_pendulum"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v12/2020-12-10_10-32-37/inverted_pendulum"
##############################
###job path ########## 1210 check model cause the diferrence of 2nd results
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-12-10_22-56-15/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-12-10_22-54-04/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
#job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-12-10_10-21-45/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
#job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-12-10_10-22-10/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
job_path_mppi_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v11/2020-12-10_16-03-37/inverted_pendulum"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v12/2020-12-10_10-34-15/inverted_pendulum"


##############################
###job path ########## 1210 check model cause the diferrence of 3rd results
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-12-09/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-12-09_21-57-56/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-09/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-12-09_21-58-08/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-05_13-08-07/inverted_pendulum"
#job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-12-10_10-21-45/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-05_13-08-41/inverted_pendulum"
#job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-12-10_10-22-10/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-14/control_delta_1/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-14_14-52-04/inverted_pendulum"
job_path_mppi_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v11/2020-12-10_22-51-30/inverted_pendulum"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can1000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v12/2020-12-10_22-51-39/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"


##############################
###job path ########## 1214 petrub 20-40
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-12-15/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-12-15_15-00-35/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-15/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-12-15_15-01-14/inverted_pendulum"
job_path_mppi_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-15/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v11/2020-12-15_15-01-51/inverted_pendulum"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-15/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v12/2020-12-15_15-02-12/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"

##############################
###job path ########## 1217 petrub 20-40 same
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-12-17_12-20-08/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-12-17_12-21-59/inverted_pendulum"
job_path_mppi_f11="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v11/2020-12-17_12-23-06/inverted_pendulum"
job_path_mppi_f12="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-12-17/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v12/2020-12-17_12-24-20/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-12/control_delta_1/pid_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-12_20-34-50/inverted_pendulum"
