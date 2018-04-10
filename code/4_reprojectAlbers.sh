#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N to_Albers
#$ -j y

r_file=$(find ./int_products/ -name 'p011r031*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# projec to Albers
	gdalwarp -overwrite -s_srs EPSG:32619 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_albers.tif

done

r_file=$(find ./int_products/ -name 'p012r030*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# projec to Albers
	gdalwarp -overwrite -s_srs EPSG:32619 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_albers.tif

done

r_file=$(find ./int_products/ -name 'p012r031*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# projec to Albers
	gdalwarp -overwrite -s_srs EPSG:32619 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_albers.tif

done

r_file=$(find ./int_products/ -name 'p013r030*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# project to Albers
	gdalwarp -overwrite -s_srs EPSG:32618 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_albers.tif

done

r_file=$(find ./int_products/ -name 'p013r031*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# project to Albers
	gdalwarp -overwrite -s_srs EPSG:32618 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./int_products/`basename $RASTERFILE .tif`.tif \
	./int_products/`basename $RASTERFILE .tif`_albers.tif

done

echo "Done!"
