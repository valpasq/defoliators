#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N stack_dates
#$ -j y

echo "Stacking 2016 - 0414 run - with NLCD"
gdal_merge.py -separate -tap -ps 30 30 -ot float32 \
-o ./paper_data/final_products/2016_0414_meanresiduals_withmask.tif \
/projectnb/landsat/projects/Massachusetts/Moths/paper_data/final_products/2016_0414_meanresiduals.tif \
/projectnb/landsat/projects/Massachusetts/GIS_data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10_NEclip_FOREST.tif

echo "Stacking 2015 - 0414 run - with NLCD"
gdal_merge.py -separate -tap -ps 30 30 -ot float32 \
-o ./paper_data/final_products/2015_0414_meanresiduals_withmask.tif \
/projectnb/landsat/projects/Massachusetts/Moths/paper_data/final_products/2015_0414_meanresiduals.tif \
/projectnb/landsat/projects/Massachusetts/GIS_data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10_NEclip_FOREST.tif

echo "Stacking 2016 - 0515 run - with NLCD"
gdal_merge.py -separate -tap -ps 30 30 -ot float32 \
-o ./paper_data/final_products/2016_0515_meanresiduals_withmask.tif \
/projectnb/landsat/projects/Massachusetts/Moths/paper_data/final_products/2016_0515_meanresiduals.tif \
/projectnb/landsat/projects/Massachusetts/GIS_data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10_NEclip_FOREST.tif

echo "Stacking 2015 - 0515 run - with NLCD"
gdal_merge.py -separate -tap -ps 30 30 -ot float32 \
-o ./paper_data/final_products/2015_0515_meanresiduals_withmask.tif \
/projectnb/landsat/projects/Massachusetts/Moths/paper_data/final_products/2015_0515_meanresiduals.tif \
/projectnb/landsat/projects/Massachusetts/GIS_data/nlcd_2011_landcover_2011_edition_2014_10_10/nlcd_2011_landcover_2011_edition_2014_10_10_NEclip_FOREST.tif
