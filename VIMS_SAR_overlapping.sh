#!/bin/bash

#image input
vims_input=$1
radar_input=$2

#set path as variable
path="$PWD"
#create subfolders
mkdir vims
mkdir radar
mkdir vims_and_radar


clear
echo "####################################################################" 
echo "# 		*** Vims Image Processing ***			 "
echo "#                                   				 "
echo "#								 "
echo "#	Operations:						 "
echo "#								 "
echo "#		* null=0					 "
echo "# 		* explode					 "
echo "# 		* cam2map					 "
echo "# 		* map2cam					 "
echo "# 		* trmbands						 "
echo "####################################################################" 



echo "*** start fillgap RADAR interpolation... ...across samples... ***"
fillgap from=$2 to=$path/radar/linearsample_$2 interp=linear
echo "*** start fillgap RADAR interpolation... ...across lines... ***"
fillgap from=$2 to=$path/radar/linearline_$2 interp=linear direction=line
echo "*** export interpolated RADAR ***"
FILE="cubeit.lis"
/bin/cat <<EOM >$FILE

$path/radar/linearline_$2
$path/radar/linearsample_$2

EOM
automos fromlist=cubeit.lis mosaic=mos.cub priority=average matchbandbin=no
explode from=mos.cub to=$path/radar/linear_$2
map2map from=$path/radar/linear_$2.band0001.cub map=$2 to=$path/radar/interpolated_$2 matchmap=yes
isis2std red=$path/radar/interpolated_$2 green=$path/radar/interpolated_$2 blue=$path/radar/interpolated_$2 to=$path/radar/interpolated_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/radar/interpolated_$2.tiff.tfw
rm cubeit.lis
rm $path/radar/linear_$2.band0001.cub
rm $path/radar/linear_$2.band0002.cub
rm mos.cub
rm $path/radar/linearsample_$2
rm $path/radar/linearline_$2


echo "*** explode VIMS cube ***"
explode from=$1 to=$path/vims/$1

