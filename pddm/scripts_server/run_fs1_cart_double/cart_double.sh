#!/bin/sh
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_cart_double_fs1/cart_double_rand.txt --output_dir ~/Documents/pddm/output/cd --use_gpu --gpu_frac=0.3
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_cart_double_fs1/cart_double_mppi.txt --output_dir ~/Documents/pddm/output/cd --use_gpu --gpu_frac=0.3
