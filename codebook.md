This documents how the function runanalysis within the run_analysis.R file works:

1. Loads required packages: plyr and dplyr
2. Loads four different types of data: 
  a. fact data (experiments within the x_train and x_test source files)
  b. Test labels / activities performed by subjects observed as part of this experiment
  c. Subject data: Who among the 30 users was observed in each of the records in the Fact data
  --- For each of these three first datasets, a training and a test partition was reunited using rbind() function
  d. Activity labels - same for training and testing datasets, so loaded once.
  e. Features labels - description of the 561 variables measured in and/or derived from the experiment for each observation

3. After loading the features, we converted abbreviated names found in code into tidy ones (i.e.: properly explicit to ease natural reading)
4. At documented "Stage 2" in the code, the features / fact data is complemented with the list of subjects that performed each, then with the activity identificator and finally merged with explicit activity names.
5. Documented "Stage 3" in the code performs the renaming of the features dataset according to the tidy names described in the previous step.
6. Columns containing means and standard deviations were kept, aside the recently added "subject" and "activity" ones. All the rest were dropped.

The tidy dataset had 10299 observations of 89 variables, down from the original 561 provided as raw data from the experiment.
7. We wrote the results in a data table in the working directory under "tidyData.txt" file.

8. Stage 5 in documented code created the requested summary of the tidy dataset. Such summary is an average of all columns in the original features dataset by subject and activity.
9. Such summary, as requested, is written without row names in a file named "summary-output.txt" in the working directory.

Created by: Edgar Nunez, 2016.
