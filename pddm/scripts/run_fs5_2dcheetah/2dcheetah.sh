#!/bin/sh
python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_server/config_2dcheetah_fs5/2dcheetah_mppi.txt --output_dir /data/atsushi_data/output/2hc --use_gpu --gpu_frac=0.1
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_cheetah_fs5/2dcheetah_rand.txt --output_dir /data/atsushi_data/output/hc --use_gpu --gpu_frac=0.1