echo "*** remove not wanted bands ***"
rm	$path/vims/$1.band0001.cub
rm	$path/vims/$1.band0002.cub
rm	$path/vims/$1.band0003.cub
rm	$path/vims/$1.band0004.cub
rm	$path/vims/$1.band0005.cub
rm	$path/vims/$1.band0006.cub
rm	$path/vims/$1.band0007.cub
rm	$path/vims/$1.band0008.cub
rm	$path/vims/$1.band0009.cub
rm	$path/vims/$1.band0010.cub
rm	$path/vims/$1.band0011.cub
rm	$path/vims/$1.band0012.cub
#rm	$path/vims/$1.band0013.cub
rm	$path/vims/$1.band0014.cub
rm	$path/vims/$1.band0015.cub
rm	$path/vims/$1.band0016.cub
rm	$path/vims/$1.band0017.cub
rm	$path/vims/$1.band0018.cub
rm	$path/vims/$1.band0019.cub
rm	$path/vims/$1.band0020.cub
rm	$path/vims/$1.band0021.cub
rm	$path/vims/$1.band0022.cub
rm	$path/vims/$1.band0023.cub
rm	$path/vims/$1.band0024.cub
#rm	$path/vims/$1.band0025.cub
rm	$path/vims/$1.band0026.cub
rm	$path/vims/$1.band0027.cub
rm	$path/vims/$1.band0028.cub
rm	$path/vims/$1.band0029.cub
rm	$path/vims/$1.band0030.cub
rm	$path/vims/$1.band0031.cub
rm	$path/vims/$1.band0032.cub
rm	$path/vims/$1.band0033.cub
rm	$path/vims/$1.band0034.cub
rm	$path/vims/$1.band0035.cub
rm	$path/vims/$1.band0036.cub
rm	$path/vims/$1.band0037.cub
rm	$path/vims/$1.band0038.cub
rm	$path/vims/$1.band0039.cub
rm	$path/vims/$1.band0040.cub
rm	$path/vims/$1.band0041.cub
rm	$path/vims/$1.band0042.cub
#rm	$path/vims/$1.band0043.cub
rm	$path/vims/$1.band0044.cub
rm	$path/vims/$1.band0045.cub
rm	$path/vims/$1.band0046.cub
rm	$path/vims/$1.band0047.cub
rm	$path/vims/$1.band0048.cub
rm	$path/vims/$1.band0049.cub
rm	$path/vims/$1.band0050.cub
rm	$path/vims/$1.band0051.cub
rm	$path/vims/$1.band0052.cub
rm	$path/vims/$1.band0053.cub
rm	$path/vims/$1.band0054.cub
rm	$path/vims/$1.band0055.cub
rm	$path/vims/$1.band0056.cub
rm	$path/vims/$1.band0057.cub
rm	$path/vims/$1.band0058.cub
rm	$path/vims/$1.band0059.cub
rm	$path/vims/$1.band0060.cub
rm	$path/vims/$1.band0061.cub
rm	$path/vims/$1.band0062.cub
rm	$path/vims/$1.band0063.cub
rm	$path/vims/$1.band0064.cub
rm	$path/vims/$1.band0065.cub
rm	$path/vims/$1.band0066.cub
rm	$path/vims/$1.band0067.cub
rm	$path/vims/$1.band0068.cub
rm	$path/vims/$1.band0069.cub
rm	$path/vims/$1.band0070.cub
#rm	$path/vims/$1.band0071.cub
rm	$path/vims/$1.band0072.cub
rm	$path/vims/$1.band0073.cub
rm	$path/vims/$1.band0074.cub
rm	$path/vims/$1.band0075.cub
rm	$path/vims/$1.band0076.cub
rm	$path/vims/$1.band0077.cub
rm	$path/vims/$1.band0078.cub
rm	$path/vims/$1.band0079.cub
rm	$path/vims/$1.band0080.cub
rm	$path/vims/$1.band0081.cub
rm	$path/vims/$1.band0082.cub
rm	$path/vims/$1.band0083.cub
rm	$path/vims/$1.band0084.cub
rm	$path/vims/$1.band0085.cub
rm	$path/vims/$1.band0086.cub
rm	$path/vims/$1.band0087.cub
rm	$path/vims/$1.band0088.cub
rm	$path/vims/$1.band0089.cub
rm	$path/vims/$1.band0090.cub
rm	$path/vims/$1.band0091.cub
rm	$path/vims/$1.band0092.cub
rm	$path/vims/$1.band0093.cub
rm	$path/vims/$1.band0094.cub
rm	$path/vims/$1.band0095.cub
rm	$path/vims/$1.band0096.cub
rm	$path/vims/$1.band0097.cub
rm	$path/vims/$1.band0098.cub
rm	$path/vims/$1.band0099.cub
rm	$path/vims/$1.band0100.cub
rm	$path/vims/$1.band0101.cub
rm	$path/vims/$1.band0102.cub
rm	$path/vims/$1.band0103.cub
rm	$path/vims/$1.band0104.cub
rm	$path/vims/$1.band0105.cub
rm	$path/vims/$1.band0106.cub
rm	$path/vims/$1.band0107.cub
rm	$path/vims/$1.band0108.cub
rm	$path/vims/$1.band0109.cub
rm	$path/vims/$1.band0110.cub
rm	$path/vims/$1.band0111.cub
rm	$path/vims/$1.band0112.cub
rm	$path/vims/$1.band0113.cub
rm	$path/vims/$1.band0114.cub
rm	$path/vims/$1.band0115.cub
rm	$path/vims/$1.band0116.cub
rm	$path/vims/$1.band0117.cub
rm	$path/vims/$1.band0118.cub
rm	$path/vims/$1.band0119.cub
rm	$path/vims/$1.band0120.cub
rm	$path/vims/$1.band0121.cub
rm	$path/vims/$1.band0122.cub
rm	$path/vims/$1.band0123.cub
rm	$path/vims/$1.band0124.cub
rm	$path/vims/$1.band0125.cub
rm	$path/vims/$1.band0126.cub
rm	$path/vims/$1.band0127.cub
rm	$path/vims/$1.band0128.cub
rm	$path/vims/$1.band0129.cub
rm	$path/vims/$1.band0130.cub
rm	$path/vims/$1.band0131.cub
rm	$path/vims/$1.band0132.cub
rm	$path/vims/$1.band0133.cub
rm	$path/vims/$1.band0134.cub
rm	$path/vims/$1.band0135.cub
rm	$path/vims/$1.band0136.cub
rm	$path/vims/$1.band0137.cub
rm	$path/vims/$1.band0138.cub
rm	$path/vims/$1.band0139.cub
rm	$path/vims/$1.band0140.cub
rm	$path/vims/$1.band0141.cub
rm	$path/vims/$1.band0142.cub
rm	$path/vims/$1.band0143.cub
rm	$path/vims/$1.band0144.cub
rm	$path/vims/$1.band0145.cub
rm	$path/vims/$1.band0146.cub
rm	$path/vims/$1.band0147.cub
rm	$path/vims/$1.band0148.cub
rm	$path/vims/$1.band0149.cub
rm	$path/vims/$1.band0150.cub
rm	$path/vims/$1.band0151.cub
rm	$path/vims/$1.band0152.cub
rm	$path/vims/$1.band0153.cub
rm	$path/vims/$1.band0154.cub
rm	$path/vims/$1.band0155.cub
rm	$path/vims/$1.band0156.cub
rm	$path/vims/$1.band0157.cub
rm	$path/vims/$1.band0158.cub
rm	$path/vims/$1.band0159.cub
rm	$path/vims/$1.band0160.cub
rm	$path/vims/$1.band0161.cub
rm	$path/vims/$1.band0162.cub
rm	$path/vims/$1.band0163.cub
rm	$path/vims/$1.band0164.cub
rm	$path/vims/$1.band0165.cub
rm	$path/vims/$1.band0166.cub
rm	$path/vims/$1.band0167.cub
rm	$path/vims/$1.band0168.cub
rm	$path/vims/$1.band0169.cub
rm	$path/vims/$1.band0170.cub
rm	$path/vims/$1.band0171.cub
rm	$path/vims/$1.band0172.cub
rm	$path/vims/$1.band0173.cub
rm	$path/vims/$1.band0174.cub
rm	$path/vims/$1.band0175.cub
rm	$path/vims/$1.band0176.cub
rm	$path/vims/$1.band0177.cub
rm	$path/vims/$1.band0178.cub
rm	$path/vims/$1.band0179.cub
rm	$path/vims/$1.band0180.cub
rm	$path/vims/$1.band0181.cub
rm	$path/vims/$1.band0182.cub
rm	$path/vims/$1.band0183.cub
rm	$path/vims/$1.band0184.cub
rm	$path/vims/$1.band0185.cub
rm	$path/vims/$1.band0186.cub
rm	$path/vims/$1.band0187.cub
rm	$path/vims/$1.band0188.cub
rm	$path/vims/$1.band0189.cub
rm	$path/vims/$1.band0190.cub
rm	$path/vims/$1.band0191.cub
rm	$path/vims/$1.band0192.cub
rm	$path/vims/$1.band0193.cub
rm	$path/vims/$1.band0194.cub
rm	$path/vims/$1.band0195.cub
rm	$path/vims/$1.band0196.cub
rm	$path/vims/$1.band0197.cub
rm	$path/vims/$1.band0198.cub
rm	$path/vims/$1.band0199.cub
rm	$path/vims/$1.band0200.cub
rm	$path/vims/$1.band0201.cub
rm	$path/vims/$1.band0202.cub
rm	$path/vims/$1.band0203.cub
rm	$path/vims/$1.band0204.cub
rm	$path/vims/$1.band0205.cub
rm	$path/vims/$1.band0206.cub
rm	$path/vims/$1.band0207.cub
rm	$path/vims/$1.band0208.cub
rm	$path/vims/$1.band0209.cub
rm	$path/vims/$1.band0210.cub
rm	$path/vims/$1.band0211.cub
rm	$path/vims/$1.band0212.cub
rm	$path/vims/$1.band0213.cub
rm	$path/vims/$1.band0214.cub
rm	$path/vims/$1.band0215.cub
rm	$path/vims/$1.band0216.cub
rm	$path/vims/$1.band0217.cub
rm	$path/vims/$1.band0218.cub
rm	$path/vims/$1.band0219.cub
rm	$path/vims/$1.band0220.cub
rm	$path/vims/$1.band0221.cub
rm	$path/vims/$1.band0222.cub
rm	$path/vims/$1.band0223.cub
rm	$path/vims/$1.band0224.cub
rm	$path/vims/$1.band0225.cub
rm	$path/vims/$1.band0226.cub
rm	$path/vims/$1.band0227.cub
rm	$path/vims/$1.band0228.cub
rm	$path/vims/$1.band0229.cub
rm	$path/vims/$1.band0230.cub
rm	$path/vims/$1.band0231.cub
rm	$path/vims/$1.band0232.cub
rm	$path/vims/$1.band0233.cub
rm	$path/vims/$1.band0234.cub
rm	$path/vims/$1.band0235.cub
rm	$path/vims/$1.band0236.cub
rm	$path/vims/$1.band0237.cub
rm	$path/vims/$1.band0238.cub
rm	$path/vims/$1.band0239.cub
rm	$path/vims/$1.band0240.cub
rm	$path/vims/$1.band0241.cub
rm	$path/vims/$1.band0242.cub
rm	$path/vims/$1.band0243.cub
rm	$path/vims/$1.band0244.cub
rm	$path/vims/$1.band0245.cub
rm	$path/vims/$1.band0246.cub
rm	$path/vims/$1.band0247.cub
rm	$path/vims/$1.band0248.cub
#rm	$path/vims/$1.band0249.cub
rm	$path/vims/$1.band0250.cub
rm	$path/vims/$1.band0251.cub
rm	$path/vims/$1.band0252.cub
rm	$path/vims/$1.band0253.cub
rm	$path/vims/$1.band0254.cub
rm	$path/vims/$1.band0255.cub
rm	$path/vims/$1.band0256.cub

