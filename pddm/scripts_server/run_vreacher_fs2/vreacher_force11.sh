#!/bin/sh
config_mppi="~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force1_rand.txt"
config_rand="~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force1_rand.txt"
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force1_rand.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm-master/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force1_mppi.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.15

python ~/Documents/pddm/scripts/train3.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_force11_mppi.txt --output_dir /data/atsushi_data/output/vre_force --use_gpu --gpu_frac=0.08 --control_delta 1 --reward_type st --use_different_env
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_reacher_fs2/vreacher_rand_ngr.txt --output_dir ~/Documents/pddm/output/re --use_gpu --gpu_frac=0.15 --control_delta 1
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_reacher_fs2/reacher_force11_rand.txt --output_dir /data/atsushi_data/output/vre_force --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st