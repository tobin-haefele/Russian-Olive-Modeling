library(arcgisbinding)

data_import_arcgis <- function(path, table){
  #import path to ArcGIS project
  path <- path
  
  
  #get product info
  arc.check_product()
  
  #open gdb
  missoula_gdb <- arc.open(path)
  
  # Select the "CombinedTable" from the geodatabase
  russian_olive_test_df <- arc.select(missoula_gdb)}

# Define the output path for the new table
output_table_path <- file.path("C:/Users/thaef/Documents/ArcGIS/Projects/MyProject1/MyProject1.gdb", "predictions_tbl")

# Export the data frame to the geodatabase
arc.write(output_table_path, data = predictions_df)