echo "*** make new vims cube ***"
FILE="cubeit.lis"
/bin/cat <<EOM >$FILE

$path/vims/$1.band0025.cub
$path/vims/$1.band0043.cub
$path/vims/$1.band0071.cub
$path/vims/$1.band0249.cub
$path/vims/$1.band0013.cub

EOM
cubeit fromlist=cubeit.lis to=$path/vims/selected_bands_$1
rm cubeit.lis

echo "*** mapping VIMS to match RADAR ***"
cam2map from=$path/vims/selected_bands_$1 map=$path/radar/interpolated_$2 to=$path/vims/maped_$1 matchmap=yes
explode from=$path/vims/maped_$1 to=$path/vims/maped_$1
isis2std red=$path/vims/maped_$1.band0005.cub green=$path/vims/maped_$1.band0005.cub blue=$path/vims/maped_$1.band0005.cub to=$path/vims/vims_1.08mm_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/vims_1.08mm_$1.tiff.tfw
isis2std red=$path/vims/maped_$1.band0001.cub green=$path/vims/maped_$1.band0001.cub blue=$path/vims/maped_$1.band0001.cub to=$path/vims/vims_1.28mm_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/vims_1.28mm_$1.tiff.tfw
isis2std red=$path/vims/maped_$1.band0002.cub green=$path/vims/maped_$1.band0002.cub blue=$path/vims/maped_$1.band0002.cub to=$path/vims/vims_1.57mm_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/vims_1.57mm_$1.tiff.tfw
isis2std red=$path/vims/maped_$1.band0003.cub green=$path/vims/maped_$1.band0003.cub blue=$path/vims/maped_$1.band0003.cub to=$path/vims/vims_2.03mm_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/vims_2.03mm_$1.tiff.tfw
isis2std red=$path/vims/maped_$1.band0004.cub green=$path/vims/maped_$1.band0004.cub blue=$path/vims/maped_$1.band0004.cub to=$path/vims/vims_5.00mm_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/vims_5.00mm_$1.tiff.tfw
isis2std red=$path/vims/maped_$1.band0004.cub green=$path/vims/maped_$1.band0002.cub blue=$path/vims/maped_$1.band0001.cub to=$path/vims/maped_r5.00g1.57b1.28_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/maped_r5.00g1.57b1.28_$1.tiff.tfw
isis2std red=$path/vims/maped_$1.band0001.cub green=$path/vims/maped_$1.band0002.cub blue=$path/vims/maped_$1.band0003.cub to=$path/vims/maped_r1.28g1.57b2.03_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/maped_r1.28g1.57b2.03_$1.tiff.tfw

