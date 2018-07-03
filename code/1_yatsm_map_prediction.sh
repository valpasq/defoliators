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

# List of scenes
WRS2=['011031','012030','012031','013030','013031']
for scene in WRS2; do
    for mtl in $(find ./ -name L*${WRS2}*MTL.txt); do

        # Get file names and date for prediction
        id=$(basename $(dirname $mtl))
        pred=$(grep "DATE_ACQUIRED" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }')
        echo 'Working on...'
        echo $id $pred

        # Get path and row
        path=$(grep "WRS_PATH" $mtl | head -1 | tr -d ' ' | awk -F '=' '{ print $2 }' )
        row=$(grep "WRS_ROW" $mtl | head -1 | tr -d ' ' | awk -F '=' '{ print $2 }')  

        # Check if L8 and adjust file name convention accordingly
        l1t=$(grep "LANDSAT_8" $mtl)    
        if [ "$l1t" == "" ]; then
            #echo "$id is TM/ETM+"
            WRS="p${path}r${row}" 
        else
            WRS="p0${path}r0${row}"
        fi     
             
        # Map predictions
        yatsm -v map --result /projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/modeling/${WRS}/YATSM_${run}/ \
        --image /projectnb/landsat/projects/Massachusetts/defoliators/reanalysis/modeling/${WRS}/example_img \
        --before --refit_prefix $prefix predict $pred ./${id}/${id}_prediction.tif

    done
done
