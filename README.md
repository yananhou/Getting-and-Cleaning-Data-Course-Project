---
title: "README"
author: "Yanan Hou"
date: "July 17, 2017"
---

# Coursera Getting and Cleaning Data Course Project

This repository is for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.


# Overview

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis. In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

- README.md, which provides an overview of the data set and how it was created.
- tidy_data.txt, which contains the data set.
- CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data set).
- run_analysis.R, the R script that was used to create the data set.


# Making Modifications to This Script

Once you have obtained and unzipped the source files, you will need to make one modification to the R file before you can process the data. Note that on line 26 of run_analysis.R, you will set the path of the working directory to relect the location of the source files in your own directory.


# Project Summary

The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Additional Information

You can find additional information about the variables, data and transformations in the CodeBook.md file.