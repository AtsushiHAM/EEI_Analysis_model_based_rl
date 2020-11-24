#!/bin/sh

##############################
###python code name ##########
##############################
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

test_job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/control_delta_1/inverted_pendulum/Controller_mppi_Horizon20_Can1000/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v1/2020-10-30_03-10-23/inverted_pendulum"
test_job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_23-39-53/inverted_pendulum"

<< COMMENTOUT
:/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_23-39-53/inverted_pendulum$
COMMENTOUT
########################
### No torque sensor####
########################
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration.py --job_path $job_path_pid --iter_num 29 --save_dir $job_path_pid --perturb #--view_live_mpe_plot
#MJPL python3.5 ~/Documents/pddm-master/pddm/scripts/visualize_iteration.py --job_path /media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_5/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_23-39-53/inverted_pendulum --iter_num 29 --save_dir /media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_5/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_15-47-38/inverted_pendulum --perturb #--view_live_mpe_plot


python /home/ashrising/Documents/notify_line/notify.py analysis