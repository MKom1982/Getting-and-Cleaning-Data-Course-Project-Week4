## downloading & unzipping of the dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filePath<-"./dataset.zip"
download.file(fileUrl,filePath)
unzip("./dataset.zip",exdir="./Dataset")

## implementation of dplyr library which will be useful in this assignment
library(dplyr)

## reading the training data
Xtrain<-read.table("./Dataset/UCI HAR Dataset/train/X_train.txt")
Xtrainlab<-read.table("./Dataset/UCI HAR Dataset/train/y_train.txt")
Xtrainsub<-read.table("./Dataset/UCI HAR Dataset/train/subject_train.txt")

## reading the test data
Xtest<-read.table("./Dataset/UCI HAR Dataset/test/X_test.txt")
Xtestlab<-read.table("./Dataset/UCI HAR Dataset/test/y_test.txt")
Xtestsub<-read.table("./Dataset/UCI HAR Dataset/test/subject_test.txt")

## reading the data description
Xnames<-read.table("./Dataset/UCI HAR Dataset/features.txt")

## reading the activities description
Xacts<-read.table("./Dataset/UCI HAR Dataset/activity_labels.txt")

## 4. Labelling the data set with descriptive variable names. 
colnames(Xtrain)<-Xnames[,2]
colnames(Xtrainlab)<-"activ_id"
colnames(Xtrainsub)<-"subject_id"
colnames(Xtest)<-Xnames[,2]
colnames(Xtestlab)<-"activ_id"
colnames(Xtestsub)<-"subject_id"
colnames(Xacts)<-c('activ_id','activ_type')

## 1. Merging of the training and the test sets to create one data set.
Xtrainfin<-cbind(Xtrain,Xtrainlab,Xtrainsub)
Xtestfin<-cbind(Xtest,Xtestlab,Xtestsub)
Xmerge<-rbind(Xtrainfin, Xtestfin)

## 2. Extraction of only the measurements on the mean and standard deviation 
## for each measurement.
selNames<-colnames(Xmerge)
mean_std<-(grepl("activ_id",selNames)|grepl("subject_id",selNames)|
                    grepl("mean..",selNames)|grepl("std..",selNames))
Xmergefin<-Xmerge[,mean_std==TRUE]

## 3. Giving the descriptive activity names to  the activities in the data set.
Xmergefin_act<-merge(Xmergefin,Xacts,by='activ_id')

## 5. Creation of second, independent tidy data set with the average of 
## each variable for each activity and each subject, from dataset created in 4.
Xtidy<-aggregate(. ~subject_id + activ_id,Xmergefin_act,mean)

## 6. Writing the tidy data set to separate txt file.
write.table(Xtidy, file = "./Dataset/UCI HAR Dataset/XtidySet.txt", row.name=FALSE)