#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Second input is output file name, e.g. output=./p011r031_clear_80.txt
output=$2

echo "WRS2,sensor,date,img_obs_fn,img_pred_fn,rmse_G" > $output
for mtl in $(find ./ -name '*MTL.txt'); do
    id=$(basename $(dirname $mtl)) 

    l1t=$(grep "LANDSAT_8" $mtl)
     
    if [ "$l1t" == "" ]; then
        echo "$id is TM/ETM+"
		path=$(grep -a -e "WRS_PATH" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }' | tr -d ' ' )
	    row=$(grep -a -e "WRS_ROW" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }' | tr -d ' ' )
        WRS="p${path}r${row}" 

	# Landsat 8 (OLI)
    else
        echo "$id is OLI"
        path=$(grep -a -e "TARGET_WRS_PATH" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }' | tr -d ' ' )
	    row=$(grep -a -e "TARGET_WRS_ROW" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }' | tr -d ' ' )
        WRS="p0${path}r0${row}"
    fi 
    echo $WRS
    
    sensor=$(grep -a -e "SENSOR_ID" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }' | tr -d ' ' )
    date=$(grep -a -e "DATE_ACQUIRED" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }')
    
    img=./${id}/${id}_all
    pred=./$id/${id}_prediction.tif
    rmse=../../RMSE/YATSM_moths_reanalysis_${WRS}_TCG_2005-07-01.tif
    
    echo "$WRS,$sensor,$date,$img,$pred,$rmse" >> $output
done     
