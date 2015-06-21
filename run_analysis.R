library(plyr)

# One R script called run_analysis.R that does the following

# 1. Merges the training and test sets to create one data set
#
# Merge the training and test sets for the 'x' variable
x_merged <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))
#
# Merge the training and test sets for the 'y' variable
y_merged <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))
#
# Merge the training and test sets for the 'subject' data
s_merged <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
#
# Identify columns containing mean or standard deviation
features <- read.table("UCI HAR Dataset/features.txt")
desired_columns <- grep("-(mean|std)\\(\\)", features[, 2])
#
# Keep only desired columns in x variable set
x_merged <- x_merged[, desired_columns]

# 3.Uses descriptive activity names to name the activities in the data set
#
# Convert coded labels into descriptive labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
y_merged[, 1] <- activity_labels[y_merged[, 1], 2]

# 4.Appropriately labels the data set with descriptive variable names
#
# Incorporate appropriate column names
names(x_merged) <- features[desired_columns, 2]
names(y_merged) <- "activity"
names(s_merged) <- "subject"
#
# Create full dataset
full_dataset <- cbind(x_merged, y_merged, s_merged)

# 5. From the dataset in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject
#
# 66 <- 68 columns but last two (activity & subject)
averages <- ddply(full_dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages, "averages.txt", row.name=FALSE)