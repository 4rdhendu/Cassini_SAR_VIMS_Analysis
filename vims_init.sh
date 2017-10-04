#!/bin/sh

# This script initializes a VIMS file form scratch, 
# applies Radiometric Calibration 
# and vizualizes the file in qView

#VIMS input
img_input=$1


clear
echo "####################################################################" 
echo "# 		*** Vims Image Processing ***			 "
echo "#                                   				 "
echo "#								 "
echo "#	Operations:						 "
echo "#								 "
echo "#		* vims2isis					 "
echo "# 		* spiceinit					 "
echo "# 		* vimscal					 "
echo "# 		* cam2map					 "
echo "# 		* qView						 "
echo "####################################################################" 

read -p "Press [Enter] key to start Image Processing..."


#vims2isis -> converting qub to cub (ISIS format) file
clear
echo "*** Converting Vims images to Isis 3 format (qub to cub) ***"
vims2isis from=$1 vis=$1.vis.cub ir=$1.ir.cub

#spiceinit -> add the appropriate SPICE information to the ISIS image cube (via internet)
clear
echo "*** Add the appropriate SPICE information to the ISIS image cube ***"
echo "*** SPICE for Visual camera ***"
spiceinit from=$1.vis.cub web=yes
clear
echo "*** Add the appropriate SPICE information to the ISIS image cube ***"
echo "*** SPICE for Infrared camera ***"
spiceinit from=$1.ir.cub web=yes

#vimscal -> Radiometric Calibration (level_0 to level_1)
clear
echo "*** Radiometric Calibration for: Visual camera ***"
echo "*** level 0 to level 1 ***"
vimscal from=$1.vis.cub to=$1.cal.vis.cub
clear
echo "*** Radiometric Calibration for: Infrared camera ***"
echo "*** level 0 to level 1 ***"
vimscal from=$1.ir.cub to=$1.cal.ir.cub

#cam2map -> converting a raw instrument/camera cube to a map projected image (level_1 to level_2)
# use default sinusoidal map
clear
echo "*** Converting a raw instrument/camera cube to a (sinusoidal) map projected image ***"
echo "*** level 1 to level 2 ***"
echo "*** Visual ***"
cam2map from=$1.cal.vis.cub to=$1.final.vis.cub
clear
echo "*** Converting a raw instrument/camera cube to a (sinusoidal) map projected image ***"
echo "*** level 1 to level 2 ***"
echo "*** Infrared ***"
cam2map from=$1.cal.ir.cub to=$1.final.ir.cub

#else: to change map
#cam2map from=$1.cal.vis.cub map=my_map_name_and_path.map to=$1.final.vis.cub
#cam2map from=1.cal.ir.cub map=my_map_name_and_path.map to=$1.final.ir.cub

#else: to make mosaic
#cam2map from=$1.cal.vis.cub map=my_map_name_and_path.map to=$1.final.vis.cub pixres=map
#cam2map from=1.cal.ir.cub map=my_map_name_and_path.map to=$1.final.ir.cub pixres=map

clear
echo "*** qView results ***"
qview $1.cal.vis.cub $1.cal.ir.cub $1.final.vis.cub $1.final.ir.cub

clear

rm print.prt