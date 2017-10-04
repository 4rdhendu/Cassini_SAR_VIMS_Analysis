#!/bin/bash

# This scripts returns the global stats of a given SAR file

radar_input=$1

#Get average, isolate it and put it to Stats.txt

stats FROM=$1 | grep Average | sed -e 's/^[^=]*=//g' |  sed -e 's/^[ \t]*//' > Stats.txt 

#Get StandardDeviation , isolate it and put it to Stats.txt

stats FROM=$1 | grep StandardDeviation | sed -e 's/^[^=]*=//g' | sed -e 's/^[ \t]*//' >> Stats.txt 

#Get average , isolate it and put it to Stats.txt

avg=`cat Stats.txt | awk 'NR == 1'`

std=`cat Stats.txt | awk 'NR == 2'`

cv=$(bc <<< " scale=14; $std / $avg ")

catoriglab from=$1 | grep MAP_SCALE | sed -e 's/^[^=]*=//g' | sed -e 's/^[ \t]*//' >> Stats.txt

res1=`cat Stats.txt | awk 'NR == 3'` 

catoriglab from=$1 | grep MAP_RESOLUTION | sed -e 's/^[^=]*=//g' | sed -e 's/^[ \t]*//' >> Stats.txt

res2=`cat Stats.txt | awk 'NR == 4'`

rm Stats.txt 

FILE="stats_$1.txt"

/bin/cat <<EOM >$FILE
cv = $cv
Average = $avg
StandardDeviation= $std
resolution = $res1
resolution = $res2
EOM

rm print.prt