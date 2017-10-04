#!/bin/bash

# This script returns the resolution of the privided cub SAR file

radar_input=$1

catlab from=$1 | grep ProductId | sed -e 's/^[^=]*=//g' | sed -e 's/^[ \t]*//' > info.txt

cube=`cat info.txt | awk 'NR == 1'` 

catlab from=$1 | grep Scale | sed -e 's/^[^=]*=//g' | sed -e 's/^[ \t]*//' >> info.txt

res1=`cat info.txt | awk 'NR == 2'`

catlab from=$1 | grep PixelResolution | sed -e 's/^[^=]*=//g' | sed -e 's/^[ \t]*//' >> info.txt

res2=`cat info.txt | awk 'NR == 3'`

rm info.txt 

FILE="info_$1.txt"

/bin/cat <<EOM >$FILE
cube = $cube
resolution = $res1
resolution = $res2
EOM

rm print.prt