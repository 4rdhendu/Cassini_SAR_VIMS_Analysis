#!/bin/bash

# The despecle filter after:
# Bratsolis, E., Bampasidis, G., Solomonidou, A. and Coustenis,
# A., 2012. A despeckle filter for the Cassini synthetic aperture 
# radar images of Titan's surface. Planetary and Space Science,
# 61(1), pp.108-113.
# This script is an adaptation of the aforementioned filter on
# ISIS3 program

#image input
radar_input=$1

stats FROM=$1 | grep Average | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' > temp.txt
avg=`cat temp.txt | awk 'NR == 1'`
stats FROM=$1 | grep StandardDeviation | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' >> temp.txt
std=`cat temp.txt | awk 'NR == 2'`
stats FROM=$1 | grep Maximum | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' >> temp.txt
max=`cat temp.txt | awk 'NR == 3'`
stats FROM=$1 | grep Minimum | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' >> temp.txt
min=`cat temp.txt | awk 'NR == 5'`
a=$(bc <<< "$max + 0.000000001")
resStd=$(bc <<< "$std * 3")
k=$(bc <<< "$avg + $resStd")
echo "*** avg= "$avg" ***"
echo "*** std= "$std" ***"
echo "*** restd= "$resStd" ***"
echo "*** k= "$k" ***"
if [ 1 -eq "$(echo "$k < $a" | bc)" ]
	then
	echo "*** if "$k"<"$a" correct ***"
	median FROM=$1 to=prep1$1 samples=9 lines=9 low=$k high=$a hrs=no his=no lrs=no lis=no null=no filter=inside
	else
	echo "*** if "$k">"$a" correct ***"
	cp $1 prep1$1
fi
b=$(bc <<< "$min-0.000000001")
lowst=$(bc <<< "$avg - 2 * $std")
if [ 1 -eq "$(echo "$lowst > $b" | bc)" ]
	then
	echo "*** if "$lowst">"$b" correct ***"
	median FROM=prep1$1 to=prep2$1 samples=9 lines=9 low=$b high=$lowst hrs=no his=no lrs=no lis=no null=no filter=inside
	else
	echo "*** if "$lowst"<"$b" correct ***"
	cp prep1$1 prep2$1
fi
stats FROM=prep2$1 | grep Minimum | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' > temp.txt
min1=`cat temp.txt | awk 'NR == 1'`
if [ 1 -eq "$(echo "$min1 < 0" | bc)" ]
	then
	tmp=$(bc <<< "-1*$min1")
	zero=$(bc <<< "$tmp + 0.000000001")
	algebra from=prep2$1 to=prepared_$1 operator=unary c=$zero
	else
	cp prep2$1 prepared_$1
fi

######################### FILTERING
echo "*** start image filtering... ***"
cat prepared_$1 >> temp_image1.cub
#set null pixels equal to 0
stretch from=temp_image1.cub to=temp_image.cub null=0 lis=0 lrs=0 his=0 hrs=0	
#image to temp

temp=temp_image.cub
fx F1=temp_image.cub TO=output0.cub equation=F1*0.08 
echo "*** create kernel file... ***"
FILE="kernel.txt"
/bin/cat <<EOM >$FILE
  Group=Kernel
    samples=3
    lines=3
    weight=1
    data= (0 , 0.25 , 0,
           0.25 , 0 , 0.25,
	   0 , 0.25 , 0)
  EndGroup
EOM
echo "*** starting loop... ***"
echo "L*img OUT OF THE LOOP"
i=1
while [ "$i" -le 100 ] 
do 
  #echo "start while"
  echo $i
	#creates Null frame of 1
	pad from=$temp to=a.cub left=1 right=1 top=1 bottom=1

	#gives 0 value around null pixels
	stretch from=a.cub to=b.cub null=0

	#passing filter
        kernfilter FROM=b.cub TO=c.cub KERNEL=kernel.txt

	#crop external frame
	cropspecial from=c.cub to=output.cub
        echo "imgKER*(1-l)"
        fx F1=output.cub TO=output2.cub equation=F1*0.92
        echo "L*img+(1-L)*imgKER"
	fx F1=output2.cub F2=output0.cub TO=final.cub equation=F1+F2
temp=final.cub
  i=$(($i+1))   
done
	stretch from=$1 to=mask.cub lis=null lrs=null his=null hrs=null
	mask from=final.cub mask=mask.cub to=filtered_$1
isis2std red=filtered_$1 green=filtered_$1 blue=filtered_$1 to=filtered_$1.tiff format=tiff bittype=u16bit mode=rgb

crop from = filtered_$1 to= bsq_filtered_$1+BandSequential
crop from = $1 to= bsq_$1+BandSequential


rm filtered_$1.tiff.tfw	
rm output0.cub
rm output.cub
rm output2.cub
rm a.cub
rm b.cub
rm c.cub
rm temp_image.cub
rm temp_image1.cub
rm final.cub
rm mask.cub
rm kernel.txt

clear
