# getting-and-cleaning-data-course-project
#Data analysis (course project)

The run_analysis.R is aimed to merge, organize, extract, and analysis the data offered by the "getting nad cleaning data" online course.

It merges train and test set as well as activity (labels) and subject (ID of the person who carried out the data) into one dataset. 

The variables are named after feature.txt, and the activity is factorized and labled based on activity_labels.txt. 
From all the 561 variables, the variables whose names contain "mean" and "sd" are selected out (P.S. In the second step in the project guidance "Extracts only the measurements on the mean and standard deviation for each measurement", the identification of the measurements is a bit vague. I am not sure if it means the variables or not).

After extraction there are only 79 varaibles left. Then add labels and subject to the dataset.

In the aggregation step, the mean values of all the numeric variables are calculated and grouped by two variables "subject" and "labels". 180 records are returned.

Finally the new dataset is written into average.txt file.

Oct. 10 2015
Renfang Liao
