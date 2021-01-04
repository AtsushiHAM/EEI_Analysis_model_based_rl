#!/bin/sh
python ~/Documents/pddm/scripts/train1.py --config ~/Documents/pddm/config_server/config_cheetah_fs5_cgr/cheetah_mppi_cgr.txt --output_dir /data/atsushi_data/output/hc_cgr --use_gpu --gpu_frac=0.1
#python ~/Documents/pddm/scripts/train.py --config ~/Documents/pddm/config_server/config_cheetah_fs5/2dcheetah_rand.txt --output_dir /data/atsushi_data/output/hc --use_gpu --gpu_frac=0.1
