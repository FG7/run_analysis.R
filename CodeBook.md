# Code Book

Input Data
The dataset includes the following files:
  - 'README.txt'
  - 'features_info.txt': Shows information about the variables used on the feature vector.
  - 'features.txt': List of all features.
  - 'activity_labels.txt': Links the class labels with their activity name.
  - 'train/X_train.txt': Training set.
  - 'train/y_train.txt': Training labels.
  - 'test/X_test.txt': Test set.
  - 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
  - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to     30. 
  - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity     units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and                        'total_acc_z_train.txt' files for the Y and Z axis. 
  - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total           acceleration. 
  - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The        units are radians/second. 

The run_analysis.R script performs the following steps to clean the data:
  - Read the following files in and store as the corresponding variables:
        - subject_test.txt : subjecttest
        - X_test.txt : xtest
        - y_test.txt : ytest
        - subject_train.txt : subjecttrain
        - X_train.txt : xtrain
        - y_train.txt : ytrain
        - features.txt : features
        - activity_labels.txt : activitylabels
  - Append rows of training data below the rows of test data for the test data, labels, and subjects and saving as alldata, alllabels,     allsubjects.
  - Determine which of the 561 variables contain mean or standard deviation (ignore case) and save result as targetfeatures(86            variables).
  - Subset the table allData based on only the columns that contain mean or standard deviation and save result as targetalldata.
  - Label the columns of targetallData with the desciptive variable names that were saved as targetfeatures.
  - Clean up variable names in targetalldata by removing "()", capitalizing M and S of Mean and Std, and removing "-".
  - Clean up activity names in activitylabels by lowercasing all descriptions and labeling the column "activity" and calling              alllabels.
  - Add "subjects" name to column in allsubjects.
  - Append the cleaned up allsubjects and alllabels to targetalldata to create a clean table with 10299 rows and 88 columns named         cleandata.
  - To produce the final output, cleandata is grouped by subject then activity and saved as groupedcleandata.  The data is then           summarized by mean for each subject and activity for each of 86 measurements.
  - write.table is used to output the final file "tidydata.txt"

