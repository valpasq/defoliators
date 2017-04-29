#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N stack_dates
#$ -j y

if [ -z "$1" ]; then
    echo "Error - please specify a directory with GM products. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

echo "Stacking 2016 - 0414 run"
gdalbuildvrt -separate \
./2016_stack_0414_diff_G_standardized.vrt \
./p013r031_2016-170_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-171_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-178_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-179_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-186_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-194_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-195_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-202_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-203_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-218_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-227_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-235_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-242_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2016-243_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-258_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2016-266_diff_G_standardized_0414_WRSclip_albers.tif

echo "Stacking 2015 - 0414 run"
gdalbuildvrt -separate \
./2015_stack_0414_diff_G_standardized.vrt \
./p012r031_2015-176_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2015-183_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-184_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2015-191_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-192_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-200_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2015-215_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-216_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-224_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-232_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-240_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2015-247_diff_G_standardized_0414_WRSclip_albers.tif \
./p012r031_2015-248_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2015-255_diff_G_standardized_0414_WRSclip_albers.tif \
./p013r031_2015-263_diff_G_standardized_0414_WRSclip_albers.tif 


echo "Stacking 2016 - 0515 run"
gdalbuildvrt -separate \
./2016_stack_0515_diff_G_standardized.vrt \
./p013r031_2016-170_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-171_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-178_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-179_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-186_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-194_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-195_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-202_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-203_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-218_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-227_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-235_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-242_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2016-243_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-258_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2016-266_diff_G_standardized_WRSclip_albers.tif

echo "Stacking 2015 - 0515 run"
gdalbuildvrt -separate \
./2015_stack_0515_diff_G_standardized.vrt \
./p012r031_2015-176_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2015-183_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-184_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2015-191_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-192_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-200_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2015-215_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-216_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-224_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-232_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-240_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2015-247_diff_G_standardized_WRSclip_albers.tif \
./p012r031_2015-248_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2015-255_diff_G_standardized_WRSclip_albers.tif \
./p013r031_2015-263_diff_G_standardized_WRSclip_albers.tif 