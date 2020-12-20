#!/bin/sh
python ~/Documents/pddm/scripts/train3.py --config ~/Documents/pddm/config_server/config_hopper_fs2/hopper_mppi.txt --output_dir /data/atsushi_data/output/hp --use_gpu --gpu_frac=0.2
#python ~/Documents/pddm/scripts/train3.py --config ~/Documents/pddm/config_server/config_hopper_fs2/hopper_rand.txt --output_dir /data/atsushi_data/output/hp --use_gpu --gpu_frac=0.1
