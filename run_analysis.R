################################################################################
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set.
#  4. Appropriately labels the data set with descriptive variable names.
#  5. From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.
################################################################################
#
library(reshape2)
#
UCI_Data_Dir = "UCI HAR Dataset"
dataUrl    = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
dataFile   = "datafile.zip"
#
if(!file.exists(UCI_Data_Dir)){
        #
        download.file(dataUrl,destfile=dataFile,method="curl")
        #
        unzip(dataFile, files = NULL, list = FALSE, overwrite = TRUE,
              junkpaths = FALSE, exdir = ".", unzip = "internal",
              setTimes = FALSE)}
#
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
#
subject_train  <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test    <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
#
#
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"
#
featureNames <- read.table("./UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2
#
names(y_train) <- "activity"
names(y_test) <- "activity"
#
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
merged_data <- rbind(train, test)
#
mscols <- grepl("mean\\(\\)", names(merged_data)) |
          grepl("std\\(\\)", names(merged_data))
#
mscols[1:2] <- TRUE
#
merged_data <- merged_data[, mscols]
#
merged_data$activity <- factor(merged_data$activity, 
                               labels=c("WALKING",
                                        "WALKING UPSTAIRS", 
                                        "WALKING DOWNSTAIRS", 
                                        "SITTING", 
                                        "STANDING", 
                                        "LAYING"))
#
m <- melt(merged_data, id=c("subjectID","activity"))
tidy <- dcast(m, subjectID+activity ~ variable, mean)
#
write.table(tidy, "tidy.txt", row.name=FALSE)
#
#END