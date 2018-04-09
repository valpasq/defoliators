#!/bin/bash
#$ -l h_rt=24:00:00
#$ -V
#$ -N RMSE
#$ -j y

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Date to extract coefficients for (e.g.2010-07-01)
date=$2

# Specify YATSM results directory name
run=$3

WRS=$4

# Band 9 - TCG
yatsm -v map --band 9 \
	--result ./YATSM_${run} \
	--ndv -9999 --before --after --qa --refit_prefix "ols" --amplitude coef $date \
	./YATSM_${run}_${WRS}_TCG_${date}.tif
