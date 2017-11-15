# Getting-and-Cleaning-Data-Course-Project-Week4

This repository was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.

    First, download and unzip the data file into your R working directory.
    Second, download the R source code into your R working directory.
    Finally, execute R source code to generate tidy data file.

Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

R code explanation
Code combines training dataset and test dataset.
First, dataset was downloaded and unzipped to the specified folder.
Then training and test datas were extracted from the dataset, as well as variable names, activities and subjects data.
Test and training datasets were given descriptive variable names, then they were merged to one dataset.
From the dataset created above was generated smaller dataset, containing only data from measurements on the mean and standard deviation. 
In this set activities were given their respective names.
In last part, from the smaller dataset was created yet another dataset with the averages of each variable for each activity.
Finally, dataset was saved as a text file in the specified folder.

The code was written on the basis of instruction for this assignment.
