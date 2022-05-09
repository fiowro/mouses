#!/bin/bash
mkdir -p ./result/img
y=1
for filename in ./*.jpg; do
  echo $filename
  newfilename=$y
  y=$((y+1))
  echo $newfilename
#  convert $filename -gravity Center -crop 80x65%\!  ./result/img/$newfilename.jpg
#  convert $filename -gravity Center -crop 4000x2300-100-100 ./result/img/$newfilename.jpg
#  break
   ../../../../autowhite -m 1 -p 30 $filename result/$filename
done
