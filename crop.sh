#!/bin/bash

# This script is getting as input the "crop_sl.txt" file which
# each line contains with the following order the pixel: initial
# sample, initial line, ending sample, ending line
# Then in crops the cub file in the specified range

img_input=$1

clear




#get the pixel limits from the crop_sl file 
s1=`cat crop_sl.txt | awk 'NR == 1'`

l1=`cat crop_sl.txt | awk 'NR == 2'`

s2=`cat crop_sl.txt | awk 'NR == 3'`

l2=`cat crop_sl.txt | awk 'NR == 4'`


 
#compute the wanted pixels range

samples=$(bc <<< "$s2 - $s1")

lines=$(bc <<< "$l2 - $l1")


#crop image

crop from=$1 to=croped_$1 sample=$s1 nsamples=$samples line=$l1 nlines=$lines


rm print.prt

clear