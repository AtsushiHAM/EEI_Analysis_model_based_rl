#!/bin/sh
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_mppi.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.15

#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_furuta_fs1/furuta_inverted_pendulum_rand.txt --output_dir ~/Documents/pddm/output/ip --use_gpu --gpu_frac=0.05 --control_delta 5
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_reacher_fs2/vreacher_mppi.txt --output_dir ~/Documents/pddm/output/re --use_gpu --gpu_frac=0.15 --control_delta 1
python ~/Documents/pddm-master/pddm/scripts/train.py --config ~/Documents/pddm-master/pddm/config_reacher_fs2/reacher_mppi.txt --output_dir ~/Documents/pddm-master/pddm/output/re --use_gpu --gpu_frac=0.1 --control_delta 1 --reward_type st
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_reacher_fs2/vreacher_rand.txt --output_dir ~/Documents/pddm/output/re --use_gpu --gpu_frac=0.15 --control_delta 1
#python ~/Documents/pddm-master/pddm/scripts/train.py --config ~/Documents/pddm-master/pddm/config_reacher_fs2/vreacher_rand.txt --output_dir ~/Documents/pddm-master/pddm/output/re --use_gpu --gpu_frac=0.15 --control_delta 1 --reward_type st
