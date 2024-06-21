#!/usr/bin/bash
# pmlc-smart-clean.sh

# time for this task
T=$(date +%s)
# debug log
echo pmlc-smart-clean: $T $(date -uIseconds -d @$T)

# days to keep
N_K=28

#K_3=$(pmlc-smart-fp.sh $T cd 2)
K_D=$(pmlc-smart-fp.sh $T cd $N_K)
K_M=$(pmlc-smart-fp.sh $T cd $N_K | cut -d / -f 1 | sort -u)

# debug log
#echo "  keep (3):" $K_3
echo "  keep ($N_K):" $K_D
echo "  keep (m):" $K_M

should_rm() {
  echo "rm -r" $1
  rm -r $1
}

# check month dir to delete
for i in $(ls | grep "[0-9]\{6\}")
do
  del=1
  for j in $K_M
  do
    if [ "x$i" = "x$j" ]; then
      del=0
      break
    fi
  done

  if [ $del = 1 ]; then
    should_rm $i
  fi
done

# check day dir to delete
for i in $K_M
do
  if [ -d $i ]; then
    for j in $(ls $i | grep "[0-9]\{2\}")
    do
      del=1
      for k in $K_D
      do
        if [ "x$i/$j" = "x$k" ]; then
          del=0
          break
        fi
      done

      if [ $del = 1 ]; then
        should_rm $i/$j
      fi
    done
  fi
done
