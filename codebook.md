# Code Book for run_analysis.R

### Code Outline

1. Merges the training and test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the dataset in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


### Variables

- <b>x_merged</b> Merges the training and test sets for the 'x' variable
 <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))
- <b>y_merged</b> Merges the training and test sets for the 'y' variable
- <b>s_merged</b> Merges the training and test sets for the 'subject' data
- <b>features</b> Contains a list of all column names used in x_merged data set
- <b>desired_columns</b> A T/F vector that uses RegEx to identify columns containing mean or standard deviation
- <b>activity_labels</b> Contains a descriptive list of all activity labels
- <b>full_dataset</b> Binds x_merged, y_merged, s_merged and also includes readable column names
- <b>averages</b> Dataset that includes only the averages for each activity and subject
