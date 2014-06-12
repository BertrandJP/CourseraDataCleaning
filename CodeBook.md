### Description

This program reads data from UCI HAR Dataset. It merges train and test data. It also builds a new data set that contains the mean values by subject / activity of all the variables that correspond to mean ans standard deviation measures. That data set is saved locally in csv format.

### Code Book: Files description

We will only use 5 types of files from the dataset (fixed length files):
1) test/x_test.txt and train/subject/x_train.txt, that contains all the individual observations
2) test/subject_test.txt and train/subject_train.txt, that contains the subject IDs associated to each observation
3) test/y_test.txt and train/subject/y_train.txt, that contains the activity IDs associated to each observation
4) activity_labels.txt, that gives the signification of activity IDs contained in the y_test and y_train files
5) features.txt, that contains the name of all the variables contained in the x_test and x_traib files

We will generate only one output file (coma delimited file):
1) result.txt, that contains the mean values by subject / activity of all the variables that correspond to mean ans standard deviation measures

### Code Book: Variables description


## Input variables in x files

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

## Output variables in output file

The first two variables are:
* Activity: Description of the performed activity
* Subject: ID of the subject for which the observations were performed

All the following variables correspond to the mean values of all observations made for a given couple of Activity/Subject of the following variables:
* mean(): Mean value
* std(): Standard deviation

that were estimated for these signals : 
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

### Study Design

After downloading and unzipping the data set, and loading the input files, we performed the following actions:
1. Merge train and test data
2. Transform data in data frames
3. Name variables for subject and y data
4. Name x variables by using names contained in features.txt	
5. Find out which variable names of x correspond to mean() and std() functions. Keep only the corresponding columns
6. Transform y in a factor, in order to establish a correspondence between activity IDs and labels, by using the correspondence contained in activity_labels.txt
7. Use the aggregate fonction to calculate the mean values of all the selected variables by Activiyt and by Subject. Save the result locally in coma delimited format.


