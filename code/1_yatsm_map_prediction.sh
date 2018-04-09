#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N predict
#$ -j y

#module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1
cd $here

# Specify YATSM results directory
run=$2

# Specify results prefix to use
prefix="ols"

# Group images to stack by sensor
n_mtl=$(find ./ -name 'L*MTL.txt' | wc -l)
if [ $n_mtl -eq 0 ]; then
    echo "Error - cannot find any MTL files"
    exit 1
fi

for mtl in $(find ./ -name 'L*MTL.txt'); do
	echo $mtl
    id=$(basename $(dirname $mtl))
    echo $id
    pred=$(grep "DATE_ACQUIRED" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }')
    echo $pred

    # Map predictions
    yatsm -v map --result ./YATSM_${run}/ --before --refit_prefix $prefix predict $pred ./${id}/${id}_prediction.tif

done
