---
title: "Getting and Cleaning Data - Course Project"
output: html_document
---

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Analysis
run_analysis.R script will run the analysis on the dataset. It is assumed that the zip file is downloaded and extracted to the working directory.

plyr package is required for run_analysis.R

### Actions:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Appropriately labels the data set with descriptive variable names. 
* Uses descriptive activity names to name the activities in the data set
* From the data set created in the last step, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The result is saved as UCIHARsummarydata.txt.



