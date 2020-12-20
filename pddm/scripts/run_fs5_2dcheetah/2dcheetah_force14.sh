#!/bin/sh
python ~/Documents/pddm/scripts/train0.py --config ~/Documents/pddm/config_server/config_2dcheetah_fs5/2dcheetah_mppi_force14.txt --output_dir /data/atsushi_data/output/2hc --use_gpu --gpu_frac=0.1
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_2dcheetah_fs5/2dcheetah_rand_force14.txt --output_dir /data/atsushi_data/output/2hc --use_gpu --gpu_frac=0.1
