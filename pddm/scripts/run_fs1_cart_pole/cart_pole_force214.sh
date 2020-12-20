#!/bin/sh
python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_server/config_cart_pole_fs1/cart_pole_force214_mppi.txt --output_dir /data/atsushi_data/output/cp --use_gpu --gpu_frac=0.1 --control_delta 1
#python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_server/config_cart_pole_fs1/cart_pole_force214_rand.txt --output_dir /data/atsushi_data/output/cp --use_gpu --gpu_frac=0.1 --control_delta 1