echo "*** divide compnents from VIMS ***"
echo "*** divide 1.57 / 1.27***"
fx f1=$path/vims/maped_$1.band0002.cub f2=$path/vims/maped_$1.band0001.cub to=$path/vims/ratio_1.57-1.27_$1 equation=F1/F2
isis2std red=$path/vims/ratio_1.57-1.27_$1 green=$path/vims/ratio_1.57-1.27_$1 blue=$path/vims/ratio_1.57-1.27_$1 to=$path/vims/ratio_1.57-1.27_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/ratio_1.57-1.27_$1.tiff.tfw
echo "*** divide 2.03 / 1.27***"
fx f1=$path/vims/maped_$1.band0003.cub f2=$path/vims/maped_$1.band0001.cub to=$path/vims/ratio_2.03-1.27_$1 equation=F1/F2
isis2std red=$path/vims/ratio_2.03-1.27_$1 green=$path/vims/ratio_2.03-1.27_$1 blue=$path/vims/ratio_2.03-1.27_$1 to=$path/vims/ratio_2.03-1.27_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/ratio_2.03-1.27_$1.tiff.tfw
echo "*** divide 1.27 / 1.08***"
fx f1=$path/vims/maped_$1.band0001.cub f2=$path/vims/maped_$1.band0005.cub to=$path/vims/ratio_1.27-1.08_$1 equation=F1/F2
isis2std red=$path/vims/ratio_1.27-1.08_$1 green=$path/vims/ratio_1.27-1.08_$1 blue=$path/vims/ratio_1.27-1.08_$1 to=$path/vims/ratio_1.27-1.08_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/ratio_1.27-1.08_$1.tiff.tfw
isis2std red=$path/vims/ratio_1.57-1.27_$1 green=$path/vims/ratio_2.03-1.27_$1 blue=$path/vims/ratio_1.27-1.08_$1 to=$path/vims/ratio_rgb1_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/ratio_rgb1_$1.tiff.tfw
isis2std red=$path/vims/ratio_1.27-1.08_$1 green=$path/vims/ratio_2.03-1.27_$1 blue=$path/vims/ratio_1.57-1.27_$1 to=$path/vims/ratio_rgb2_$1.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims/ratio_rgb2_$1.tiff.tfw

