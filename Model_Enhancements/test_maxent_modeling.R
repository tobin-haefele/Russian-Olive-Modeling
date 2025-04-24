#Load Libraries
library(raster)
library(dismo)
library(arcgisbinding)
library(sf)
library(terra)
library(sp)
library(maxnet)
library(dismo)

setwd("~/School/Russian-Olive-Modeling")
# Get all TIFFs with error handling
get_tif_files <- function(folder_path) {
  if (!dir.exists(folder_path)) {
    stop("Folder does not exist: ", folder_path)
  }
  
  tifs <- list.files(
    path = folder_path,
    pattern = "\\.tif$",  # $ ensures it matches end of filename
    full.names = TRUE,    # Get complete paths
    recursive = TRUE,    # Set TRUE for subfolder search
    ignore.case = TRUE    # Finds .tif/.TIF
  )
  
  if (length(tifs) == 0) {
    warning("No .tif files found in: ", folder_path)
  }
  
  return(tifs)
}

p <- as.numeric(survey_sf$PA)

tif_list <- get_tif_files("data/")
print(tif_list)

# Load all TIFFs into a list
raster_list <- lapply(tif_list, rast)
names(raster_list) <- basename(tif_list)

#stack the first 7 rasters
r_list <- raster_list[0:3]

# For terra raster objects
lapply(seq_along(r_list), function(i) {
  cat("\nRaster", i, "-", names(r_list[[i]]), ":\n")
  print(ext(r_list[[i]]))  # `ext()` is terra's version of `extent()`
})


# Step 1: Get the extent and CRS you want to standardize to (e.g., from msl_shape)
target_extent <- extent(msl_shape)
target_crs <- st_crs(msl_shape)$proj4string

# Step 2: Reproject all rasters to same CRS and crop/mask to extent
raster_list <- lapply(raster_list, function(r) {
  r <- mask(r, msl_shape)
  r <- crop(r, target_extent)
  return(r)
})

# Step 3: Align resolutions (optional but helps with precision)
# Use the first raster as the template for alignment
template_raster <- raster_list[[1]]

raster_list <- lapply(raster_list, function(r) {
  resample(r, template_raster, method = "bilinear")
})

# Step 4: Now stack
raster_stack <- stack(raster_list)