###############################################################################################
# First, I want to load the libraries and packages I will be using for the project            #
# the following code will first try to load the library but if it can't will then             #
# install the package and try again.  I use require due to it returning an boolean indicating #
# whether or not it successfully loaded.                                                      # 
###############################################################################################

if(require("plyr")){
  print("plyr is loaded correctly")
} else {
  print("trying to install plyr")
  install.packages("plyr")
  if(require(plyr)){
    print("plyr installed and loaded")
  } else {
    stop("could not install plyr")
  }
}

############################################################################################
#This script follows the requirements of the assignment in the order it was presented      #
#                                                                                          #
#1.Merges the training and the test sets to create one data set.                           #
#2.Extracts only the measurements on the mean and standard deviation for each measurement. #
#3.Uses descriptive activity names to name the activities in the data set                  #
#4.Appropriately labels the data set with descriptive variable names.                      #
#                                                                                          #
#5.From the data set in step 4, creates a second, independent tidy data set with the       #
#  average of each variable for each activity and each subject.                            #
############################################################################################

###################################################################
# 1.Merges the training and the test sets to create one data set. # 
################################################################### 
trainingXAxis <- read.table("./train/X_train.txt") 
trainingYAxis <- read.table("./train/y_train.txt") 
trainingSubjects <- read.table("./train/subject_train.txt") 

testXAxis <- read.table("./test/X_test.txt") 
testYAxis <- read.table("./test/y_test.txt") 
testSubjects <- read.table("test/subject_test.txt") 

# create data set for the XAxis 
dataForXAxis <- rbind(trainingXAxis, testXAxis) 

# create data set for the YAxis 
dataForYAxis <- rbind(trainingYAxis, testYAxis) 

# create 'subject' data set 
indexedSubjectData <- rbind(trainingSubjects, testSubjects) 

#################################################################################################### 
# 2. I''m only extracting the measurements on the mean and standard deviation for each measurement # 
####################################################################################################
features <- read.table("features.txt")
featuresNames <- features[,2]

# get only columns with mean() or std() in their names
extractFeatures <- grepl("mean|std", featuresNames, ignore.case = TRUE)

# I only want to keep the data for those columns regarding mean and standard deviation
# subset XAxis data
dataForXAxis <- dataForXAxis[, extractFeatures] 

# correct the column names 
names(dataForXAxis) <- features[extractFeatures, 2] 

############################################################################# 
# 3.I use descriptive activity names to name the activities in the data set #
############################################################################# 
# Grab the activity labels from the provided file
activityLabels <- read.table("activity_labels.txt") 

# update XAxis values with correct activity labels subsetted from what I just read in from the provided file 
dataForYAxis[, 1] <- activityLabels[dataForYAxis[, 1], 2] 

# Let's rename name the column to "activity"
names(dataForYAxis) <- "Activity" 

#########################################################################
# 4. I Appropriately label the data set with descriptive variable names #
######################################################################### 
# correct column name 
names(indexedSubjectData) <- "Subject" 

# Bring it all together in a single data set 
completeDataSet <- cbind(dataForXAxis, dataForYAxis, indexedSubjectData) 

##################################################################################### 
# 5. I Create a second, independent tidy data set with the average of each variable #
# for each activity and each subject                                                #
##################################################################################### 

# used ncol(completeDataSet) to see I had 88 cols
# Last 2 cols are Activity and Subject so subtract those
numVars <- ncol(completeDataSet) - 2
myTidyDataSet <- ddply(completeDataSet, .(Subject, Activity), function(x) colMeans(x[, 1:numVars])) 
write.table(myTidyDataSet, file = "./my_tidy_dataset_norownames.txt", row.name=FALSE) 

print("Done")
