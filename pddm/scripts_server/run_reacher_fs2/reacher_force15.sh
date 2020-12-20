#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force3_rand.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force3_mppi.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.15


python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_server/config_reacher_fs2/reacher_force15_mppi.txt --output_dir ~/Documents/pddm/output/re_force --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_reacher_fs2/reacher_force15_rand.txt --output_dir ~/Documents/pddm/output/re_force --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st