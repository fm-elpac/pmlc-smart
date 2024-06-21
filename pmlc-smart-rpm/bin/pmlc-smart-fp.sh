#!/usr/bin/bash
# pmlc-smart-fp.sh: gen file path

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
    echo "TODO cd"
    ;;
  *)
    # unknown type
    echo "/dev/null"
    ;;
esac
