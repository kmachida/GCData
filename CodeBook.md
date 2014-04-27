## run_analysis.R

## Data used

Data is downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Detailed data description can be found here "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
For this experiment, 30 subjects participated and performed 6 types of activities with smarphone.
3-axial linear acceleration and angular velocity were recorded, and dataset were divided into Train and Test sets.

## Description of run_analysis.R script

The script download dataset to current folder and unzip.

It reads txt files to R using read.table function. 
Following files are used:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Train and Test sets are combined, and new columns for subject and activity are assigned.
Index of columns that contain information about mean and standard deviation are created.
Column names and activities are labeld using features.txt and activity_labels.txt.
Only mean and standard deviation columns are extracted using previous step.
Dataset was reshaped to calculate average for each subject and each activity using melt and dcast functions.

## Output of the script

The tidydata created using this script contains 180 rows and 68 columns. 
Columns are subject, activity, and 66 mean and standard deviation measurements.
Each row is an average of each combination of subject and activity.