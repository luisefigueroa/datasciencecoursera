The run_analysis.R script performs 5 high level steps.

Step 0 reads the files listed below into data frame objects in memory:

Activity_labels.txt
Features.txt
Subject_test.txt
X_test.txt
Y_test.txt
X_train.txt
Y-train.txt

In this step the data from the features file is also converted into a vector named featuresVector. The featuresVector is used to properly name the variables from the X_test and X_train data sets containing of the observations. 

Step 1 uses the cbind and rbind functions to combine the different data sets for test and training observations and then it combines those into the sensorData super set containing all the observations from all files as well as the corresponding activity id. cbind and rbind functions where used to leverage the fact that the data in the source files is sorted as arrays where the first row of the Y_activity and subject files corresponded to the IDs for the first row of the X_activity files for both the train subset and the test subsets.

Step 2 extracts only the variables that included the mean() and std() substrings in their name while preserving the ActivityID and subjectID.

Step 3 uses the merge command to do the equivalent of a join operation between the sensorData and the activity_labels data in order to add the activity labels to the sensorData super set.

Step 4 of the project instructions was to appropriately able the variables. This was done in step 0 when the data was loaded. 

Step 5 Creates a second data set named sensorAverages from the sensorData that aggregates the observations by activity and subject and produces the mean for all the variables. Finally it writes it uses the write.table function to write the sensorAverages data set to disk.