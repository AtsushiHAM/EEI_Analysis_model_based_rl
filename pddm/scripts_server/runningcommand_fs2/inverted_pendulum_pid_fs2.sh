#!/bin/sh
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/short_furuta_inverted_pendulum_test_pid.txt --output_dir ~/Documents/pddm/output/pid --control_delta 10
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/short_furuta_inverted_pendulum_test_pid.txt --output_dir ~/Documents/pddm/output/pid --control_delta 5
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/short_furuta_inverted_pendulum_test_pid.txt --output_dir ~/Documents/pddm/output/pid --control_delta 1

#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config/furuta_inverted_pendulum_mppi.txt --output_dir ../output/ip --use_gpu --gpu_frac=0.2
