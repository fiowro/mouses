#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.jpg; do
  echo $filename
  newfilename=$(printf "%02d" $y)
  y=$((y+1))
  echo $newfilename
  magick $filename -gravity Center -crop 3820x2870+50+190 ./result/img/$newfilename.jpg
#   break
done
