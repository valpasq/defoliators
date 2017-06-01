#!/bin/bash
#$ -l h_rt=24:00:00
#$ -V
#$ -N map_prediction
#$ -j y

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Date to predict image for
predictdate=$2

# Specify YATSM results directory
run=$3

# Specify results prefix to use
prefix="ols"

# GMap predictions
yatsm -v map --date "%Y-%j" --result ./YATSM_${run}/ --before --qa --refit_prefix $prefix \
	predict $predictdate ${run}_prediction_${predictdate}_qa.tif
