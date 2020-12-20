#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"

#diference of model
##############################
###job path ##########
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can2000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v0/2020-12-10_21-53-39/cheetah"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can2000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v2/2020-12-10_21-54-22/cheetah"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can2000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v6/2020-12-10_22-42-57/cheetah"
#job_path_rand_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"

##############################
###job path ##########
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can2000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v0/2020-12-10_15-51-31/cheetah"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can2000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v2/2020-12-10_15-53-56/cheetah"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-10/control_delta_1/Controller_mppi_Horizon20_Can2000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v6/2020-12-10_16-00-09/cheetah"


############
##############################
###job path ########## speed limit 4
##############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-14/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v0/2020-12-14_18-10-28/cheetah"
#job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-14/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v2/2020-12-14_18-10-46/cheetah"
#job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/hc/2020-12-14/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout30_Step100/ensemble3_num2_depth250/pddm_cheetah-v6/2020-12-14_18-11-43/cheetah"
#job_path_rand_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"




#############
###############################
####job path ########## speed limit 4 500step
###############################
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout10_Step500/ensemble3_num2_depth250/pddm_cheetah-v0/2020-12-16_16-51-09/cheetah"
##job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout10_Step500/ensemble3_num2_depth250/pddm_cheetah-v2/2020-12-16_16-53-33/cheetah"
##job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"
job_path_mppi_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/hc/2020-12-16/control_delta_1/Controller_mppi_Horizon20_Can4000_beta0.9/Iter50_Rollout10_Step500/ensemble3_num2_depth250/pddm_cheetah-v6/2020-12-16_16-55-07/cheetah"
##job_path_rand_f6="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-05/control_delta_1/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-05_13-07-38/inverted_pendulum"