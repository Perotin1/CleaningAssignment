# Getting and Cleaning Data Course Project Submission:

This is my submission for the Getting and Cleaning Data Course Project.

The Source Dataset, its README and Codebooks are found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#### This repository contains 4 files:
1. README.md - This README
2. run_analysis.R - an R script
3. UCI_HAR_summary.txt - The tidy data 
4. Codebook.md - A codebook for UCI_HAR_summary.txt

#### run_analysis.R

run_analysis.R requires the R package "reshape" and its dependencies to be installed in order to function, and will install it and them if they are not. When sourced it defines a function run_analysis() which should be called within the working directory "UCI HAR Dataset", the top level directory of the source dataset when downloaded and extracted from the link above. 

The input data for run_analysis from the Source Dataset are X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt, features.txt, and activity_labels.txt.

X_train and X_test are files containing vectors of the time and frequency features calculated from the raw acceleration and angular velocity data, where each row is a vector of one observation of all the values. The _train and _test suffixes represent an arbitrary splitting of the observations into two sets by subject number in the Source Dataset.

y_train and y_test are files containing row-for-row identifiers of the activity being performed in each observation in X_train and X_test. These identifiers are numeric, and activity_labels.txt is a key to them

subject_train and subject_test are files containing row-for-row identifiers of the subject of each observation in X_train and X_test

features.txt is a file that identifies the feature variable that each column of X_train and X_test refers to, which are explained in the file features_info.txt in the Source Dataset

X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt are found in the Source Dataset within the train and test directories respectively, which contain "Inertial Signals" subdirectories containing the raw data. The other files are found in the "UCI HAR Dataset" top-level directory.

When run_analysis() is called, it: installs, where necessary, and then sources the package "reshape"; creates a tidy data set and writes it to UCI_HAR_summary.txt, in the working directory, using write.table with row.names = FALSE and default parameters otherwise.

Process: 
1. It merges X_train and X_test data sets X together, adds a variable for activity from y_train and y_test which takes descriptive values from activity_labels.txt, and a variable for subject from subject_train and subject_test, and labels columns for all the feature variables using features.txt
2. creates a new dataset with only the variables relating to the mean and standard deviation of each measurement. From the Source Dataset codebook features_info.txt, we determined the measurements to be:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
	
where prefixes f- and t- denote frequency and time derived variables, the suffix -XYZ indicates a distinct measurement for the X, Y, and Z direction for each observation i.e. a distinct variable, and Body, Gravity, Accel, Gyro denote variables as referring to body motion and gravity, and the acceleration and angular velocity due to those respectively. The derivation of these variables is more completely specified in features_info.txt in the Source Data directory. The mean and standard deviation variables of these measurements are denoted by elements which contain -mean() and -sd() in features.txt. A variable meanFreq() is also calculated for frequency-derived variables, but we considered this not a recognisable mean of any of these measurements, so run_analysis.r does not include any -meanFreq() variables. So these 66 variables are extracted to a separate data frame, along with subject and activity index columns.

3. takes the average of every subset formed by a subject-activity pair of each mean and each standard deviation variable i.e. 30 subjects * 6 activities = 180 averages of each variable.
4. the data is melted to produce a skinnier dataset, so that measurement ID is treated as a variable. This is tidy for 2 reasons: The measurements are calculated from the same Raw Data, so it is sensible to treat the measurement as variable; The measurements are all normalised to take values within the interval [-1,1]
5. outputs this dataset to UCI_HAR_summary.txt using write.table with parameter row.names = FALSE and default values otherwise.


#### UCI_HAR_summary.txt 
The Tidy Data Set

#### Codebook.md 
A codebook that describes the process that run_analysis.R takes to produce UCI_HAR_summary.txt, its interactions with the source data, the structure of UCI_HAR_summary.txt, and the Source Data as it relates to the tidy data.
