library(arcgisbinding)
library(sf)

#create function for import
import_arcgis_data <- function(user_path, layer_name, method = "arcgisbinding") {
  # Validate method choice
  if (!method %in% c("arcgisbinding", "sf")) {
    stop("Method must be either 'arcgisbinding' or 'sf'")
  }
  
  # Check if required packages are installed
  if (method == "arcgisbinding" && !requireNamespace("arcgisbinding", quietly = TRUE)) {
    stop("arcgisbinding package required but not installed")
  }
  if (method == "sf" && !requireNamespace("sf", quietly = TRUE)) {
    stop("sf package required but not installed")
  }
  
  # Standardize path
  path <- normalizePath(user_path, mustWork = FALSE)
  
  # Method 1: Using arcgisbinding
  if (method == "arcgisbinding") {
    tryCatch({
      # Initialize arcgisbinding
      arcgisbinding::arc.check_product()
      
      # Open the geodatabase
      gdb <- arcgisbinding::arc.open(path)
      
      # Import the layer
      data <- arcgisbinding::arc.select(gdb, layer_name)
      
      # If spatial data, get geometry
      if (!is.null(arcgisbinding::arc.shape(data))) {
        shape_info <- arcgisbinding::arc.shape(data)
        data$Longitude <- shape_info$x
        data$Latitude <- shape_info$y
      }
      
      message(paste("Successfully imported", layer_name, "using arcgisbinding"))
      return(as.data.frame(data))
    }, error = function(e) {
      stop(paste("arcgisbinding import failed:", e$message))
    })
  }
  # Method 2: Using sf package
  else if (method == "sf") {
    tryCatch({
      # Import using sf
      data <- sf::st_read(dsn = path, layer = layer_name, quiet = TRUE)
      
      message(paste("Successfully imported", layer_name, "using sf"))
      return(data)
    }, error = function(e) {
      stop(paste("sf import failed:", e$message))
    })
  }
}

# Function to export a data frame to a file geodatabase using arcgisbinding
export_to_gdb <- function(data, gdb_path, table_name, overwrite = TRUE) {
  # Check if arcgisbinding is available
  if (!requireNamespace("arcgisbinding", quietly = TRUE)) {
    stop("arcgisbinding package is required but not installed.")
  }
  
  # Initialize ArcGIS product
  arcgisbinding::arc.check_product()
  
  # Create full path for the output table
  output_table_path <- file.path(gdb_path, table_name)
  
  # Write the data
  arcgisbinding::arc.write(output_table_path, data = data, overwrite = overwrite)
  
  message(paste("Successfully exported", table_name, "to", gdb_path))
}