echo "*** maped VIMS return to camera projection ***"
map2cam from=$path/vims/maped_$1 match=$1 to=$path/vims/croped_vims1_$1

echo "*** export VIMS overlapping area ...no interpolation... ***"
specadd from=$path/vims/selected_bands_$1 match=$path/vims/croped_vims1_$1 to=$path/vims/croped_vims_$1

echo "*** remove null pixels from VIMS cam projection ...leaves only RADAR portion... ***"
cropspecial from=$path/vims/croped_vims_$1 to=$path/vims/newvims_$1 hrs=yes lrs=yes his=yes lis=yes

echo "*** flilp VIMS to mach EW direction ***"
flip from=$path/vims/croped_vims1_$1 to=$path/vims/radararea_$1
explode from=$path/vims/radararea_$1 to=$path/vims/radararea_$1
isis2std red=$path/vims/radararea_$1.band0003.cub green=$path/vims/radararea_$1.band0002.cub blue=$path/vims/radararea_$1.band0001.cub to=$path/vims/croped_r2.03g1.57b1.28_$1.tiff format=tiff bittype=u16bit mode=rgb


###########################
echo "*** START IMAGE FILTERING FOR ORIGINAL RADAR CUBE ***"

######################### PREPROCESSING
stats FROM=$path/radar/interpolated_$2 | grep Minimum | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' > temp.txt
min1=`cat temp.txt | awk 'NR == 1'`
#eliminate negative pixel values
if [ 1 -eq "$(echo "$min1 < 0" | bc)" ]
	then
	echo "*** AN "$min1"<0 swsto ***"
	min=$(bc <<< "-1.1 * $min1")
	else
	echo "*** AN "$min1">0 swsto ***"
	min=0
