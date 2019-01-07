# Codebook for UCI_HAR_summary.txt

### Source Dataset:

Full Source Dataset, README, and Codebooks available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#### Human Activity Recognition Using Smartphones Dataset
#### Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The README describes the method for choosing the variables from the feature vectors and summarizing them to arrive at the measurement choice and average values given in UCI_HAR_summary.txt.

Full Information on the Source Dataset as a whole can be found using the README included with it, when sourced from the link above.

### This codebook will discuss the aspects of the Source Data that relate to the summarizing script and the tidy summary data.

## UCI_HAR_summary.txt:
The Dataset has 4 columns: activity; subject_number; measurement; average_value. It is sorted by activity and then by ascending subject_number.

##### activity: 

The activity subject was observed performing during averaged observations. Takes 6 unique values, and the dataset is sorted in the order given here: laying; sitting; standing; walking; walking_downstairs; walking_upstairs

##### subject_number: 

Which subject was observed for the averaged observations. Takes unique values in range 1, 2, ..., 30

##### measurement: 

Which Normalized measurement was averaged across observations of an activity-subject pairing. Takes values:
tBodyAcc-mean()-X;
tBodyAcc-mean()-Y;
tBodyAcc-mean()-Z;
tBodyAcc-std()-X;
tBodyAcc-std()-Y;
tBodyAcc-std()-Z;
tGravityAcc-mean()-X;
tGravityAcc-mean()-Y;
tGravityAcc-mean()-Z;
tGravityAcc-std()-X;
tGravityAcc-std()-Y;
tGravityAcc-std()-Z;
tBodyAccJerk-mean()-X;
tBodyAccJerk-mean()-Y;
tBodyAccJerk-mean()-Z;
tBodyAccJerk-std()-X;
tBodyAccJerk-std()-Y;
tBodyAccJerk-std()-Z;
tBodyGyro-mean()-X;
tBodyGyro-mean()-Y;
tBodyGyro-mean()-Z;
tBodyGyro-std()-X;
tBodyGyro-std()-Y;
tBodyGyro-std()-Z;
tBodyGyroJerk-mean()-X;
tBodyGyroJerk-mean()-Y;
tBodyGyroJerk-mean()-Z;
tBodyGyroJerk-std()-X;
tBodyGyroJerk-std()-Y;
tBodyGyroJerk-std()-Z;
tBodyAccMag-mean();
tBodyAccMag-std();
tGravityAccMag-mean();
tGravityAccMag-std();
tBodyAccJerkMag-mean();
tBodyAccJerkMag-std();
tBodyGyroMag-mean();
tBodyGyroMag-std();
tBodyGyroJerkMag-mean();
tBodyGyroJerkMag-std();
fBodyAcc-mean()-X;
fBodyAcc-mean()-Y;
fBodyAcc-mean()-Z;
fBodyAcc-std()-X;
fBodyAcc-std()-Y;
fBodyAcc-std()-Z;
fBodyAccJerk-mean()-X;
fBodyAccJerk-mean()-Y;
fBodyAccJerk-mean()-Z;
fBodyAccJerk-std()-X;
fBodyAccJerk-std()-Y;
fBodyAccJerk-std()-Z;
fBodyGyro-mean()-X;
fBodyGyro-mean()-Y;
fBodyGyro-mean()-Z;
fBodyGyro-std()-X;
fBodyGyro-std()-Y;
fBodyGyro-std()-Z;
fBodyAccMag-mean();
fBodyAccMag-std();
fBodyBodyAccJerkMag-mean();
fBodyBodyAccJerkMag-std();
fBodyBodyGyroMag-mean();
fBodyBodyGyroMag-std();
fBodyBodyGyroJerkMag-mean();
fBodyBodyGyroJerkMag-std();

where prefixes f- and t- denote frequency and time derived variables, the suffix -XYZ indicates a distinct measurement for the X, Y, and Z direction for each observation, and Body, Gravity, Accel, Gyro denote variables as referring to body motion and gravity, and the acceleration and angular velocity due to those respectively, and mean() and sd() refer to mean and standard deviation variables of the specified quantity. The derivation of these variables is more completely specified in features_info.txt in the Source Data directory. 

##### average_value: 

Average of the given Normalised measurement for a given activity-subject pairing. Takes values in the interval [-1,1]

The Dataset has 11880 observations of 4 variables. This corresponds to 180 observations of each measurement. It can be read into R with read.table with parameter header = TRUE and default values otherwise.
