==================================================================
Peer-graded Assignment: Getting and Cleaning Data Course Project
==================================================================


Source of the original data
======================================
The source of the original data is the project “Human Activity Recognition Using Smartphones Dataset”. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
In the file “subject_train.txt” each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
The file “activity_labels.txt” links the class labels with their activity name.


Merging train and test datasets
======================================
The first transformation of the data was merging the train and the test datasets:
* Step1: Bind the variables subject from the file subject_train.txt and the variable activity from the file “y_train.txt” to the the variables in the file X_train.
* Step2: Add a meaningful names (subject and activity) to the new added variables.
* Step3: Bind the rows of the train dataset and the rows of the test dataset.


Appropriately labels the data set with descriptive variable names
================================================
I opted to rename the variables before before continue the rest of the assignment.
* Step1: Transform the data frame the tbl to can manipulate the data using the dplyr library
* Step2: Extract the variable names from the file "features.txt" to rename the variables using the function make.names with the option unique=TRUE to can use the function select.


Extracts only the measurements on the mean and standard deviation for each measurement
=====================================================================
Using the function select I extracted the only the measurements on the mean and standard deviation for each measurement. I identified thoses variable by the words “mean” and “str”.


Name the activity variable using the descriptive activity names
===============================================================
* Step1: Load the descriptive activity names in a dataframe
* Step2: Name the activity using the new dataframe.


Creates a tidy data set with the average of each variable for each activity and each subject
====================================================================
Step1: Group the tbl by subject and activity.
Step2: Summarize the output of the function Goup_by using the function mean.frugal