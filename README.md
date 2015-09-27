# Getting And Cleaning Data Assignment

## Project Requirements: You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Before you run the R code
1. Download the .zip file and unzip it in the working directory. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Read more about the data here -> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Run_Analysis.R description
1. The code if makes sure that the reshape and reshape2 packages are installed, and if not those packages will be installed
2. The reshape and reshape libraries are loaded
3. Activity lables file is loaded
4. feature list is loaded
5. As the project only needs the mean and standard deviation measurements, only those features are to be inlcuded
6. X_test, Y_test and Subject_test files are loaded and merged
7. X_train, Y_train and Subject_train files are loaded and merged
8. The test and train files are combined to create the final file
9. Using the melt function to transpose the data 
10. Using the dcast function to create the final file with the means
