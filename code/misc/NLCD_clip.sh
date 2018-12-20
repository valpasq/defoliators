#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N ancillary
#$ -j y

OUTPUT=$2

EXTENT=$(gdalinfo $1 |\
        grep "Upper Left\|Lower Right" |\
        sed "s/Upper Left  //g;s/Lower Right //g;s/).*//g" |\
        tr "\n" " " |\
        sed 's/ *$//g' |\
        tr -d "[(,]")
echo -n "$EXTENT"

warp_ext=$(echo $EXTENT | awk '{ print $1 " " $4 " " $3 " " $2 }')
echo "gdalwarp extent:"
echo $warp_ext

echo "clipping NLCD..."
gdalwarp -tr 30 30 -r near -tap \
	-te_srs EPSG:5070 -te $warp_ext \
	-dstnodata 0 -overwrite \
	/projectnb/landsat/projects/Massachusetts/GIS_data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10.img \
	$OUTPUT
