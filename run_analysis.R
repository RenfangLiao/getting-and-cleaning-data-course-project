# getting and cleaning data course project
setwd("C:/Media/Schoolworks/Online course/Getting and Cleaning Data/Course Project")
#install.packages("dplyr")
library(dplyr)
#list.files("./UCI HAR Dataset/")
#read in 
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
actvlabels<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Merges the training and the test sets to create one data set.
mergeddata=rbind(X_train, X_test)
labels<-rbind(Y_train,Y_test)
names(labels)<-"labels"
mergeddata$labels<-labels$labels
subjects<-rbind(subject_train,subject_test)
mergeddata$labels<-labels

mergeddata$subject<-subjects$V1
names(mergeddata$subject)="subject"
mergeddata$subject<-factor(mergeddata$subject)

#Uses descriptive activity names to name the activities in the data set
mergeddata$labels<-factor( labels$labels,levels=c(1,2,3,4,5,6),labels=as.character(actvlabels$V2))

#Appropriately labels the data set with descriptive variable names.
names(mergeddata)[1:561]<-as.character(features$V2)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
toMatch=c("mean","std")
extracteddata<-mergeddata[,grepl(paste(toMatch,collapse="|"), colnames(mergeddata))]
extracteddata$labels=mergeddata$labels
extracteddata$subject=mergeddata$subject


#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df<-extracteddata
average<-aggregate( as.matrix(df[,1:79]), as.list(df[,80:81]), FUN = mean)
#write in
write.table(average,"C:/Media/Schoolworks/Online course/Getting and Cleaning Data/Course Project/average.txt",row.name=FALSE)



