#!/bin/sh

# This script initializes from scratch a VIMS file and creates
# a file with only the needed bands
# NOTE: The default bands are 25, 44, 71. Need to modify this for 
# different bands

#image input
vims_input=$1



clear
echo "####################################################################" 
echo "# 		*** Vims Image Processing ***			 "
echo "#                                   				 "
echo "#								 "
echo "#	Operations:						 "
echo "#								 "
echo "#		* vims2isis					 "
echo "# 		* spiceinit					 "
echo "# 		* explode bands					 "
echo "# 		* create multicube with 1.28 and 2.00 bands					 "
echo "# 		* 						 "
echo "####################################################################" 



clear
echo "*** Converting Vims images to Isis 3 format (qub to cub) ***"
vims2isis from=$1 vis=$1.vis.cub ir=ir_$1

rm $1.vis.cub


echo "*** Add the appropriate SPICE information to the ISIS image cube ***"
echo "*** SPICE for Infrared camera ***"
spiceinit from=ir_$1 web=yes


echo "*** explode VIMS cube ***"
explode from=ir_$1 to=$1

rm ir_$1

#remove not wanted bands

rm $1.band0001.cub
rm $1.band0002.cub
rm $1.band0003.cub
rm $1.band0004.cub
rm $1.band0005.cub
rm $1.band0006.cub
rm $1.band0007.cub
rm $1.band0008.cub
rm $1.band0009.cub
rm $1.band0010.cub
rm $1.band0011.cub
rm $1.band0012.cub
rm $1.band0013.cub
rm $1.band0014.cub
rm $1.band0015.cub
rm $1.band0016.cub
rm $1.band0017.cub
rm $1.band0018.cub
rm $1.band0019.cub
rm $1.band0020.cub
rm $1.band0021.cub
rm $1.band0022.cub
rm $1.band0023.cub
rm $1.band0024.cub
rm $1.band0026.cub
rm $1.band0027.cub
rm $1.band0028.cub
rm $1.band0029.cub
rm $1.band0030.cub
rm $1.band0031.cub
rm $1.band0032.cub
rm $1.band0033.cub
rm $1.band0034.cub
rm $1.band0035.cub
rm $1.band0036.cub
rm $1.band0037.cub
rm $1.band0038.cub
rm $1.band0039.cub
rm $1.band0040.cub
rm $1.band0041.cub
rm $1.band0042.cub
rm $1.band0043.cub
#rm $1.band0044.cub
rm $1.band0045.cub
rm $1.band0046.cub
rm $1.band0047.cub
rm $1.band0048.cub
rm $1.band0049.cub
rm $1.band0050.cub
rm $1.band0051.cub
rm $1.band0052.cub
rm $1.band0053.cub
rm $1.band0054.cub
rm $1.band0055.cub
rm $1.band0056.cub
rm $1.band0057.cub
rm $1.band0058.cub
rm $1.band0059.cub
rm $1.band0060.cub
rm $1.band0061.cub
rm $1.band0062.cub
rm $1.band0063.cub
rm $1.band0064.cub
rm $1.band0065.cub
rm $1.band0066.cub
rm $1.band0067.cub
rm $1.band0068.cub
rm $1.band0069.cub
rm $1.band0070.cub
#rm $1.band0071.cub
rm $1.band0072.cub
rm $1.band0073.cub
rm $1.band0074.cub
rm $1.band0075.cub
rm $1.band0076.cub
rm $1.band0077.cub
rm $1.band0078.cub
rm $1.band0079.cub
rm $1.band0080.cub
rm $1.band0081.cub
rm $1.band0082.cub
rm $1.band0083.cub
rm $1.band0084.cub
rm $1.band0085.cub
rm $1.band0086.cub
rm $1.band0087.cub
rm $1.band0088.cub
rm $1.band0089.cub
rm $1.band0090.cub
rm $1.band0091.cub
rm $1.band0092.cub
rm $1.band0093.cub
rm $1.band0094.cub
rm $1.band0095.cub
rm $1.band0096.cub
rm $1.band0097.cub
rm $1.band0098.cub
rm $1.band0099.cub
rm $1.band0100.cub
rm $1.band0101.cub
rm $1.band0102.cub
rm $1.band0103.cub
rm $1.band0104.cub
rm $1.band0105.cub
rm $1.band0106.cub
rm $1.band0107.cub
rm $1.band0108.cub
rm $1.band0109.cub
rm $1.band0110.cub
rm $1.band0111.cub
rm $1.band0112.cub
rm $1.band0113.cub
rm $1.band0114.cub
rm $1.band0115.cub
rm $1.band0116.cub
rm $1.band0117.cub
rm $1.band0118.cub
rm $1.band0119.cub
rm $1.band0120.cub
rm $1.band0121.cub
rm $1.band0122.cub
rm $1.band0123.cub
rm $1.band0124.cub
rm $1.band0125.cub
rm $1.band0126.cub
rm $1.band0127.cub
rm $1.band0128.cub
rm $1.band0129.cub
rm $1.band0130.cub
rm $1.band0131.cub
rm $1.band0132.cub
rm $1.band0133.cub
rm $1.band0134.cub
rm $1.band0135.cub
rm $1.band0136.cub
rm $1.band0137.cub
rm $1.band0138.cub
rm $1.band0139.cub
rm $1.band0140.cub
rm $1.band0141.cub
rm $1.band0142.cub
rm $1.band0143.cub
rm $1.band0144.cub
rm $1.band0145.cub
rm $1.band0146.cub
rm $1.band0147.cub
rm $1.band0148.cub
rm $1.band0149.cub
rm $1.band0150.cub
rm $1.band0151.cub
rm $1.band0152.cub
rm $1.band0153.cub
rm $1.band0154.cub
rm $1.band0155.cub
rm $1.band0156.cub
rm $1.band0157.cub
rm $1.band0158.cub
rm $1.band0159.cub
rm $1.band0160.cub
rm $1.band0161.cub
rm $1.band0162.cub
rm $1.band0163.cub
rm $1.band0164.cub
rm $1.band0165.cub
rm $1.band0166.cub
rm $1.band0167.cub
rm $1.band0168.cub
rm $1.band0169.cub
rm $1.band0170.cub
rm $1.band0171.cub
rm $1.band0172.cub
rm $1.band0173.cub
rm $1.band0174.cub
rm $1.band0175.cub
rm $1.band0176.cub
rm $1.band0177.cub
rm $1.band0178.cub
rm $1.band0179.cub
rm $1.band0180.cub
rm $1.band0181.cub
rm $1.band0182.cub
rm $1.band0183.cub
rm $1.band0184.cub
rm $1.band0185.cub
rm $1.band0186.cub
rm $1.band0187.cub
rm $1.band0188.cub
rm $1.band0189.cub
rm $1.band0190.cub
rm $1.band0191.cub
rm $1.band0192.cub
rm $1.band0193.cub
rm $1.band0194.cub
rm $1.band0195.cub
rm $1.band0196.cub
rm $1.band0197.cub
rm $1.band0198.cub
rm $1.band0199.cub
rm $1.band0200.cub
rm $1.band0201.cub
rm $1.band0202.cub
rm $1.band0203.cub
rm $1.band0204.cub
rm $1.band0205.cub
rm $1.band0206.cub
rm $1.band0207.cub
rm $1.band0208.cub
rm $1.band0209.cub
rm $1.band0210.cub
rm $1.band0211.cub
rm $1.band0212.cub
rm $1.band0213.cub
rm $1.band0214.cub
rm $1.band0215.cub
rm $1.band0216.cub
rm $1.band0217.cub
rm $1.band0218.cub
rm $1.band0219.cub
rm $1.band0220.cub
rm $1.band0221.cub
rm $1.band0222.cub
rm $1.band0223.cub
rm $1.band0224.cub
rm $1.band0225.cub
rm $1.band0226.cub
rm $1.band0227.cub
rm $1.band0228.cub
rm $1.band0229.cub
rm $1.band0230.cub
rm $1.band0231.cub
rm $1.band0232.cub
rm $1.band0233.cub
rm $1.band0234.cub
rm $1.band0235.cub
rm $1.band0236.cub
rm $1.band0237.cub
rm $1.band0238.cub
rm $1.band0239.cub
rm $1.band0240.cub
rm $1.band0241.cub
rm $1.band0242.cub
rm $1.band0243.cub
rm $1.band0244.cub
rm $1.band0245.cub
rm $1.band0246.cub
rm $1.band0247.cub
rm $1.band0248.cub
rm $1.band0249.cub
rm $1.band0250.cub
rm $1.band0251.cub
rm $1.band0252.cub
rm $1.band0253.cub
rm $1.band0254.cub
rm $1.band0255.cub
rm $1.band0256.cub

#make new vim cube (only selected bands)

echo "*** make new VIMS cube (only selected bands) ***"

# Need to modify the following bands and the corresponding of the
# above list to get the wanted ones

FILE="cubeit.lis"

/bin/cat <<EOM >$FILE

$1.band0025.cub
$1.band0044.cub
$1.band0071.cub

EOM

cubeit fromlist=cubeit.lis to=s_band_$1

rm cubeit.lis

rm $1.band0025.cub

rm $1.band0071.cub

rm $1.band0044.cub



rm print.prt

clear
