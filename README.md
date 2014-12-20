GettingAndCleaningData
======================

Introduction
============
The repository contains my course project for the Coursera Data Science class, Getting and Cleaning Data.

About the raw data
------------------

The features are unlabeled and can be found in the X_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set.

About the script and the tidy dataset
-------------------------------------
The project called for a script called run_analysis.R which will merge the test and training sets together.

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

