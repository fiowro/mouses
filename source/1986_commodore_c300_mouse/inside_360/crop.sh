#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.jpg; do
  echo $filename
  newfilename=$y
  y=$((y+1))
  echo $newfilename
#  convert $filename -gravity Center -crop 50x58%\!  ./result/img/$newfilename.jpg
  convert $filename -gravity Center -crop 3000x1800+50-300 ./result/img/$newfilename.jpg
#  break
done
