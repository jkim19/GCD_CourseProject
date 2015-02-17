# Getting and Cleaning Data Course Project
Author: jkim19

The data being used for this project can be found at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Inside the zip file there is a "UCI HAR Dataset" directory with both "test" and "train" datasets.

The R script called run_analysis.R does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Other notes:
- after steps 1-4, tidy data stored in "tblTidy"
- step 5, second tidy data stored in "secondTblTidy" and written to file "tidydata.txt"
- for mean and std, decided to use any features that have the string "mean" and "std."  Without knowing the data more, I assume the feature names are reliable enough.
- the run_analysis.R script keeps the temporary tables around.  this allows for understanding and debugging the code to be easier.  this code could be rewritten to remove all temporary tables and quickly getting to merged data, and tidy data.
- outputs the second tidy data to a file names "tidydata.txt"
- I've included copies of the data files that I downloaded from the zip file.  The run_analysis.R script should be run in the same directory as the data files.

