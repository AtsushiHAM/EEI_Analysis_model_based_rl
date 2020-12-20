#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force2_rand.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force2_mppi.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.15

python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_force214_mppi.txt --output_dir /data/atsushi_data/output/vre_force --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_force214_rand.txt --output_dir /data/atsushi_data/output/vre_force --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st
