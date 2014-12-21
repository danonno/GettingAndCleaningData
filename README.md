##Getting & Cleaning Data - Course Project

###Info

This project performs analysis on the "Human Activity Recognition Using Smartphones" data set: 

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Instructions

The script requires the reshape2 package.

Before running the script (run_anlysis.R), edit the script and change the "projectDir" to suit your environment (line 13).

EX: projectDir = "~/Coursera/Getting_and_Cleaning_Data/CourseProject"

The output of the R script is a text file of the created tidy data set, tidy.txt.

###Anlysis Performed by the run_anlysis.R Script

* Load both test and train data
* Load the features and activity labels.
* Extract the mean and standard deviation column names and data.
* Process the data. There are two parts processing test and train data respectively.
* Merge data set.
