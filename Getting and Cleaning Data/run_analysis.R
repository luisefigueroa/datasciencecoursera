#=========================================================================================================================
# Scritp created by Luis Figueroa on 1/24/2015
# This script was created to produce a tidy data set for the "Getting and Cleaning Data" class from the 
# Data Science specialization at Johns Hopkins university offered through Coursera.
#=========================================================================================================================

# 0._ Reading files into memory with proper desciption for variable names.

setwd("..")
setwd("./users/luisfigueroa/Coursera Data Science Class/3_Getting and Cleaning Data/Project/UCI HAR Dataset")
getwd()

activity <- read.table("activity_labels.txt", header = FALSE, col.names=c("activityID", "activity"))
features <- read.table("features.txt", header = FALSE) # reads features.txt file into R data frame
featuresVector <- as.character(features$V2) # creates features vector using the second column of features data frame containing feature label.

subject_test <- read.table("./test/subject_test.txt", header = FALSE, col.names = c("subject")) # reads subject_test.txt into a data frame
X_test <- read.table("./test/X_test.txt", header = FALSE, col.names = featuresVector) 
Y_test <- read.table("./test/Y_test.txt", header = FALSE, col.names = c("activityID"))

subject_train <- read.table("./train/subject_train.txt", header = FALSE, col.names = c("subject"))
X_train <- read.table("./train/X_train.txt", header = FALSE, col.names = featuresVector)
Y_train <- read.table("./train/Y_train.txt", header = FALSE, col.names = c("activityID"))

# 1.- Combining the training and the test data sets to create one data set.

test <- cbind(subject_test, activityID = Y_test$activityID, X_test) #--- Combining test data sets
train <- cbind(subject_train, activityID = Y_train$activityID, X_train) #--- Combininb train data sets
sensorData <- rbind(train, test)   #--- Combining test and train data


# 2.- Extracts only the measurements on the mean and standard deviation for each measurement

library(dplyr)
sd1<-select(sensorData, subject, activityID)
sd2<-select(sensorData, contains(".mean"))
sd3<-select(sensorData, contains(".std"))
sensorData<-cbind(sd1,sd2,sd3)
names(sensorData)


# 3.- Use descriptive activity names to name the activities in the data set

sensorData <- merge(activity, sensorData, by.x="activityID", by.y="activityID")  # Merging activity values with sensorData data set

# 4._ Appropriately lableling data set with descriptive variable names was done when data sets were loaded into memory in step 0

# 5._ creates a second, independent tidy data set with the average of each variable for each activity and each subject.

sensorAverages <- group_by(sensorData, activity, subject) %>% summarise_each(funs(mean)) # Aggregation
write.table(sensorAverages, file="../sensorAverages.txt", row.name=FALSE) # Output to text file

write.table(names(sensorAverages), file="../columnNames.txt", row.name=FALSE)










