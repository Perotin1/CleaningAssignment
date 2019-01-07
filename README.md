# Getting and Cleaning Data Course Project Submission:

This is my submission for the Getting and Cleaning Data Course Project.

The Source Dataset, its README and Codebooks are found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This repository contains 4 files:
README.md - This README
run_analysis.R - an R script
UCI_HAR_summary.txt - The tidy data 
Codebook.md - A codebook for UCI_HAR_summary.txt

## run_analysis.R requires the R package "reshape" and its dependencies to be installed in order to function, and will install it and them if they are not. When sourced it defines a function run_analysis() which should be called within the working directory "UCI HAR Dataset", the top level directory of the source dataset when downloaded and extracted from the link above. It can be sourced and called to produce UCI_HAR_summary.txt using R 3.5.2.
run_analysis.R performs the following tasks:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Specific functionality of run_analysis.R is outlined in Codebook.md, as per Jeff Leek(1) and DDIAlliance(2).

## UCI_HAR_summary.txt - The Tidy Data Set

## Codebook.md - A codebook that describes the process that run_analysis.R takes to produce UCI_HAR_summary.txt, its interactions with the source data, the structure of UCI_HAR_summary.txt, and the Source Data as it relates to the tidy data.

### What to include in the README and codebook was based on:
1. "How to Share Data with a Statistician", Jeff Leek, 2013 (http://blogs.biomedcentral.com/bmcblog/2013/11/26/how-to-share-data-with-a-statistician/)
2. "Create a Codebook", The Data Documentation Initiative Alliance (http://www.ddialliance.org/training/getting-started-new-content/create-a-codebook)