fi
fx f1=$path/radar/interpolated_$2 to=$path/radar/minimum.cub equation=F1+$min
echo "*** "$min1"-> egine -> "$min" ***"
stats FROM=$path/radar/minimum.cub | grep Average | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' > temp.txt
avg=`cat temp.txt | awk 'NR == 1'`
stats FROM=$path/radar/minimum.cub| grep StandardDeviation | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' >> temp.txt
std=`cat temp.txt | awk 'NR == 2'`
stats FROM=$path/radar/minimum.cub| grep Maximum | sed -e 's/^[^=]*=//g'|  sed -e 's/^[ \t]*//' >> temp.txt
max=`cat temp.txt | awk 'NR == 3'`
a=$(bc <<< "$max+0.000000000001")
resStd=$(bc <<< "$std * 4")
k=$(bc <<< "$avg + $resStd")
if [ 1 -eq "$(echo "$k < $a" | bc)" ]
	then
	echo "*** AN "$k"<"$a" swsto ***"
	median FROM=$path/radar/minimum.cub to=$path/radar/preparedhi_$2 samples=9 lines=9 low=$k high=$a hrs=no his=no lrs=no lis=no null=no filter=inside
	rm $path/radar/minimum.cub
	else
	echo "*** AN "$k">"$a" swsto ***"
	mv $path/radar/minimum.cub $path/radar/preparedhi_$2

fi


######################### FILTERING
echo "*** start image filtering... ***"
cat $path/radar/preparedhi_$2 >> temp_image1.cub
#set null pixels equal to 0
stretch from=temp_image1.cub to=temp_image.cub null=0 lis=0 lrs=0 his=0 hrs=0	
#ANATHESH temp eikonas se metablhth
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
	#dimiourgei plaisio Null timwn eurous 1 gurw apo tin eikona
	pad from=$temp to=a.cub left=1 right=1 top=1 bottom=1
	#dinei tin timi 0 gurw sta null pixels gurw apo tin eikona
	stretch from=a.cub to=b.cub null=0
	#pernaei to filtro
        kernfilter FROM=b.cub TO=c.cub KERNEL=kernel.txt
	#meta to perasma tou filtrou apokoptonte oi perimetrikes times kai pernoun tin timi null
	#opote apokovoume aftes tis times kai epistrefoume stin arxiki diastasi tou cub
	cropspecial from=c.cub to=output.cub
        echo "imgKER*(1-l)"
        fx F1=output.cub TO=output2.cub equation=F1*0.92
        echo "L*img+(1-L)*imgKER"
	fx F1=output2.cub F2=output0.cub TO=final.cub equation=F1+F2
