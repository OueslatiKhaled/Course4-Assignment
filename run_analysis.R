# Load the package dplyr
library("dplyr")

# Load the test dataset 
subject_test <- read.table("test/subject_test.txt", header = FALSE)
X_test <- read.table("test/X_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)

# Bind the subject_test and y_test to X_test and rename the new variables
test_dataset <- cbind(subject_test, y_test, X_test)
names(test_dataset)[1] <- "subject"
names(test_dataset)[2] <- "activity"

# Load the Train dataset 
subject_train <- read.table("train/subject_train.txt", header = FALSE)
X_train <- read.table("train/X_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)

# Bind the subject_train and y_train to X_train and rename the new variables
train_dataset <- cbind(subject_train, y_train, X_train)
names(train_dataset)[1] <- "subject"
names(train_dataset)[2] <- "activity"

# Bind the Train and the test datasets to build one dataset
dataset <-rbind(test_dataset, train_dataset)

# Transform the data frame to tbl
dataset <- tbl_df(dataset)

# Label the data set with descriptive variable names
labels <- read.table("features.txt", header = FALSE) 
names(dataset)[3:563] <- make.names(as.character(labels[,2]), unique = TRUE)

# Extracts the measurements on the mean and standard deviation for each measurement
meanstd <-select(dataset, matches("subject"), matches("activity"), contains(".mean.."), contains(".std.."))

# Load the activity file
activity <- read.table("activity_labels.txt", stringsAsFactors = FALSE, header = FALSE)

# name the activity variable in the data set using the descriptive activity names
i <- 1
while(i <= nrow(activity)) {
  meanstd$activity[meanstd$activity == activity[i, 1]] <- activity[i, 2]
  i <- i + 1
}

# New data set with the average of each variable for each activity and each subject
Summarized <- group_by(meanstd, subject, activity) %>% summarize_all(funs(mean))

# Save the new data set in a text file 
write.table(Summarized, file = "TidyDataSet.txt", sep = " ", row.names = FALSE, col.names = TRUE)
