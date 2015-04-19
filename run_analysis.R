library(dplyr)

# Download .zip file and extract contents
destfile <- "./getdata-projectfiles-UCI HAR Dataset.zip"
if (!file.exists(destfile)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile=destfile, method="curl")
}
features <- read.table(unzip(destfile, files="UCI HAR Dataset/features.txt", exdir=".", overwrite=TRUE), sep=" ")
activity_labels <- read.table(unzip(destfile, files="UCI HAR Dataset/activity_labels.txt", exdir=".", overwrite=TRUE), sep=" ")
train_subject <- read.table(unzip(destfile, files="UCI HAR Dataset/train/subject_train.txt", exdir=".", overwrite=TRUE), sep=" ")
train_X <- read.table(unzip(destfile, files="UCI HAR Dataset/train/X_train.txt", exdir=".", overwrite=TRUE))
train_y <- read.table(unzip(destfile, files="UCI HAR Dataset/train/y_train.txt", exdir=".", overwrite=TRUE), sep=" ")
test_subject <- read.table(unzip(destfile, files="UCI HAR Dataset/test/subject_test.txt", exdir=".", overwrite=TRUE), sep=" ")
test_X <- read.table(unzip(destfile, files="UCI HAR Dataset/test/X_test.txt", exdir=".", overwrite=TRUE))
test_y <- read.table(unzip(destfile, files="UCI HAR Dataset/test/y_test.txt", exdir=".", overwrite=TRUE), sep=" ")

# Combine train and test sets
subject <- bind_rows(train_subject, test_subject)
y <- bind_rows(train_y, test_y)
X <- bind_rows(train_X, test_X)

# Add descriptive variable names
names(subject) <- "subject"
names(y) <- "activityId"
names(X) <- features$V2

# Extract only measurements on the mean and standard deviation for each measurement
X <- X[!duplicated(features$V2)]
X <- bind_cols(select(X, contains("-mean()")), select(X, contains("-std()")))

# Add descriptive activity names
names(activity_labels) <- c("activityId","activity")
y2 <- left_join(y, activity_labels, by="activityId")

# Combine all datasets into single dataframe
all <- bind_cols(subject, y2, X) %>%
  select(-activityId)

# Create tidy dataset with the average of each variable for each activity and each subject
tidy <- group_by(all, subject, activity) %>% 
  arrange(subject, activity) %>%
  summarise_each(funs(mean))

# Export tidy dataset
write.csv(tidy, file="tidy.txt", row.names=FALSE)
write.csv(tidy, file="tidy.csv", row.names=FALSE)