temp=final.cub
  i=$(($i+1))   
done
	stretch from=$path/radar/interpolated_$2 to=mask.cub lis=null lrs=null his=null hrs=null
	mask from=final.cub mask=mask.cub to=$path/radar/filtered_$2
isis2std red=$path/radar/filtered_$2 green=$path/radar/filtered_$2 blue=$path/radar/filtered_$2 to=$path/radar/filtered_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/radar/filtered_$2.tiff.tfw	
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
#rm $path/radar/preparedhi_$2
###################################################################################
echo "*** make list to combine vims and radar ***"
FILE="cubeit.lis"

/bin/cat <<EOM >$FILE

$path/radar/filtered_$2
$path/vims/maped_$1.band0001.cub
$path/vims/maped_$1.band0002.cub
$path/vims/maped_$1.band0003.cub
$path/vims/maped_$1.band0004.cub
$path/vims/ratio_1.57-1.27_$1
$path/vims/ratio_2.03-1.27_$1
$path/vims/ratio_1.27-1.08_$1

####









####
EOM
cubeit fromlist=cubeit.lis to=$path/vims_and_radar/VIMS_and_RADAR_$2
rm cubeit.lis

echo "*** export statistics ***"
avg=$(stats FROM=$path/radar/interpolated_$2 | grep Average | sed -e 's/^[^=]*=//g')
std=$(stats FROM=$path/radar/interpolated_$2 | grep StandardDeviation | sed -e 's/^[^=]*=//g')
cv=$(bc <<< " scale=14; $std / $avg ")
res1=$(catlab from=$path/radar/interpolated_$2 | grep PixelResolution | sed -e 's/^[^=]*=//g')
res2=$(catlab from=$path/radar/interpolated_$2 | grep Scale | sed -e 's/^[^=]*=//g')
FILE="stats_raw_$2.txt"
/bin/cat <<EOM >$FILE
cv = $cv
Average = $avg
Standard Deviation= $std
Pixel Resolution = $res1
Scale = $res2
EOM
mv $path/stats_raw_$2.txt $path/radar/stats_raw_$2.txt
avg=$(stats FROM=$path/radar/filtered_$2 | grep Average | sed -e 's/^[^=]*=//g')
std=$(stats FROM=$path/radar/filtered_$2 | grep StandardDeviation | sed -e 's/^[^=]*=//g')
cv=$(bc <<< " scale=14; $std / $avg ")
res1=$(catlab from=$path/radar/filtered_$2 | grep PixelResolution | sed -e 's/^[^=]*=//g')
res2=$(catlab from=$path/radar/filtered_$2 | grep Scale | sed -e 's/^[^=]*=//g')
FILE="stats_filtered_$2.txt"
/bin/cat <<EOM >$FILE
cv = $cv
Average = $avg
Standard Deviation= $std
Pixel Resolution = $res1
Scale = $res2
EOM
mv $path/stats_filtered_$2.txt $path/radar/stats_filtered_$2.txt
echo "*** make bandsequential cubes...***"
crop from = $path/radar/interpolated_$2 to= $path/radar/bsq_raw_$2+BandSequential
crop from = $path/radar/filtered_$2 to= $path/radar/bsq_filtered_$2+BandSequential
echo "*** export RGB VIMS and RADAR superpositions ***"
#band1=1.28
#band2=1.57
#band3=2.03
#band4=5.00
#band5=1.08
#with vims
isis2std red=$path/vims/maped_$1.band0003.cub green=$path/radar/filtered_$2 blue=$path/vims/maped_$1.band0002.cub to=$path/vims_and_radar/RnV_2.03-radar-1.57_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_2.03-radar-1.57_$2.tiff.tfw
isis2std red=$path/radar/filtered_$2 green=$path/vims/maped_$1.band0003.cub blue=$path/vims/maped_$1.band0002.cub to=$path/vims_and_radar/RnV_radar-2.03-1.28_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_radar-2.03-1.28_$2.tiff.tfw
#with ratio
isis2std red=$path/vims/ratio_1.57-1.27_$1 green=$path/radar/filtered_$2 blue=$path/vims/ratio_2.03-1.27_$1 to=$path/vims_and_radar/RnV_ratio1-radar-ratio2_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_ratio1-radar-ratio2_$2.tiff.tfw
isis2std red=$path/vims/ratio_1.27-1.08_$1 green=$path/radar/filtered_$2 blue=$path/vims/ratio_2.03-1.27_$1 to=$path/vims_and_radar/RnV_ratio3-radar-ratio2_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_ratio3-radar-ratio2_$2.tiff.tfw
#with 2.03
isis2std red=$path/vims/maped_$1.band0003.cub green=$path/radar/filtered_$2 blue=$path/radar/filtered_$2 to=$path/vims_and_radar/RnV_2.03-radar-radar_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_2.03-radar-radar_$2.tiff.tfw
#with single ratio
isis2std red=$path/vims/ratio_1.57-1.27_$1 green=$path/radar/filtered_$2 blue=$path/radar/filtered_$2 to=$path/vims_and_radar/RnV_ratio_1.57-1.27-radar-radar_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_ratio_1.57-1.27-radar-radar_$2.tiff.tfw
isis2std red=$path/vims/ratio_2.03-1.27_$1 green=$path/radar/filtered_$2 blue=$path/radar/filtered_$2 to=$path/vims_and_radar/RnV_ratio_2.03-1.27-radar-radar_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_ratio_2.03-1.27-radar-radar_$2.tiff.tfw
isis2std red=$path/vims/ratio_1.27-1.08_$1 green=$path/radar/filtered_$2 blue=$path/radar/filtered_$2 to=$path/vims_and_radar/RnV_ratio_1.27-1.08-radar-radar_$2.tiff format=tiff bittype=u16bit mode=rgb
rm $path/vims_and_radar/RnV_ratio_1.27-1.08-radar-radar_$2.tiff.tfw



