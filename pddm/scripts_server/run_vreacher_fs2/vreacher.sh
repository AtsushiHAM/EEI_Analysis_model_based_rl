#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_mppi.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15

python ~/Documents/pddm/scripts/train3.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_mppi.txt --output_dir /data/atsushi_data/output/vre --use_gpu --gpu_frac=0.08 --control_delta 1 --reward_type st --use_different_env
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_vreacher_fs2/vreacher_rand_ngr.txt --output_dir /data/atsushi_data/output/vre --use_gpu --gpu_frac=0.15 --control_delta 1 --reward_type st
