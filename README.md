GetData_Project
===============

Getting and Cleaning Data Course Project

Study Design
------------
Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Full description available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Processed Data
--------------
Subjects, activity labels, and feature vectors from the original train and test sets were merged into a single dataset. Only 68 of the original 561 features were used, which were the ones that extracted only measurements on the mean and standard deviation for each measurement. Finally, the average value for each feature was calculated for each subject/activity resulting in 35 total observations.

Code Book
---------
35 obs. of 68 variables
* **subject** - The subject who performed the activity for each window sample (1-30).
* **activity** - The type of activity being performed (6 activities: WALKING, WALKING_UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING).
* **tBodyAcc-mean()-X**, **tBodyAcc-mean()-Y**, ... **fBodyBodyGyroJerkMag-std()** - The average value for each subject/activity for each of the 66 feature variables.
