## load necessary packages
library(data.table)
library(dplyr)
## Create a data directory if necessary and set working directory.
if (!file.exists("./data7")){dir.create("./data7")}
setwd("./data7")
## Download data file; unzip the data file.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="Dataset.zip")
unzip("Dataset.zip")

## Read in the data from the data files that are needed.
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt",  sep="", header=FALSE)
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", sep="", header=FALSE)
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

## Append rows of training data below the rows of test data for 
## the test data, labels, and subjects.
alldata <- rbind(xtest, xtrain)
alllabels <- rbind(ytest, ytrain)
allsubjects <- rbind(subjecttest, subjecttrain)

## Determine which of 561 variables contain mean or standard deviation (ignore case).
targetfeatures <- grep(".*mean.*|.*std.*", features[,2], ignore.case=TRUE)

## Subset allData based on only the columns that contain mean or standard deviation.
targetalldata <- alldata[,targetfeatures]

## Label the columns of targetallData
names(targetalldata) <- features[targetfeatures, 2]

## Clean up variable names, minimizing special characters
names(targetalldata) <- gsub("\\(\\)", "", names(targetalldata)) # remove ()
names(targetalldata) <- gsub("mean", "Mean", names(targetalldata))# capitalize M
names(targetalldata) <- gsub("std", "Std", names(targetalldata)) # capitalize S
names(targetalldata) <- gsub("-", "", names(targetalldata)) # remove "-" in column names  

## Uses descriptive activity names to name the activities in 
## the data set
activitylabels[, 2] <- tolower(gsub("_", "", activitylabels[, 2])) # lowercase all activity labels
activitylabels2 <- activitylabels[alllabels[, 1], 2] #vector with names of activites
alllabels[, 1] <- activitylabels2
names(alllabels) <- "activity" # label column "activity"

## Add name "subjects" to the allsubjects column.
names(allsubjects) <- "subject"

## Add subjects, activities to targetalldata
cleandata <- cbind(allsubjects, alllabels, targetalldata)

## Group the data in the new dataset by subject and activity.
groupedcleandata <- group_by(cleandata, subject, activity)
## Summarize the grouped data and creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
tidydata <-summarise_each(groupedcleandata, funs(mean))

## Output the dataset as a text file.
write.table(tidydata, file="tidydata.txt", row.names=FALSE)
