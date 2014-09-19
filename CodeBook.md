# Getting and Cleaning Data - Course Project - Code Book


## Data:
There are two sets of data, one for training and the other testing. They are in their corresponding folder structure.

- 'features.txt': List of all features. This file is used to pick which columns are required.

- 'activity_labels.txt': Links the class labels with their activity name. This file is used to replace activity factors with descriptive activity names.

- 'train/X_train.txt': Training set. This file holds all 561 measurements (as listed in features.txt) for every subject and activity.

- 'train/y_train.txt': Training labels. This file holds the column that represent the activity.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Test set. Similar to X-train.txt.

- 'test/y_test.txt': Test labels. Similar to y_train.txt.

- 'test/subject_test.txt': Test subjects. Similar to subject_train.txt.

## Features used for analysis
As required per assignment, the mean and standard deviation for each measurement will be used. You can refer to requiredfeatures.txt for a list of features used in the analysis.

## Actions:
* Merges the training and the test sets to create one data set: 
X_train.txt, y_train.txt and subject_train.txt are combined by cbind to create one single data with training set. Test data is merged in a similar way. The results of both are merged by rbind to create one dataset including all the measurements.
* Extracts only the measurements on the mean and standard deviation for each measurement.
Only the mean and std features are filtered. grep function is used to find the features with "mean()" and "std()" in their names.
* Appropriately labels the data set with descriptive variable names.
colnames of the dataset is updated by the corresponding values from features.txt
* Uses descriptive activity names to name the activities in the data set
activity.txt is used to create the levels and labels of the Activity column
* From the data set created in the last step, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The result is saved as UCIHARsummarydata.txt.
plyr library is used to create a summary data based on Subject and Activity.



