#!/bin/bash

# Given a list ( named "lista.txt") which contains the paths to all cub files it returns the ones that include the given by user planetographic coordinates
# NOTE: The list should be in the same folder as the script

read -p "Enter latitude : " lat
read -p "Enter longitude : " lon

 num=$(wc -l lista.txt | sed 's/[^0-9]*//g')
echo "nuber of input cubes = "$num""
read -p "Press enter to nontinue "

FILE="flyby_report.txt"
/bin/cat <<EOM >$FILE
REPORT: Matching SAR/RADARS

EOM

count=1
while IFS='' read -r line || [[ -n "$line" ]]; do
echo "Loading . . . "$count" / "$num""
mappt from=$line type=ground latitude=$lat longitude=$lon allowoutside=no | grep Filename | sed -e 's/^[^=]*=//g'| sed -e 's/^[ \t]*//' >> flyby_report.txt
mappt from=$line type=ground latitude=$lat longitude=$lon allowoutside=no | grep PixelValue | sed -e 's/^[^=]*=//g'| sed -e 's/^[ \t]*//' >> flyby_report.txt
	let	count=count+1
			done < "lista.txt"
