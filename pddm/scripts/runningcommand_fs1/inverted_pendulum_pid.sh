#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/short_furuta_inverted_pendulum_test_pid.txt --output_dir ~/Documents/pddm/output/pid --control_delta 10
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/short_furuta_inverted_pendulum_test_pid.txt --output_dir ~/Documents/pddm/output/pid --control_delta 5
python ~/Documents/pddm-master/pddm/scripts/train.py --config ~/Documents/pddm-master/pddm/config_furuta_fs1/furuta_inverted_pendulum_pid.txt --output_dir /media/ashrising/2619822E48B88AD8/pddm/analysis_data/pid --control_delta 1

#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/furuta_inverted_pendulum_mppi.txt --output_dir ../output/ip --use_gpu --gpu_frac=0.2
