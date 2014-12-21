##Getting & Cleaning Data - Course Project

**Info**

This project performs analysis on the "Human Activity Recognition Using Smartphones" data set: 

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Instructions**

The script required the reshape2 package.

Before running the script (run_anlysis.R), edit the script and change the "projectDir" to suit your environment (line 13).

EX: projectDir = "~/Coursera/Getting_and_Cleaning_Data/CourseProject"

The output of the R script is a text file of the created tidy data set, tidy.txt.

**Anlysis Performed by the run_anlysis.R Script**

1. All of the data files were read into data frames, descriptive column headers were added, and the training and test sets were combined into a single data set.
2. All feature columns were removed that did not contain the exact string "mean()" or "std()".
4. A tidy data set was created containing the mean of each feature for each subject and each activity. 
5. The tidy data set was output to a text file, "tidy.txt".
