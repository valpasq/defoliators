#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N stack_dates
#$ -j y


echo "Stacking 2017"
gdalbuildvrt -separate \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/final_products/2017_stack_diffG_standardized.vrt \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p013r031_2017-164_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p012r031_2017-165_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p013r031_2017-172_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p012r031_2017-173_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p013r031_2017-180_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p012r031_2017-181_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p012r031_2017-189_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p013r031_2017-196_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p012r031_2017-197_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p013r031_2017-204_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p013r031_2017-212_diff_G_standardized_0515_WRSclip_albers.tif \
/projectnb/landsat/projects/Massachusetts/defoliators/2017_analysis/int_products/p012r031_2017-213_diff_G_standardized_0515_WRSclip_albers.tif \