rm print.prt
rm temp.txt
rm cubeit.lis
rm $path/vims/maped_$1
rm $path/vims/radararea_$1
rm $path/vims/croped_vims1_$1
rm $path/vims/largecam_vims_$1
rm $path/vims/$1.band0025.cub
rm $path/vims/$1.band0043.cub
rm $path/vims/$1.band0071.cub
rm $path/vims/$1.band0249.cub
rm $path/vims/$1.band0013.cub
rm $path/vims/selected_bands_$1
rm $path/vims/croped_vims_$1
rm $path/vims/newvims_$1.band0001.cub
rm $path/vims/newvims_$1.band0002.cub
rm $path/vims/newvims_$1.band0003.cub
rm $path/vims/newvims_$1.band0004.cub
rm $path/vims/newvims_$1.band0005.cub
rm $path/vims/radararea_$1.band0001.cub
rm $path/vims/radararea_$1.band0002.cub
rm $path/vims/radararea_$1.band0003.cub
rm $path/vims/radararea_$1.band0004.cub
rm $path/vims/radararea_$1.band0005.cub
rm $path/vims/maped_$1.band0001.cub
rm $path/vims/maped_$1.band0002.cub
rm $path/vims/maped_$1.band0003.cub
rm $path/vims/maped_$1.band0004.cub
rm $path/vims/maped_$1.band0005.cub
rm $path/vims/ratio_1.57-1.27_$1
rm $path/vims/ratio_2.03-1.27_$1
rm $path/vims/ratio_1.27-1.08_$1
rm $path/radar/filtered_$2
rm $path/radar/interpolated_$2
rm $path/radar/preparedhi_$2


clear
