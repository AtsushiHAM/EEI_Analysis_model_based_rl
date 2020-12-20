#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_mppi.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15

python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_mppi.txt --output_dir /data/atsushi_data/output/vre --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_rand.txt --output_dir /data/atsushi_data/output/vre --use_gpu --gpu_frac=0.15 --control_delta 1 --reward_type st
