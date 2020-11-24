#!/bin/sh

##############################
###python code name ##########
##############################
 #limit torque -1-1
 << COMMENTOUT #add anatoher reward func
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/control_delta_5/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-10-28_18-00-30/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/control_delta_5/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-10-28_18-00-30/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-04/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-04_14-45-03/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_21-36-26/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-04/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-04_14-45-42/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-03_21-35-15/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-04/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-04_15-25-49/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-03_21-36-06/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_5/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_15-47-38/inverted_pendulum"
COMMENTOUT
<< COMMENTOUT #add anatoher reward func
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-06/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_20-57-28/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-06/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_18-32-58/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-07_13-53-20/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-07_11-45-30/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-07_13-52-34/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-07_11-46-02/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-07_13-52-42/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-07_11-47-02/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_5/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_15-47-38/inverted_pendulum"
COMMENTOUT
<< COMMENTOUT
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-08/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-08_08-11-26/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-06/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-06_18-32-58/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-08/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-08_08-12-13/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-07_11-45-30/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-08/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-08_08-12-48/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-07_11-46-02/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-08/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-08_08-13-42/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-07/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-07_11-47-02/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_5/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_15-47-38/inverted_pendulum"
COMMENTOUT
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-11/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-11_11-10-06/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_06-34-34/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_00-03-52/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_06-37-52/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_00-06-10/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_06-42-42/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_00-08-17/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_06-43-20/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"
##############################
###python code name ##########
##############################
#only_st

eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-11/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-11_11-10-06/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_06-34-34/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_00-03-52/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_06-37-52/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_00-06-10/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_06-42-42/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_00-08-17/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_06-43-20/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"
<< COMMENTOUT
COMMENTOUT
<< COMMENTOUT
#st_at
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_15-09-42/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_06-34-34/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_15-09-42/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_06-37-52/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_15-09-42/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_06-42-42/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st_ac/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_15-08-52/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_06-43-20/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"
COMMENTOUT
<< COMMENTOUT
# learnng with white noise
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/control_delta_5/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-10-28_18-00-30/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/control_delta_5/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-10-28_18-00-30/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-04/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-04_14-45-03/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_21-36-26/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-04/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-04_14-45-42/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-03_21-35-15/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-04/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-04_15-25-49/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-03_21-36-06/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"
COMMENTOUT

#beta 0.6
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-15_13-23-23/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_06-34-34/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-15_13-22-36/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_06-37-52/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-15_13-20-50/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_06-42-42/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/mppi_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_00-08-17/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_14-19-09/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"
##############################
###python code name ##########
##############################
#beta 11-15 0.4
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum-v0/2020-11-15_19-03-43/inverted_pendulum"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-10_06-34-34/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-11-15_19-01-05/inverted_pendulum"
#job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-10_06-37-52/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v2/2020-11-15_19-01-41/inverted_pendulum"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-10/control_delta_5/rand_st/Controller_20_Horizon2000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-10_06-42-42/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.4/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_19-02-46/inverted_pendulum"
#job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-15/control_delta_5/Controller_mppi_Horizon20_Can1000_beta0.6/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-11-15_14-19-09/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/2020-11-10/control_delta_5/pid_st_ac/Controller_20_Horizon500_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-10_09-40-22/inverted_pendulum"

##############################
###palameter ##########
##############################
iter_num=29
control_delta=5
rewards="rewards_st"
eei="eei_st"


