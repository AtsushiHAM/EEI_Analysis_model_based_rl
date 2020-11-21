#!/bin/sh
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_hopper_fs2/hopper_mppi.txt --output_dir ~/Documents/pddm/output/hp --use_gpu --gpu_frac=0.1
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_hopper_fs2/hopper_rand.txt --output_dir ~/Documents/pddm/output/hp --use_gpu --gpu_frac=0.1