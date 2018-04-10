#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N clip_to_polygons
#$ -j y

# Clip raster with GDAL using polygons
# Adapted from: http://linfiniti.com/2009/09/clipping-rasters-with-gdal-using-polygons/

#clean old clips
rm ./int_products/*WRS*

#### p011r031
SHPFILE='/projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/WRS2_bound/p011r031_WRS2_UTM19N_buffer.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE .shp`
EXTENT=`ogrinfo -so $SHPFILE $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE"

r_file=$(find ./int_products/ -name 'p011r031*norm*.tif' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

#### p012r030
SHPFILE='/projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/WRS2_bound/p012r030_WRS2_UTM19N_buffer.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE .shp`
EXTENT=`ogrinfo -so $SHPFILE $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE"

r_file=$(find ./int_products/ -name 'p012r030*norm*.tif' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

### p012r031
SHPFILE='/projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/WRS2_bound/p012r031_WRS2_UTM19N_buffer.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE .shp`
EXTENT=`ogrinfo -so $SHPFILE $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE"

r_file=$(find ./int_products/ -name 'p012r031*norm*.tif' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

### p013r030
SHPFILE='/projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/WRS2_bound/p013r030_WRS2_UTM18N_buffer.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE .shp`
EXTENT=`ogrinfo -so $SHPFILE $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE"

r_file=$(find ./int_products/ -name 'p013r030*norm*.tif' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

#### p013r031
SHPFILE='/projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/WRS2_bound/p013r031_WRS2_UTM18N_buffer.shp'

# Calculate extent of shapefile (bounding box)
BASE=`basename $SHPFILE .shp`
EXTENT=`ogrinfo -so $SHPFILE $BASE | grep Extent \
| sed 's/Extent: //g' | sed 's/(//g' | sed 's/)//g' \
| sed 's/ - /, /g'`
EXTENT=`echo $EXTENT | awk -F ',' '{print $1 " " $4 " " $3 " " $2}'`

echo "Shapefile: $SHPFILE"

r_file=$(find ./int_products/ -name 'p013r031*norm*.tif' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# Clip to polygon boundaries
	gdalwarp -co COMPRESS=DEFLATE -co TILED=YES -of GTiff \
	-r near -srcnodata -9999 -dstnodata -9999 \
	-cutline $SHPFILE \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_WRSclip.tif
done

echo "Done!"
