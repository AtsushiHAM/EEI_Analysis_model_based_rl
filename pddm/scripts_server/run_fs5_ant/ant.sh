#!/bin/sh
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_ant_fs5/ant_mppi.txt --output_dir ~/Documents/pddm/output/an --use_gpu --gpu_frac=0.1
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_ant_fs5/ant_rand.txt --output_dir ~/Documents/pddm/output/an --use_gpu --gpu_frac=0.1
