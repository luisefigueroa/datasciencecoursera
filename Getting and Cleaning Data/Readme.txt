About the files found in the GIT repo located at https://github.com/luisefigueroa/datasciencecoursera/tree/master/Getting%20and%20Cleaning%20Data.

The run_analysis.R script consolidates all the steps required to load the different data sets from the Human Activity Recognition Using Smartphones Data Set found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
into one consolidated data set with subject IDs for each observation as well as proper labels for the activity performed during the measurements taken on each observation as well as proper naming of all variables. The final step of the script aggregates all observations by subject id and activity and calculates the mean for each variable. 

Only the run_analysis.R script is required for this analysis.

The Code Book briefly refers to the source files that describe the original experiment and describes how the script works as well as the variables found in the output data set.

Finally the sensorAverages.txt contains the output of the run_analysis.R script when run against the data collected in the Activity Recognition Using Smartphones Data Set.

