# Codebook for run_analysis.R and UCI_HAR_summary.txt

## Source Dataset:

Full Source Dataset, README, and Codebooks available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Full Information on the Source Dataset as a whole can be found using the README included with it, when sourced from the link above.

This codebook will discuss the aspects of the Source Data that relate to the summarizing script and the tidy summary data.


## run_analysis.R:

run_analysis.R requires the R package "reshape" and its dependencies to be installed in order to function, and will install it and them if they are not. When sourced it defines a function run_analysis() which should be run within the working directory "UCI HAR Dataset", the top level directory of the source dataset when downloaded and extracted from the link above. 
The input data for run_analysis from the Source Dataset are X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt, features.txt, and activity_labels.txt.
X_train and X_test are files containing vectors of the time and frequency features calculated from the raw acceleration and angular velocity data, where each row is a vector of one observation of all the values. The _train and _test suffixes represent an arbitrary splitting of the observations into two sets by subject number in the Source Dataset.
y_train and y_test are files containing row-for-row identifiers of the activity being performed in each observation in X_train and X_test. These identifiers are numeric, and activity_labels.txt is a key to them
subject_train and subject_test are files containing row-for-row identifiers of the subject of each observation in X_train and X_test
features.txt is a file that identifies the feature variable that each column of X_train and X_test refers to, which are explained in the file features_info.txt in the Source Dataset
X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt are found in the Source Dataset within the train and test directories respectively, which contain "Inertial Signals" subdirectories containing the raw data. The other files are found in the "UCI HAR Dataset" top-level directory.

When run_analysis() is called, it: installs, where necessary, and then sources the package "reshape"; creates a tidy data set and writes it to UCI_HAR_summary.txt, in the working directory, using write.table with row.names = FALSE and default parameters otherwise.
Process: 
1. merges X_train and X_test data sets X together, adds a variable for activity from y_train and y_test which takes descriptive values from activity_labels.txt, and a variable for subject from subject_train and subject_test, and labels columns for all the feature variables using features.txt
2. creates a new dataset with only the variables relating to the mean and standard deviation of each measurement. From the Source Dataset codebook features_info.txt, we determined the measurements to be:
  *tBodyAcc-XYZ
  *tGravityAcc-XYZ
  *tBodyAccJerk-XYZ
  *tBodyGyro-XYZ
  *tBodyGyroJerk-XYZ
  *tBodyAccMag
  *tGravityAccMag
  *tBodyAccJerkMag
  *tBodyGyroMag
  *tBodyGyroJerkMag
  *fBodyAcc-XYZ
  *fBodyAccJerk-XYZ
  *fBodyGyro-XYZ
  *fBodyAccMag
  *fBodyAccJerkMag
  *fBodyGyroMag
  *fBodyGyroJerkMag
	where prefixes f- and t- denote frequency and time derived variables, the suffix -XYZ indicates a distinct measurement for the X, Y, and Z direction for each observation i.e. a distinct variable, and Body, Gravity, Accel, Gyro denote variables as referring to body motion and gravity, and the acceleration and angular velocity due to those respectively. The derivation of these variables is more completely specified in features_info.txt in the Source Data directory. The mean and standard deviation variables of these measurements are denoted by elements which contain -mean() and -sd() in features.txt. A variable meanFreq() is also calculated for frequency-derived variables, but we considered this not a recognisable mean of any of these measurements, so run_analysis.r does not include any -meanFreq() variables. So these 66 variables are extracted to a separate data frame, along with subject and activity index columns.
3. takes the average of every subset formed by a subject-activity pair of each mean and each standard deviation variable i.e. 30 subjects * 6 activities = 180 averages of each variable
4. the data is melted to produce a skinnier dataset, so that measurement ID is treated as a variable. This is tidy for 2 reasons: The measurements are calculated from the same Raw Data, so it is sensible to treat the measurement as variable; The measurements are all normalised to take values within the ae interval.
5. outputs this dataset to UCI_HAR_summary.txt using write.table with parameter row.names = FALSE and default values otherwise.

## UCI_HAR_summary.txt:
The Dataset has 4 columns: activity; subject_number; measurement; average_value. It is sorted by activity and then by subject_number.
activity: The activity subject was observed performing during averaged observations. Takes 6 unique values: laying; sitting; standing; walking; walking_downstairs; walking_upstairs
subject_number: Which subject was observed for the averaged observations. Takes unique values in range 1, 2, ..., 30
measurement: Which measurement was averaged across observations of an activity-subject pairing. Takes 66 unique values, specified above under run_analysis.R/process:
average_value: Average of the given Normalised measurement for a given activity-subject pairing. Takes values in the interval [-1,1]

The Dataset has 11880 observations of 4 variables. This corresponds to 180 observations of each measurement. It can be read into R with read.table with parameter header = TRUE and default values otherwise.
