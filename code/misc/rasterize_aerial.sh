#!/bin/bash

# crop to extent of first input file
ext=$(gdalinfo $1 |\
        grep "Upper Left\|Lower Right" |\
        sed "s/Upper Left  //g;s/Lower Right //g;s/).*//g" |\
        tr "\n" " " |\
        sed 's/ *$//g' |\
        tr -d "[(,]")
echo -n "$ext"

warp_ext=$(echo $ext | awk '{ print $1 " " $4 " " $3 " " $2 }')
echo "gdalwarp extent:"
echo $warp_ext

echo gdal_rasterize -te $warp_ext -tr 30 -30 \
    -a PERCENT_AF -l DFO_GypsyMothData_2017_albers_studyarea \
    -a_nodata 0 -init 0 -ot Int32 \
    -co "COMPRESS=LZW" -a_srs EPSG:5070 \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FS_2016aerial/DFO_GypsyMothData_2017_albers_studyarea.shp \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FS_2016aerial/DFO_GypsyMothData_2017_albers_studyarea_rast.tif

gdal_rasterize -te $warp_ext -tr 30 -30 \
    -a STATEFP -l study_area \
    -a_nodata 0 -init 0 -ot Int32 \
    -co "COMPRESS=LZW" -a_srs EPSG:5070 \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/states/study_area.shp \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/states/study_area_rast.tif

echo gdalwarp -tr 30 30 -r near -tap \
    -te_srs EPSG:5070 -te $warp_ext \
    -dstnodata 0 -overwrite \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FHTE_ref/RI2_2015_aYs_2015_2016_jDs_140_200_NDVI_hybrid_ZScore_sieve2.tif \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FHTE_ref/FHTE_ZScore_sieve2_raster.tif

echo gdalwarp -tr 30 30 -r near -tap \
    -te_srs EPSG:5070 -te $warp_ext \
    -dstnodata 0 -overwrite \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FHTE_ref/RI2_2015_aYs_2015_2016_jDs_140_200_NDVI_hybrid_ZScore_sieve1.tif \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FHTE_ref/FHTE_ZScore_sieve1_raster.tif

echo gdalwarp -tr 30 30 -r near -tap \
    -te_srs EPSG:5070 -te $warp_ext \
    -dstnodata 0 -overwrite \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FHTE_ref/RI2_2015_aYs_2015_2016_jDs_140_200_NDVI_hybrid_ZScore.tif \
    /projectnb/landsat/projects/Massachusetts/Moths/GIS_data/FHTE_ref/FHTE_ZScore_raster.tif