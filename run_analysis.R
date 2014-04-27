install.pachages("reshape2")
library(reshape2)
## Get data fro online and unzip
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "PADataset.zip")
unzip("PADataset.zip")

## Read data into R
TrainSet <- read.table("./UCI HAR Dataset/train//X_train.txt")
TrainLabel <- read.table("./UCI HAR Dataset/train//y_train.txt")
TestSet <- read.table("./UCI HAR Dataset/test//X_test.txt")
TestLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
FeatureList <- read.table("./UCI HAR Dataset//features.txt")
ActLabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## combine Test and Train sets
dataset <- rbind(TrainSet, TestSet)
datalabel <- rbind(TrainLabel,TestLabel)
datasubject <- rbind(SubjectTrain,SubjectTest)
colnames(datasubject) <- "Subject"
datasubact <- cbind(datalabel,datasubject)
## extract mean and std column
charname1 <- "mean\\(\\)"
charname2 <- "std\\(\\)"
dindex1 <- grep(charname1,FeatureList$V2)
dindex2 <- grep(charname2,FeatureList$V2)

## create activity name column and change column name
datasubact1 <- merge(datasubact,ActLabel,by.x = "V1",by.y = "V1", sort = FALSE)
colnames(datasubact1)[3] <- "Activity"
colnames(dataset) <- FeatureList[,2]
dataset <- cbind(dataset,datasubact1[,2:3])

## subset only mean and std using index created and reshape data
MeanStdSubset <- dataset[,sort(c(dindex1,dindex2,562,563))]
newdataset <- melt(MeanStdSubset,c("Subject","Activity"))
tidyData <- dcast(newdataset,Subject + Activity ~ variable,mean)
write.table(tidyData,file = "courseproject.txt",row.names = FALSE)

