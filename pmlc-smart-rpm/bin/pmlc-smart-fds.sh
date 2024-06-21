#!/usr/bin/bash
# pmlc-smart-fds.sh

# time for this task
T=$(date +%s)
# data dir to write log file
DATA_DIR=$(pmlc-smart-fp.sh $T td)/$1

# debug log
echo pmlc-smart-fds: $1 $T $(date -uIseconds -d @$T) $DATA_DIR/smartctl_a.log

mkdir -p $DATA_DIR

smartctl -n standby,0 -ja /dev/$1 > $DATA_DIR/smartctl_a.json
smartctl -n standby,0 -a /dev/$1 > $DATA_DIR/smartctl_a.log

smartctl -n standby,0 -jl devstat /dev/$1 > $DATA_DIR/smartctl_devstat.json
smartctl -n standby,0 -l devstat /dev/$1 > $DATA_DIR/smartctl_devstat.log
