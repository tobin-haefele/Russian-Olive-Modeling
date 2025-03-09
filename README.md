<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://mtnhp.org/thumbnail/defaultGen.aspx?itemid=70456&names=Russian%20Olive%20Elaeagnus%20angustifolia&copyright=MTNHP&photographer=Bonnie%20Heidel&maxWidth=434&maxHeight=400" alt="Project logo"></a>
</p>

<h3 align="center">Missoula Russian Olive Watch</h3>

<div align="center">

  [![Status](https://img.shields.io/badge/status-active-success.svg)]() 
  [![GitHub Issues](https://img.shields.io/github/issues/kylelobo/The-Documentation-Compendium.svg)](https://github.com/tobin-haefele/Russian-Olive-Modeling/issues)
  [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/kylelobo/The-Documentation-Compendium.svg)](https://github.com/tobin-haefele/Russian-Olive-Modeling/pulls)

</div>

---

<p align="center"> The Missoula Olive Watch is a project focused on tracking the spread of the invasive species Elaeagnus angustifolia (Russian Olive) in Missoula County, Montana. 
    <br> 
</p>

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)
+ [Usage](#usage)
+ [To Do](#todo)
+ [Authors](#authors)

## About <a name = "about"></a>
This project is a collaboration between myself and the Missoula County Ecology Extension Office. The goal of the project is to create a model that can predict the spread of Russian Olive in Missoula County. The model will be used to inform land management decisions and help prioritize areas for removal.

## Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them.

```
R version 4.3.0 or higher 
```

### Setup

A step by step series of examples that tell you how to get a development env running.

To begin you will need to install the following packages in R:

```
install.packages("sf")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("blockCV")
install.packages("randomForest")
install.packages("pdp")
```

Next you will need to clone the repository to your local machine:

```
git clone 
```

Now you need to set the data directory in the R script to the location of the data on your machine:

```
data_dir <- "path/to/data"
```

At this point you should be able to run the R script and generate the model.

```
Rscript Russian_Olive_Modeling.R
```

## Usage <a name = "usage"></a>

At this point there are several caveats to the modeling process that will have to be followed in order to generate a model:

1. The data must be in the correct format. The data must be in a .csv file with the raster values for each point as columns and a column labeled PA for presence/absence of Russian Olive. 

2. While not necessary, it is recommended to import a shapefile of the study area. This will allow you to visualize the results of the model.

3. The model is currently set up to use a random forest model. This can be changed to any other model that can be used for classification.


## To Do
- [ ] Add connection to ArcGIS for data import
- [ ] Add connection to ArcGIS for shapefile import
- [ ] Add connection to ArcGIS for model export
- [ ] Add more raster data
- [ ] Add more visualizations
- [ ] Add more documentation

## Authors <a name = "authors"></a>
- [@tobin-haefele](www.github.com/tobin-haefele) - Initial Author and Developer

## Acknowledgements
- Missoula County Ecology Extension Office ([text](https://missoulaeduplace.org/)) - Provided data and guidance for the project
- University of Montana Spatial Analysis Lab ([text](https://www.umt.edu/spatial-analysis-lab/default.php)) - Provided guidance and resources for the project
- Montana Natural Heritage Program ([text](https://mtnhp.org/)) - Provided data for the project
