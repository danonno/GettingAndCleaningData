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
projectDir = "/Users/dn/Coursera/Getting_and_Cleaning_Data/CourseProject"
dataUrl    = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
dataFile   = "datafile.zip"
dataDir    = "./data"
#
setwd(projectDir)
#
if(!file.exists(dataDir)){dir.create(dataDir)}
#
setwd(dataDir)
# downlad the data if it is missing
if(!file.exists(dataFile)){
        #
        download.file(dataUrl,destfile=dataFile,method="curl")
        #
        unzip(dataFile, files = NULL, list = FALSE, overwrite = TRUE,
              junkpaths = FALSE, exdir = ".", unzip = "internal",
              setTimes = FALSE)}
#
setwd(projectDir)
#
# Read the data
#
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
#
subject_train  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test    <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
#
features <- read.table("./data/UCI HAR Dataset/features.txt")
#
# add column name for subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"
#
# add column names for measurement files
featureNames <- read.table("./data/UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2
#
# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"
#
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
merged_data <- rbind(train, test)
#
# extract columns for mean or std
mscols <- grepl("mean\\(\\)", names(merged_data)) |
          grepl("std\\(\\)", names(merged_data))
#
# keep the subjectID and activity columns
mscols[1:2] <- TRUE
#
# remove unnecessary columns
merged_data <- merged_data[, mscols]
#
# convert the activity column from integer to factor
merged_data$activity <- factor(merged_data$activity, 
                               labels=c("WALKING",
                                        "WALKING UPSTAIRS", 
                                        "WALKING DOWNSTAIRS", 
                                        "SITTING", 
                                        "STANDING", 
                                        "LAYING"))
#
## average of each variable for each activity and each subject.
#
# create the tidy data set
m <- melt(merged_data, id=c("subjectID","activity"))
tidy <- dcast(m, subjectID+activity ~ variable, mean)
#
write.table(tidy, "tidy.txt", row.name=FALSE)
#END