#!/bin/bash

# p012r031
SHPFILE1='/projectnb/landsat/projects/Massachusetts/defoliators/quabbin/QuabbinBoundaries/QRL_Boundary_albers.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE1 .shp`
EXTENT=`ogrinfo -so $SHPFILE1 $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

warp_ext=$(echo $EXTENT | awk '{ print $1 " " $4 " " $3 " " $2 }')
echo "gdalwarp extent:"
echo $warp_ext

echo "Shapefile: $SHPFILE1"

r_file=$(find ../2017_analysis/final_products/ -name '2017*meanresiduals*.tif' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-te $warp_ext -tap -tr 30 30 \
	../2017_analysis/final_products/`basename $RASTERFILE .tif`.tif \
	../quabbin/`basename $RASTERFILE .tif`_quabbinclip.tif
done