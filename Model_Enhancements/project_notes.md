# Project Notes
This document serves as a record of the project, including its goals, challenges, and solutions. It is intended to provide a comprehensive overview of the project's development process and outcomes.

## Project Goals
- Enhance the performance of the existing model by implementing various techniques and strategies.
- Explore the impact of different variables on model performance.
- Document the process and results for future reference and learning.

## Challenges Faced
- Identifying the most effective techniques for model enhancement.
- Configuring data preprocessing steps to meet different model requirements.
- Currently I am having issues with the GAM model, it is unable to converge. I will need to investigate the data and model parameters to identify the cause of this issue.
- Model accuracy is very high across the board, which makes me suspicious of the results. I will need to investigate the data and model parameters to identify the cause of this issue.

## Future Work
[ ] Implement the maxent model to compare its performance with the current model.
[ ] Create an interactive dashboard to visualize model performance and allow for selection of different models and parameters.
[ ] Implement data from the statewide MTNHP dataset to improve model accuracy and reliability.
[ ] Potentially explore the use of a neural network model for further enhancement.
[ ] Continue to document the process and results for future reference and learning.

## General Notes
- The data import process could be optimized, I think potentially having a UI to let a user select the data they want to import would be helpful. That might be a python script that runs before the R script, having it remember the prior selection would be helpful so the user doesn't have to select the same data every time.
- I need to either create a rmarkdown or another interactive website to replace my ArcGIS storymap when I lose access to that. That could potentially be relieved by having the Spatial Analysis Lab take over the hosting of the storymap, but I think it would be better to have a more interactive website that allows for user input and selection of different models and parameters.
- As for the state data, it would probably be best to have a seperate model for that and then test with the Missoula county data to see if it is a good fit. This is something I can probably talk to MTNHP about, they might have some ideas on how to best implement that. 
- Overall I don't think I have anything that I am super reliant on in regards to ArcGIS. I will definitely need to make sure I have everything backed up and saved in a way that I can access it without ArcGIS. I think the best way to do this is to have a folder structure that is easy to navigate and has everything organized in a way that makes sense. 

## Work To Do (Capstone Related)
- [ ] Attempt to finish the GAM model.
- [ ] Polish my written report and presentation to be more concise and clear about the modeling process and results.
- [ ] Compare the different model results and document the differences and similarities.
- [ ] Test interpolation methods and mapping within R to see if I can get a better result than ArcGIS.

