library(arcgisbinding)
library(sf)


# Define the output path for the new table
output_table_path <- file.path("C:/Users/thaef/OneDrive/Documents/School/Russian-Olive-Modeling/MyProject1/MyProject1/MyProject1.gdb", "rf_predictions_tbl_new")

# Export the data frame to the geodatabase
arc.write(output_table_path, data = predictions_df)
