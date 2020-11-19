#!/bin/bash
FIND_DIR=./$1/in
WORK_DIR=./ABC/171

cd $WORK_DIR
make
echo "start testing"
echo

OKcase=0
WRcase=0
find $FIND_DIR -type f -name "*.txt" -print | while read input_f ; do
  INPUT=`cat $input_f | ./$1.out`
  OUTPUT=`cat  ${input_f/"in"/"out"}`
  echo  "=== ${input_f/$FIND_DIR} ==="
  if test $INPUT = $OUTPUT ; then
    echo "OK"
    OKcase=$((OKcase+=1))
    echo $OKcase
  else
    echo "NG"
    echo "your answer"
    echo $INPUT
    echo
    echo "right answer"
    echo $OUTPUT
    WRcase=$((WRcase+=1))
  fi
done

echo
echo "end testing"

echo "OK case : $OKcase / $((OKcase+WRcase))"
echo "WR case : $WRcase / $((OKcase+WRcase))"
make clean