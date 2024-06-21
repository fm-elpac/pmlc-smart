#!/usr/bin/bash
# pmlc-smart-dds.sh

# time for this task
T=$(date +%s)
# data dir to write log file
DATA_DIR=$(pmlc-smart-fp.sh $T td)/$1

SC_OPT="-n standby"
# force check
if [ "xf" = "x$2" ]; then
  SC_OPT=
fi

# debug log
echo pmlc-smart-dds: $1 $T $(date -uIseconds -d @$T) $DATA_DIR/smartctl_x.log $SC_OPT

mkdir -p $DATA_DIR

smartctl $SC_OPT -jx /dev/$1 > $DATA_DIR/smartctl_x.json
smartctl $SC_OPT -x /dev/$1 > $DATA_DIR/smartctl_x.log
