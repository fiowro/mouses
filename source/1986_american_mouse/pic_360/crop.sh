#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.jpg; do
  echo $filename
  newfilename=$(printf "%02d" $y)
  y=$((y+1))
  echo $newfilename
#  convert $filename -gravity Center -crop 80x65%\!  ./result/img/$newfilename.jpg
  convert $filename -gravity Center -crop 4000x2100-100+200 ./result/img/$newfilename.jpg
#  break
done
