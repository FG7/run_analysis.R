# run_analysis.R
This repo contains the final project of the Getting and Cleaning Data class.
Included in this repo are three files:
  1.  This README.md file which gives an overview of the project.
  2.  CodeBook.md which describes the data, variables, and transformations and work performed to clean up the data.
  3.  run_analysis.R is the script which executes the functions necessary to complete the project.

The data for the project comes from the UCI Machine Learning Repository and was collected by 30 volunteers performing six
activities while wearing a waist-mounted smartphone with embedded inertial sensors.
The data was downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script, run_analysis.R completes the following project requirements:
  1.Merges the training and the test sets to create one data set.
  2.Extracts only the measurements on the mean and standard deviation for each measurement.
  3.Uses descriptive activity names to name the activities in the data set
  4.Appropriately labels the data set with descriptive variable names.
  5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each   subject.

To run the script, copy run_analysis.R into your working directory and run it in R.  Your output will be a tidy dataset as described in requirement 5 above and called "tidydata.txt".

Thank you for reviewing my work.
Enjoy
