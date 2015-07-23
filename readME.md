# README

This file describes the steps to run the run_analysis.R script

# Part0
## Downloading and reading the datasets


```r
fileURL<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL,destfile = "data.zip")
unzip("data.zip")
```
## Reading the Xtrain and Xtest as fixed width files

```r
data_XTrain<-read.fwf('./UCI HAR Dataset/train/X_train.txt',sep='\t',widths=rep(16,561),header = F)
data_XTest<-read.fwf('./UCI HAR Dataset/test/X_test.txt',sep='\t',widths=rep(16,561),header = F)
```
## Reading the yTrain and yTest files

```r
data_yTrain<-read.table('./UCI HAR Dataset/train/y_train.txt',colClasses=c("numeric"),header=F)
data_yTest<-read.table('./UCI HAR Dataset/test/y_test.txt',colClasses=c("numeric"),header=F)
```
## Reading the subject ID train and test files

```r
data_subTrain<-read.table('./UCI HAR Dataset/train/subject_train.txt',colClasses=c("numeric"),header=F)
data_subTest<-read.table('./UCI HAR Dataset/test/subject_test.txt',colClasses=c("numeric"),header=F)
```
# Part 1
## Merging the datasets into one

The first step is to stack the train and test data on top of each other, for X, Y, and the subject variables.
The variable names for Y and Subject variables are modified to Activity and Subject respectively, for clarity.
The final merged dataset is created by combining the three datasets column-wise.

```r
data_X<-rbind(data_XTrain,data_XTest)
data_Y<-rbind(data_yTrain,data_yTest)
data_sub<-rbind(data_subTrain,data_subTest)

names(data_Y)<-"Activity"
names(data_sub)<-"Subject"
merged_data<-cbind(data_sub,data_Y,data_X)
```

The dimensions of the final dataset is 10299 rows and 563 columns

# Part 2
## Extracting required feature columns 
The required features in data_X (combined XTrain and XTest) containing measurements of mean and std are 79 in total
and are extracted manually based on their column indices


```r
req_inds<-c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,294:296,345:350)
req_inds<-c(req_inds,373:375,424:429,452:454,503,504,513,516,517,526,529,530,539,542,543,552)
```

In the merged dataset these column indices will be offset by a value of 2, because the subject and activity variables will be the first two columns.
The final required dataset (req_data) is obtained by extracting out only the required measurements from the merged dataset, along with subject and activity columns

```r
req_data<-merged_data[,c(1,2,req_inds+2)]
```
# Part3
## Activity descriptions 
The activity variables are renamed into their descriptive forms using the associations provided in activity_labels.txt

```r
req_data<-transform(req_data,Activity=factor(Activity,levels=c(1:6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))
```
# Part 4
## Descriptive names for features
The names of the features in the XTrain and XTest dataset are present in features.txt. These are first extracted

```r
feature_names<-read.table('./UCI HAR Dataset/features.txt',sep=" ",colClasses=c("numeric","character"))
```
Of these, the feature names of interest, i.e the ones with mean or std measurement, are extracted out

```r
req_feature_names<-feature_names[req_inds,"V2"]
```
Labeling the final dataset (req_data) with the appropriate feature names; The first column is Subject, and second column 
is Activity, both of which were named earlier itself. All the other columns are renamed using the feature names extracted

```r
names(req_data)[-c(1:2)]<-req_feature_names
```
# Part 5
## Final tidy data set
First the required packages are loaded

```r
library(plyr)
library(dplyr)
```
The final data set is created by calculating the average of each of the 79 features for each activity and each subject. 
This new tidy dataset will contain 180 rows corresponding to 6 types of activity for each of the 30  subjects, each of the row containing 81 columns - 2 columns corresponding to the subject and the activity, and 79 columns corresponding to average of each of the features for that activity, for that subject

```r
req_data_grpsubact<-ddply(req_data,c("Subject","Activity"),function(x) colMeans(x[,-c(1:2)]))
write.table(req_data_grpsubact,file='FINAL_tidydata.txt',sep="\t",quote = F,row.names =F)
```
The final data set is written to the FINAL_tidydata.txt file. This can be read into R using 

```r
read.table('FINAL_tidydata.txt',sep='\t',header=T)
```
A detailed description of the variables in this FINAL_tidydata.txt is given in the codebook.md file.
