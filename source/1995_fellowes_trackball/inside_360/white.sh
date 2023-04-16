#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.jpg; do
  echo $filename
  newfilename=$y
  y=$((y+1))
  echo $newfilename
   ../../../../autowhite -m 1 -p 60 $filename result/$filename
done
