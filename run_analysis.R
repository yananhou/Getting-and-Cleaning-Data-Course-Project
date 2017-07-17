# 1. Download the file and put the file in the 'data' folder

if(!file.exists("./data")){dir.create("./data")}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, destfile = "./data/cpw4.zip", method = "curl")


# 2. Unzip the file to 'UHI HAR Dataset' folder

unzip(zipfile = "./data/cpw4.zip",exdir="./data")


# 3. Get the list of unzipped files

path_cpw4 <- file.path("./data", "UCI HAR Dataset")

files <- list.files(path_cpw4, recursive = TRUE)
files


# 4. Read data from files

# For the purpose of the project, files that will be used include:
- test/subject_test.txt
- test/X_test.txt
- test/y_test.txt
- train/subject_train.txt
- train/X_train.txt
- train/y_train.txt

# Read data from files into variables

# Activity data
dataActivityTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
dataActivityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

# Subject data
dataSubjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
dataSubjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Features data
dataFeaturesTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
dataFeaturesTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")

# Check variable properties
str(dataActivityTest)
str(dataActivityTrain)
str(dataSubjectTrain)
str(dataSubjectTest)
str(dataFeaturesTest)
str(dataFeaturesTrain)


# 5. Merges the training and test data to create one datasets

# Concatenate the data tables
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# Set variable names
colnames(dataSubject) <- c("subject")
colnames(dataActivity) <- c("activity")
dataFeaturesNames <- read.table("./data/UCI HAR Dataset/features.txt")
colnames(dataFeatures) <- dataFeaturesNames$V2

# Merge into one dataset
dataCombine <- cbind(dataSubject,dataActivity)
Data <- cbind(dataFeatures,dataCombine)


# 6. Extract only the measurements on the mean and standard deviation

# Subset the dataFeaturesNames on the mean and std
subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# Subset the data frame by selected names of Features
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")
Data <- subset(Data,select=selectedNames)

# Check the structure of 'Data'
str(Data)


# 7. Name the activities in the dataset with descriptive activity names

activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Factorize variable 'activity' in 'Data'
Data$activity <- factor(Data$activity)
Data$activity <- factor(Data$activity,labels=as.character(activityLabels$V2))

# Chech the 'activity' column
head(Data$activity,20)


# 8. Label the dataset with descriptive variable names

colnames(Data) <- gsub("std()", "SD", names(Data))
colnames(Data) <- gsub("mean()", "MEAN", names(Data))
colnames(Data) <- gsub("^t", "time", names(Data))
colnames(Data) <- gsub("^f", "frequency", names(Data))
colnames(Data) <- gsub("Freq", "Frequency", names(Data))
colnames(Data) <- gsub("Acc", "Accelerometer", names(Data))
colnames(Data) <- gsub("Gyro", "Gyroscope", names(Data))
colnames(Data) <- gsub("Mag", "Magnitude", names(Data))
colnames(Data) <- gsub("BodyBody", "Body", names(Data))

# Check dataset names
colnames(Data)


# 9. Create a second, independent tidy dataset and output it

# The tidy dataset is created with the average of each variable for each subject based dataset from step 4

library(plyr)
DataNew <- aggregate(. ~subject + activity, Data, mean)
DataNew <- DataNew[order(DataNew$subject,DataNew$activity),]
write.table(DataNew, file = "./data/tidydata.txt", row.names = FALSE)





