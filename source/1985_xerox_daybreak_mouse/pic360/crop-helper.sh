#!/bin/bash
mkdir -p result/tmp0
files=($(ls ./*.jpg))
len=${#files[@]}
for (( i=0; i<$len; i++ )); do
#echo "${files[$i]}"
convert ${files[$i]} -colorspace gray  -threshold 73% result/tmp0/${files[$i]}
###convert result/tmp0/${files[$i]} -transparent white result/tmp0/${files[$i]}.png
magick ${files[$i]} \( result/tmp0/${files[$i]} -alpha off -negate \) -compose copyalpha -composite result/tmp0/${files[$i]}.png
done
#convert result/tmp0/*.png -background beige -compose Lighten -layers Flatten out.jpg
#for (( i=0; i<$len; i++ )); do
convert result/tmp0/${files[1]}.png result/tmp0/${files[3]}.png result/tmp0/${files[5]}.png result/tmp0/${files[7]}.png result/tmp0/${files[$9]}.png result/tmp0/${files[11]}.png result/tmp0/${files[13]}.png result/tmp0/${files[15]}.png result/tmp0/${files[17]}.png result/tmp0/${files[19]}.png result/tmp0/${files[21]}.png result/tmp0/${files[23]}.png result/tmp0/${files[25]}.png result/tmp0/${files[27]}.png result/tmp0/${files[31]}.png result/tmp0/${files[33]}.png result/tmp0/${files[35]}.png result/tmp0/${files[37]}.png result/tmp0/${files[39]}.png result/tmp0/${files[41]}.png result/tmp0/${files[43]}.png result/tmp0/${files[45]}.png result/tmp0/${files[47]}.png -background white -layers Flatten result/result.png
#convert result/tmp0/${files[$i]} result/tmp0/${files[$i+3]} result/tmp0/${files[$i+5]} -composite result/tmp1/$i.jpg
#i=$i+20
#done
#files=($(ls ./result/tmp1/*.jpg))
#len=${#files[@]}
#for (( i=0; i<$len; i++ )); do
#echo "${files[$i]}"
#convert ${files[$i]} ${files[$i+1]} ${files[$i+2]} -composite result/tmp2/$i.jpg
#i=$i+2
#done
#files=($(ls ./result/tmp2/*.jpg))
#convert ${files[0]} ${files[1]} ${files[2]} -composite result/result.jpg

