#!/bin/sh
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_cheetah_fs5/cheetah_mppi.txt --output_dir /data/atsushi_data/output/hc --use_gpu --gpu_frac=0.1
python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_cheetah_fs5/cheetah_rand.txt --output_dir /data/atsushi_data/output/hc --use_gpu --gpu_frac=0.1