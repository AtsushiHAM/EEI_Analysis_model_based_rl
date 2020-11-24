#!/bin/sh

##############################
###python code name ##########
##############################
eval_iteration="~/Documents/pddm-master/pddm/scripts/eval_iteration.py"
job_path_mppi="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-03/control_delta_10/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-03_22-52-38/inverted_pendulum"
job_path_rand="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip/2020-11-03/control_delta_10/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum-v0/2020-11-03_21-40-32/inverted_pendulum"
job_path_mppi_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_10/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_22-54-34/inverted_pendulum"
job_path_rand_f1="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_10/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v1/2020-11-03_21-42-34/inverted_pendulum"
job_path_mppi_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_10/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-03_22-57-20/inverted_pendulum"
job_path_rand_f2="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_10/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v2/2020-11-03_21-44-22/inverted_pendulum"
job_path_mppi_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_10/mppi/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-03_22-57-54/inverted_pendulum"
job_path_rand_f3="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/ip_force/2020-11-03/control_delta_10/rand/Controller_20_Horizon1000_Can30/Iter10_Rollout500_Step3/ensemble2_num250_depthpddm_furuta_inverted_pendulum_force-v3/2020-11-03_21-45-30/inverted_pendulum"
job_path_pid="/media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid/control_delta_10/inverted_pendulum/Controller_pid_Horizon20_Can500/Iter30_Rollout10_Step500/ensemble3_num2_depth250/pddm_furuta_inverted_pendulum_force-v3/2020-10-29_21-24-06/inverted_pendulum"
<< COMMENTOUT

COMMENTOUT
##########
##box plot
##########
python ~/Documents/pddm-master/pddm/scripts/visualize_iteration.py --job_path $job_path_pid --iter_num 29  --control_delta 1 --view_live_mpe_plot
python /home/ashrising/Documents/notify_line/notify.py analysis