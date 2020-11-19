#!/bin/bash

make
echo "start testing"
echo

find ./$1/in -type f -name "*.txt" -print | while read input_f ; do
  INPUT=`cat $input_f | ./$1.out`
  OUTPUT=`cat  ${input_f/"in"/"out"}`
  echo  "=== $input_f ==="
  if test $INPUT = $OUTPUT ; then
    echo "OK"
  else
    echo "NG"
    echo "your answer"
    echo $INPUT
    echo
    echo "right answer"
    echo $OUTPUT
  fi
done

echo
echo "end testing"
make clean