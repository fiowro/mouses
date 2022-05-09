#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.jpg; do
  echo $filename
  newfilename=$(printf "%02d" $y)
  y=$((y+1))
  echo $newfilename
  convert $filename -gravity Center -crop 4200x2300+150+80 ./result/img/$newfilename.jpg
#  break
done
