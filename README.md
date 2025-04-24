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
This R file is for a project that aims to create a predictive model to understand and forecast the spread of Russian Olive trees in Missoula County, Montana. This modeling project is a collaboration with the Missoula County Ecology Extension Office, with the end goal of helping inform land management decisions, particularly in prioritizing areas for removal of Russian Olive trees.
Breakdown of Key Steps:

    Data Collection and Preparation:

        The file likely begins by loading relevant environmental and ecological data for Missoula County. This may include variables such as soil properties, climate data (e.g., temperature, precipitation), and land cover types.

        It’s probable that there’s some spatial data processing happening too (e.g., using libraries like sf for spatial objects, raster for raster data, or dplyr for data manipulation).

    Model Development:

        The core part of the project is the development and training of multiple models that can predict the spread of Russian Olive. Common modeling techniques in this context could include:

            Logistic regression (GLM): Used for binary classification, likely to predict the presence or absence of Russian Olive in different locations.

            Random Forest (RF): This machine learning algorithm can be used to capture complex relationships between predictors and outcomes.

            Gradient Boosting Machines (GBM): Another machine learning algorithm that builds a predictive model by combining the outputs of many weak models (trees).

            Generalized Additive Models (GAM): These are often used when the relationships between predictors and outcomes are non-linear.

        The different models will be trained on various subsets of data and evaluated using appropriate metrics like accuracy, precision, and recall.

    Model Evaluation:

        The models are compared to each other based on performance metrics. These metrics could include:

            Accuracy: The proportion of correct predictions.

            Precision: The proportion of positive predictions that were actually correct.

            Recall: The proportion of actual positives that were correctly identified.

        Cross-validation (or similar) could be used to evaluate how well each model generalizes to new data.

    Selection of Best Model:

        After evaluating all the models, the one with the best performance across these metrics is selected as the final model for making predictions about the spread of Russian Olive.

        This ensures that the final chosen model has the highest likelihood of providing accurate and reliable predictions for land management purposes.

    Predictions and Visualizations:

        Once the best model is selected, it will be used to predict the spread of Russian Olive in Missoula County. These predictions will likely be spatially distributed, showing which areas are most vulnerable to Russian Olive spread.

        The results will be visualized using tools like ggplot2 or spatial plotting packages like ggspatial. This step makes it easier for stakeholders to understand the model's findings and make data-driven decisions for land management.

    Sharing the Results:

        Finally, the results—including the selected model and the visualized data—will be shared with the Missoula County Ecology Extension Office and other stakeholders. This allows them to make informed decisions based on the predictions, such as where to focus Russian Olive removal efforts.

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
Rscript Russian_Olive_Model.R
```

## Usage <a name = "usage"></a>

At this point there are several caveats to the modeling process that will have to be followed in order to generate a model:

1. The data must be in the correct format. The data must be in a .csv file with the raster values for each point as columns and a column labeled PA for presence/absence of Russian Olive. 

2. While not necessary, it is recommended to import a shapefile of the study area. This will allow you to visualize the results of the model.

3. The model is currently set up to use a random forest model. This can be changed to any other model that can be used for classification.


## To Do
- [x] Add connection to ArcGIS for data import
- [x] Add connection to ArcGIS for shapefile import
- [x] Add connection to ArcGIS for model export
- [x] Add more raster data
- [x] Add more visualizations
- [x] Add more documentation
- [x] Add more testing and validation (corr plot, etc.)
- [x] Add Maxent or other model



## Authors <a name = "authors"></a>
- [@tobin-haefele](www.github.com/tobin-haefele) - Initial Author and Developer

## Acknowledgements
- [Missoula County Ecology Extension Office ](https://missoulaeduplace.org/) - Provided data and guidance for the project
- [University of Montana Spatial Analysis Lab](https://www.umt.edu/spatial-analysis-lab/default.php) - Provided guidance and resources for the project
- [Montana Natural Heritage Program](https://mtnhp.org/) - Provided data for the project
