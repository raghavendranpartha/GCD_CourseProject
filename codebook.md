# codebook
Description
===========
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities ('WALKING', "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data, present in train and test folders respectively

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


t Signal          | # variables
------------------|-------------
tBodyAcc-XYZ      |	3 variables
tGravityAcc-XYZ	  |	3 variables
tBodyAccJerk-XYZ	|	3 variables
tBodyGyro-XYZ	    |	3 variables
tBodyGyroJerk-XYZ	|	3 variables
tBodyAccMag	      |	1 variable
tGravityAccMag	  |	1 variable
tBodyAccJerkMag	  |	1 variable
tBodyGyroMag	    |	1 variable
tBodyGyroJerkMag	|	1 variable
Total 	          |	20 variables



f signal          | # variables
------------------|-------------
fBodyAcc-XYZ      |	3 variables
fBodyAccJerk-XYZ	|	3 variables
fBodyGyro-XYZ	    |	3 variables
fBodyAccMag	      |	1 variable
fBodyAccJerkMag	  |	1 variable
fBodyGyroMag	    |	1 variable
fBodyGyroJerkMag	|	1 variable	
Total	            |	13 variables

Notes: 
======
There are a total 561 features that were estimated from these variables in the original dataset

In the original dataset, features are normalized and bounded within [-1,1].

The set of features of interest in this project that were estimated from each of these signals are: 
mean(): Mean value
std(): Standard deviation

For the frequency variables (ones starting with f), in addition to the above mean() and std(), the following is also estimated:

meanFreq(): Weighted average of the frequency components to obtain a mean frequency


Thus, we have 20x2 = 40 variables corresponding to t signals and 
              13x3 = 39 variables corresponding to f signals.
In total, we have 79 variables.

In addition to these 79 variables, we also have the ID of the subject of these measurements, and the activity during the measurement.
Thus overall in this dataset we have 81 variables.

Transformation
==============

The first step in transforming the original dataset is to merge the test and train data into one dataset.
For test and train data, we have three types of data - X (feature vector), y (Activity label) and subject Id.
The three types of data within test and train are first combined column-wise to yield a 561+1+1 = 563 column dataset.
The train data consists of 7352 rows, and test data 2947 rows

This new test and train dataset are then merged row-wise to yield a merged dataset of dimensions 10299 rows vs 563 columns

The features corresponding to the 79 variables described in the previous section are then extracted out, along with the activity descriptions and the subject ID.

The final modified dataset generated in FINAL_tidydata.txt contains 180 rows corresponding to 6 types of activity for each of the 30 subjects, each of the row containing 81 columns - 2 columns corresponding to the subject and the activity, and 79 columns corresponding to *average* of each of the features for that activity, for that subject. 

The data is in wide-form tidy data, as each row corresponds to one subject, and each column corresponds to only one variable.

Variables
=========

1. tBodyAcc-mean()-X
    + Description: Normalized mean body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
2.	tBodyAcc-mean()-Y
    + Description: Normalized mean body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
3.	tBodyAcc-mean()-Z
    + Description: Normalized mean body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
4.	tBodyAcc-std()-X
    + Description: Normalized standard deviation of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
5.	tBodyAcc-std()-Y
    + Description: Normalized standard deviation of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
6.	tBodyAcc-std()-Z
    + Description: Normalized standard deviation of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
7.	tGravityAcc-mean()-X
    + Description: Normalized mean of gravity acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
8.	tGravityAcc-mean()-Y
    + Description: Normalized mean of gravity acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
9.	tGravityAcc-mean()-Z
    + Description: Normalized mean of gravity acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
10.	tGravityAcc-std()-X
    + Description: Normalized standard deviation of gravity acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
11.	tGravityAcc-std()-Y
    + Description: Normalized standard deviation of gravity acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
12.	tGravityAcc-std()-Z
    + Description: Normalized standard deviation of gravity acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
13.	tBodyAccJerk-mean()-X
    + Description: Normalized mean of time derivative of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
14.	tBodyAccJerk-mean()-Y
    + Description: Normalized mean of time derivative of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
15.	tBodyAccJerk-mean()-Z
    + Description: Normalized mean of time derivative of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
16.	tBodyAccJerk-std()-X
    + Description: Normalized standard deviation of time derivative of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
17.	tBodyAccJerk-std()-Y
    + Description: Normalized standard deviation of time derivative of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
18.	tBodyAccJerk-std()-Z
    + Description: Normalized standard deviation of time derivative of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
19.	tBodyGyro-mean()-X
    + Description: Normalized mean of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
20.	tBodyGyro-mean()-Y
    + Description: Normalized mean of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
21.	tBodyGyro-mean()-Z
    + Description: Normalized mean of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
22.	tBodyGyro-std()-X
    + Description: Normalized standard deviation of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
23.	tBodyGyro-std()-Y
    + Description: Normalized standard deviation of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
24.	tBodyGyro-std()-Z
    + Description: Normalized standard deviation of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
25.	tBodyGyroJerk-mean()-X
    + Description: Normalized mean of time derivative of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
26.	tBodyGyroJerk-mean()-Y
    + Description: Normalized mean of time derivative of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
27.	tBodyGyroJerk-mean()-Z
    + Description: Normalized mean of time derivative of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
28.	tBodyGyroJerk-std()-X
    + Description: Normalized standard deviation of time derivative of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
29.	tBodyGyroJerk-std()-Y
    + Description: Normalized standard deviation of time derivative of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
30.	tBodyGyroJerk-std()-Z
    + Description: Normalized standard deviation of time derivative of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
31.	tBodyAccMag-mean()
    + Description: Normalized mean of body acceleration measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
32.	tBodyAccMag-std()
    + Description: Normalized standard deviation of magnitude of body acceleration measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
33.	tGravityAccMag-mean()
    + Description: Normalized mean of gravity acceleration measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
34.	tGravityAccMag-std()
    + Description: Normalized standard deviation of gravity acceleration measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
35.	tBodyAccJerkMag-mean()
    + Description: Normalized mean of magnitude of time derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
36.	tBodyAccJerkMag-std()
    + Description: Normalized mean of standard deviation of time derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
37.	tBodyGyroMag-mean()
    + Description: Normalized mean of magnitude of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
38.	tBodyGyroMag-std()
    + Description: Normalized standard deviation of magnitude of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
39.	tBodyGyroJerkMag-mean()
    + Description: Normalized mean of magnitude of time-derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
40.	tBodyGyroJerkMag-std()
    + Description: Normalized standard deviation of magnitude of time-derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
41.	fBodyAcc-mean()-X
    + Description: Normalized mean of FFT of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
42.	fBodyAcc-mean()-Y
    + Description: Normalized mean of FFT of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
43.	fBodyAcc-mean()-Z
    + Description: Normalized mean of FFT of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
44.	fBodyAcc-std()-X
    + Description: Normalized standard deviation of FFT of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
45.	fBodyAcc-std()-Y
    + Description: Normalized standard deviation of FFT of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
46.	fBodyAcc-std()-Z
    + Description: Normalized standard deviation of FFT of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'  
47.	fBodyAcc-meanFreq()-X
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units 'Hz'  
48.	fBodyAcc-meanFreq()-Y
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units 'Hz'
49.	fBodyAcc-meanFreq()-Z
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units 'Hz'
50.	fBodyAccJerk-mean()-X
    + Description: Normalized mean of FFT of time derivative of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
51.	fBodyAccJerk-mean()-Y
    + Description: Normalized mean of FFT of time derivative of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
52.	fBodyAccJerk-mean()-Z
    + Description: Normalized mean of FFT of time derivative of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
53.	fBodyAccJerk-std()-X
    + Description: Normalized standard deviation of FFT of time derivative of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
54.	fBodyAccJerk-std()-Y
    + Description: Normalized standard deviation of FFT of time derivative of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
55.	fBodyAccJerk-std()-Z
    + Description: Normalized standard deviation of FFT of time derivative of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units/sec 'g/sec'
56.	fBodyAccJerk-meanFreq()-X
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of time derivative of body acceleration signal from the smartphone accelerometer X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units/sec 'Hz'
57.	fBodyAccJerk-meanFreq()-Y
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of time derivative of body acceleration signal from the smartphone accelerometer Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units/sec 'Hz'
58.	fBodyAccJerk-meanFreq()-Z
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of time derivative of body acceleration signal from the smartphone accelerometer Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units/sec 'Hz'
59.	fBodyGyro-mean()-X
    + Description: Normalized mean of FFT of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
60.	fBodyGyro-mean()-Y
    + Description: Normalized mean of FFT of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
61.	fBodyGyro-mean()-Z
    + Description: Normalized mean of FFT of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
62.	fBodyGyro-std()-X
    + Description: Normalized standard deviation of FFT of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
63.	fBodyGyro-std()-Y
    + Description: Normalized standard deviation of FFT of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
64.	fBodyGyro-std()-Z
    + Description: Normalized standard deviation of FFT of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
65.	fBodyGyro-meanFreq()-X
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of angular velocity measured by gyroscope in X axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units/sec 'Hz'
66.	fBodyGyro-meanFreq()-Y
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of angular velocity measured by gyroscope in Y axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units/sec 'Hz'
67.	fBodyGyro-meanFreq()-Z
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of angular velocity measured by gyroscope in Z axis; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units/sec 'Hz'
68.	fBodyAccMag-mean()
    + Description: Normalized mean of FFT of body acceleration magnitude measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
69.	fBodyAccMag-std()
    + Description: Normalized standard deviation of FFT of body acceleration magnitude measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: standard gravity units 'g'
70.	fBodyAccMag-meanFreq()
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of body acceleration magnitude measured by accelerometer; This is averaged across all observations for the subject performing the corresponding activity
    + Units: frequency units 'Hz'
71.	fBodyBodyAccJerkMag-mean()
    + Description: Normalized mean of FFT of magnitude of time derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
72.	fBodyBodyAccJerkMag-std()
    + Description: Normalized standard deviation of FFT of magnitude of time derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
73.	fBodyBodyAccJerkMag-meanFreq()
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT FFT of magnitude of time derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'Hz'
74.	fBodyBodyGyroMag-mean()
    + Description: Normalized mean of FFT of magnitude of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
75.	fBodyBodyGyroMag-std()
    + Description: Normalized standard deviation of FFT of magnitude of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec'
76.	fBodyBodyGyroMag-meanFreq()
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of magnitude of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'Hz'
77.	fBodyBodyGyroJerkMag-mean()
    + Description: Normalized mean of FFT of magnitude of time-derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
78.	fBodyBodyGyroJerkMag-std()
    + Description: Normalized mean of standard deviation of FFT of magnitude of time-derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'radians/sec^2'
79.	fBodyBodyGyroJerkMag-meanFreq()
    + Description: Normalized mean frequency obtained by weigthed average of frequency components from FFT of magnitude of time-derivative of angular velocity measured by gyroscope; This is averaged across all observations for the subject performing the corresponding activity
    + Units: 'Hz'
80. Subject
    + ID of the subject of the measurements. Ranges from 1 to 30
81. Activity
    + Activity during the measurement. Levels - ('WALKING', "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
