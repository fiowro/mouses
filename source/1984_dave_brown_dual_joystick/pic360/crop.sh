#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.JPG; do
  echo $filename
  newfilename=$(printf "%02d" $y)
  y=$((y+1))
  echo $newfilename
  magick convert $filename -gravity Center -crop 3330x2450-805+370 ./result/img/$newfilename.jpg
#   break
done
