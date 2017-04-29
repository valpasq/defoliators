#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N to_Albers
#$ -j y

r_file=$(find . -name 'p012r031*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# projec to Albers
	gdalwarp -overwrite -s_srs EPSG:32619 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./`basename $RASTERFILE .tif`.tif \
	./`basename $RASTERFILE .tif`_albers.tif

done

r_file=$(find . -name 'p013r031*WRSclip*' -type f)

for RASTERFILE in $r_file
do
   echo "Running on file:"
   echo $RASTERFILE

	# project to Albers
	gdalwarp -overwrite -s_srs EPSG:32618 -t_srs EPSG:5070 -r near -of GTiff \
	-srcnodata -9999 -dstnodata -9999 -tr 30 30 -tap \
	./`basename $RASTERFILE .tif`.tif \
	./`basename $RASTERFILE .tif`_albers.tif

done

echo "Done!"
