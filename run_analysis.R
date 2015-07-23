#Part0
#Downloading and unzipping dataset
fileURL<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL,destfile = "data.zip")
unzip("data.zip")

#Reading the Xtrain and Xtest as fixed width files
data_XTrain<-read.fwf('./UCI HAR Dataset/train/X_train.txt',sep='\t',widths=rep(16,561),header = F)
data_XTest<-read.fwf('./UCI HAR Dataset/test/X_test.txt',sep='\t',widths=rep(16,561),header = F)
#Reading the yTrain and yTest files
data_yTrain<-read.table('./UCI HAR Dataset/train/y_train.txt',colClasses=c("numeric"),header=F)
data_yTest<-read.table('./UCI HAR Dataset/test/y_test.txt',colClasses=c("numeric"),header=F)
#Reading the subject id files
data_subTrain<-read.table('./UCI HAR Dataset/train/subject_train.txt',colClasses=c("numeric"),header=F)
data_subTest<-read.table('./UCI HAR Dataset/test/subject_test.txt',colClasses=c("numeric"),header=F)

#Part 1
#Merging the two datasets into one
data_X<-rbind(data_XTrain,data_XTest)
data_Y<-rbind(data_yTrain,data_yTest)
data_sub<-rbind(data_subTrain,data_subTest)
names(data_Y)<-"Activity"
names(data_sub)<-"Subject"
merged_data<-cbind(data_sub,data_Y,data_X)

#Part 2
#required feature columns in data_X containing measurements of mean and std - 79 in total
req_inds<-c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,294:296,345:350)
req_inds<-c(req_inds,373:375,424:429,452:454,503,504,513,516,517,526,529,530,539,542,543,552)
#in the merged dataset these column indices will be offset by a value of 2 because subject and activity will be the first two columns
#Extracting out only the required measurements from the merged dataset, along with subject and activity columns
req_data<-merged_data[,c(1,2,req_inds+2)]

#Part3
#Activity descriptions detailed out in the dataset
req_data<-transform(req_data,Activity=factor(Activity,levels=c(1:6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))

#Part 4
#Getting the descriptive names of features
feature_names<-read.table('./UCI HAR Dataset/features.txt',sep=" ",colClasses=c("numeric","character"))
#Getting the feature names of interest, i.e the ones with mean or std measurement
req_feature_names<-feature_names[req_inds,"V2"]
#Labeling the req_data dataset with the appropriate feature names; The first column is Subject, and second column 
#is Activity, both of which were named earlier itself. All the other columns are renamed below
names(req_data)[-c(1:2)]<-req_feature_names

#Part 5
library(plyr)
library(dplyr)
req_data_grpsubact<-ddply(req_data,c("Subject","Activity"),function(x) colMeans(x[,-c(1:2)]))
write.table(req_data_grpsubact,file='FINAL_tidydata.txt',sep="\t",quote = F,row.names =F)