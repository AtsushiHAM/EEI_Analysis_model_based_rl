#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_mppi.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15

#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.05 --control_delta 5
python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_server/config_furuta_fs1/furuta_inverted_pendulum_mppi.txt --output_dir /data/atsushi_data/output/ip --use_gpu --gpu_frac=0.1 --control_delta 1
#python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir /data/atsushi_data/output/ip --use_gpu --gpu_frac=0.1 --control_delta 1

