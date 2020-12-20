#!/bin/sh
python ~/Documents/pddm/scripts/train0.py --config ~/Documents/pddm/config_server/config_cheetah_fs5/cheetah_mppi_force2.txt --output_dir /data/atsushi_data/output/hc --use_gpu --gpu_frac=0.1
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_cheetah_fs5/2dcheetah_rand_force2.txt --output_dir /data/atsushi_data/output/hc --use_gpu --gpu_frac=0.1
