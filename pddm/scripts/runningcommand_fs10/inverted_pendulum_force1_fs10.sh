#!/bin/sh
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force1_rand.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.2 --control_delta 10
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_force1_mppi.txt --output_dir ~/Documents/pddm/output/ip_force --use_gpu --gpu_frac=0.2 --control_delta 10

