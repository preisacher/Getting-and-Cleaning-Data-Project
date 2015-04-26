#Getting and Cleaning Data Project
Philippe Reisacher

# Description
This document provides additional information about the variables, data and transformations used for the Project.
A full description of the data I used to produce the tidy data set output can be found at:
UCI Machine Learning Repository "Center for Machine Learning and Intelligent systems" http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

# What I did in this project:
I took the test and training data contained in the X_train.txt, y_train.txt, X_test.txt and y_test.txt from the downloaded files and merged these together with rbind to form a complete set of observations for the project.  I then applied the test subject data along with the X_data.txt and y_data.txt for further analysis.

NOTE: I only included the mean and std columns for analysis per the Project requirements.

 After gathering all the test subject data and merging it with the training data, I took the activities and merged them into a completeDataSet data.frame containing all the data from training and testing with the X and Y axis labels X being the mean and standard deviation columns and Y being the Subjects with each Activity per Subject.

I calculated the mean by use of the ddply function from the plyr package.  

I output my tidy data set into a text file called: my_tidy_dataset_norownames.txt


#Description of input data from the source web page (see url under "description" above)
===================================================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
===================================================================================================

# About the Experiments Dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

==================================================================================================
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra. November 2013.

