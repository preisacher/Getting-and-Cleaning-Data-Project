# Getting-and-Cleaning-Data-Project
Project for the Getting and Cleaning Data course


This script follows the requirements of the assignment in the order it was presented

1.Merges the training and the test sets to create one data set.                           
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set                  
4.Appropriately labels the data set with descriptive variable names.                      
5.From the data set in step 4, creates a second, independent tidy data set with the       
  average of each variable for each activity and each subject.                            


There are 6 files included from Human Activity Recognition Using Smartphones Data Set: X_train.txt , y_train.txt, X_test.txt, y_test.txt, subject_train.txt and subject_test.txt.

extractFeatures contains only the mean and standard deviation columns.  I made sure to be case insensitive to get all columns no matter the case.

After Merging, Extracting only those measurements for mean and std, labeling and creating a tidy data set, I apply the mean to all values 1 to 86 by using the ddply function which allowed me apply the colMeans function to the data.frame.

