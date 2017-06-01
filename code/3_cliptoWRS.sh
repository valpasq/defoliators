#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N clip_to_polygons
#$ -j y

# Clip raster with GDAL using polygons
# Adapted from: http://linfiniti.com/2009/09/clipping-rasters-with-gdal-using-polygons/

# p012r031
SHPFILE1='../paper_data/p012r031_inputs/WRS2_p012r031_mod.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE1 .shp`
EXTENT=`ogrinfo -so $SHPFILE1 $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE1"

r_file=$(find ../paper_data/int_products/ 'p012r031*standardized*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE1 \
	../paper_data/int_products/`basename $RASTERFILE .tif`.tif \
	../paper_data/int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

# p013r031
SHPFILE2='../paper_data/p013r031_inputs/WRS2_p013r031_mod.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE2 .shp`
EXTENT=`ogrinfo -so $SHPFILE2 $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE2"

r_file=$(find ../paper_data/int_products/ -name 'p013r031*standardized*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE2 \
	../paper_data/int_products/`basename $RASTERFILE .tif`.tif \
	../paper_data/int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

echo "Done!"
