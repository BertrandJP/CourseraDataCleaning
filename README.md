This repo contains one R script called run_analysis.R that does the following. 
0. If required, downloads and extract the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The file result.txt contains the tidy data set obtained in the 5th step.

The file CodeBook.md contains a description of the variables of the data sets, and of the methodology used
