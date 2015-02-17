################################################
# run_analysis.R
# author: jkim19
#
# description: Getting and Cleaning Data (GCD) Course Project
################################################

## 1. Merges the training and the test sets to create one data set
tblFeatures <- read.table("features.txt", colClasses=c("numeric","character"))

tblTestXData <- read.table("X_test.txt")
tblTrainXData <- read.table("X_train.txt")
tblTestYData <- read.table("Y_test.txt")
tblTrainYData <- read.table("Y_train.txt")
tblTestSubject <- read.table("subject_test.txt")     #, colClasses=c("character"))
tblTrainSubject <- read.table("subject_train.txt")     #, colClasses=c("character"))

tblActivityLabels <- read.table("activity_labels.txt")

colXData <- rbind(tblTrainXData, tblTestXData)
colSubject <- rbind(tblTrainSubject, tblTestSubject)
colActivity <- rbind(tblTrainYData, tblTestYData)

tblCombined <- cbind(colSubject,colActivity,colXData)
## 4. Appropriately labels the data set with descriptive variable names
colnames(tblCombined) <- c("Subject", "Activity", tblFeatures$V2)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
library(dplyr)
#select subject column, activity column, and any columns with "mean" or "std" in the name 
meanstdcols <- sort(c( c(1,2), grep("mean()",colnames(tblCombined)), grep("std()",colnames(tblCombined))))
tblTidy <- tblCombined[meanstdcols]

## 3. Uses descriptive activity names to name the activities in the data set
tblTidy <- mutate(tblTidy, Activity = tblActivityLabels$V2[tblTidy$Activity])

## 5. From the data set through steps 1-4, create a second, independent tidy data set with the 
##      average of each variable for each activity and each subject
tblTidyGrouped <- group_by(tblTidy,Subject, Activity)
secondTblTidy <- summarise_each(tblTidyGrouped, funs(mean))

write.table(secondTblTidy,file="tidydata.txt",row.name=FALSE)

## if we want to clean some memory, set temporary tables to NULL
## Decided to leave temporary tables instead of rewriting code to not use them.
## The script code is very easy to follow and the temporary tables allow for easy debugging
#tblTestXData <- NULL
#tblTrainXData <- NULL
#tblTestYData <- NULL
#tblTrainYData <- NULL
#tblTestSubject <- NULL
#tblTrainSubject <- NULL
#colXData <- NULL
#colSubject <- NULL
#colActivity <- NULL