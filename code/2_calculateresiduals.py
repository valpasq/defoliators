import numpy as np
import rasterio
from osgeo import gdal, gdal_array
import pandas as pd

# Read in CSV with dataset locations
img_list = pd.read_csv('../config/moths_datasets_2016.csv')

for img_id in img_list.index:

	date = img_list['date'][img_id]
	WRS2 = img_list['WRS2'][img_id]

	print('Processing {WRS2}: {date}'.format(WRS2=WRS2, date=date))

	# Read in observed image
	img_obs_fn = img_list['img_obs_fn'][img_id]

	with rasterio.open(img_obs_fn) as image:
	    obs_ds = image.read()
	    obs_G = obs_ds[8] # Greenness
	    obs_mask = obs_ds[10] # Fmask result

	# Read in predicted image
	img_pred_fn = img_list['img_pred_fn'][img_id]

	with rasterio.open(img_pred_fn) as image:
	    pred_ds = image.read()
	    pred_G = pred_ds[8] # Predicted Greenness

	# Read in RMSE
	rmse_G_fn = img_list['rmse_G'][img_id]

	with rasterio.open(rmse_G_fn) as image:
	    rmse_G_ds = image.read()
	    rmse_G = rmse_G_ds[4] # RMSE

	# Difference: observed - predicted
	diff_G = (obs_G - pred_G) # subtract

	# Stadardize: use CCDC model RMSE
	diff_G_stand = (obs_G - pred_G) / rmse_G # divide by RMSE

	# Mask clouds, shadows, snow, nodata
	diff_G[obs_mask > 0] = -9999
	diff_G[diff_G < -9999] = -9999

	diff_G_stand[obs_mask > 0] = -9999
	diff_G_stand[diff_G < -9999] = -9999

	# Write out raw residuals: Greenness
	in_ds = gdal.Open(img_obs_fn, gdal.GA_ReadOnly)
	output_fn = '../paper_data/int_products/{WRS2}_{date}_diff_G_raw_0515.tif'.format(date=date, WRS2=WRS2)

	out_driver = gdal.GetDriverByName("GTiff")
	out_ds = out_driver.Create(output_fn, 
	                           diff_G.shape[1],  # x size
	                           diff_G.shape[0],  # y size
	                           1,  # number of bands
	                           gdal.GDT_Int16)
	out_ds.SetProjection(in_ds.GetProjection())
	out_ds.SetGeoTransform(in_ds.GetGeoTransform())
	out_ds.GetRasterBand(1).WriteArray(diff_G)
	out_ds.GetRasterBand(1).SetNoDataValue(-9999)
	#out_ds.GetRasterBand(1).SetColorTable(ct)
	out_ds.GetRasterBand(1).SetDescription('Raw residuals: TCG')
	out_ds = None

	# Write out standardized residuals: Greenness
	in_ds = gdal.Open(img_obs_fn, gdal.GA_ReadOnly)
	output_fn = '../paper_data/int_products/{WRS2}_{date}_diff_G_standardized_0515.tif'.format(date=date, WRS2=WRS2)

	out_driver = gdal.GetDriverByName("GTiff")
	out_ds = out_driver.Create(output_fn, 
	                           diff_G.shape[1],  # x size
	                           diff_G.shape[0],  # y size
	                           1,  # number of bands
	                           gdal.GDT_Float32)
	out_ds.SetProjection(in_ds.GetProjection())
	out_ds.SetGeoTransform(in_ds.GetGeoTransform())
	out_ds.GetRasterBand(1).WriteArray(diff_G_stand)
	out_ds.GetRasterBand(1).SetNoDataValue(-9999)
	#out_ds.GetRasterBand(1).SetColorTable(ct)
	out_ds.GetRasterBand(1).SetDescription('Standardized residuals: TCG')
	out_ds = None
