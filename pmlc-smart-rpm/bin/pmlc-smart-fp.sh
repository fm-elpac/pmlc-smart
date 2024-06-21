#!/usr/bin/bash
# pmlc-smart-fp.sh: gen file path

# print each day before now
# $1: current time %s
# $2: number of days
calc_cd(){
  # seconds in 1 day
  local D=86400
  # current time %s (add tomorrow)
  local t=$(($1 + $D))
  # day count
  local c=0

  while [ $c -le $2 ]
  do
    local ym=$(date -ud @$t +%Y%m)
    local d=$(date -ud @$t +%d)
    echo $ym/$d

    t=$(($t - $D))
    ((c++))
  done
}

case "$2" in
  "td")
    # td: time dir
    # format: YYYYmm/dd/%s
    YM=$(date -ud @$1 +%Y%m)
    D=$(date -ud @$1 +%d)
    echo $YM/$D/$1
    ;;
  "cd")
    # cd: clean dir
    calc_cd $1 $3
    ;;
  *)
    # unknown type
    echo "/dev/null"
    ;;
esac
