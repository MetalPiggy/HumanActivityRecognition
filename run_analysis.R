# Set Working folder to where UCI HAR DataSet exists before running this script

# There are two folders for training and test data. We can use rbind to merge subjects, activities and measurements.

# Merge subject_train.txt, X_train.txt and y_train.txt to form the full training dataset. 
# Subject & y values needs to be added to the end, as we will use the ordering of the features from features.txt 
# in X files to get the necessary fields we want
XFileUrl <- "./train/X_train.txt"
XData <- read.table(XFileUrl, header=FALSE)
subjectFileUrl <- "./train/subject_train.txt"
subjectData <- read.table(subjectFileUrl, header=FALSE)
colnames(subjectData) <- "Subject"
yFileUrl <- "./train/y_train.txt"
yData <- read.table(yFileUrl, header=FALSE)
colnames(yData) <- "Activity"
data <- cbind(XData, subjectData, yData)

# Merge subject_test.txt, X_test.txt and y_test.txt to form the full test dataset. 
XFileUrl <- "./test/X_test.txt"
XData <- read.table(XFileUrl, header=FALSE)
subjectFileUrl <- "./test/subject_test.txt"
subjectData <- read.table(subjectFileUrl, header=FALSE)
colnames(subjectData) <- "Subject"
yFileUrl <- "./test/y_test.txt"
yData <- read.table(yFileUrl, header=FALSE)
colnames(yData) <- "Activity"
#Combine with previously created dataset
data <- rbind(data, cbind(XData, subjectData, yData))

# We need to extract the data that is related to mean and std's only
yInd <- ncol(data) #Activity column: last column
subInd <- yInd - 1 #Subject column: 2nd last column
features <- read.table("features.txt")
features <- features[grep("mean\\(\\)|std\\(\\)", features$V2, fixed=FALSE) ,]

#filter our only the columns we need (mean and std)
data <- data[, c(features$V1, subInd, yInd)]
#rename the column names with the names from features.txt
colnames(data) <- c(as.vector(features$V2), "Subject", "Activity")

#use activity names instead of numbers
activity <- read.table("activity_labels.txt")
data$Activity <- factor(data$Activity, levels = as.vector(activity$V1), labels = as.vector(activity$V2)) 

#create a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
summary_data <- ddply(data, .(Subject, Activity), numcolwise(mean))
write.table(summary_data, file = "UCIHARsummarydata.txt", row.name=FALSE)