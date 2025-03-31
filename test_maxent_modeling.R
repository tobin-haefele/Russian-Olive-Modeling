#Load Libraries
library(raster)
library(dismo)
library(arcgisbinding)
library(sf)
library(raster)
library(sp)
library(maxnet)

data("bradypus")

setwd("~/School/Russian-Olive-Modeling")
#load data from geodatabase and mask it to the missoula county shapefile


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
raster_list <- lapply(tif_list, raster)
names(raster_list) <- basename(tif_list)

r1 <- raster_list[[7]]
cr <- projection(r1)

data <- data %>%
  mutate(across(where(is.integer), as.numeric))

MSWD <- maxent(p = p, data = st_drop_geometry(data))
