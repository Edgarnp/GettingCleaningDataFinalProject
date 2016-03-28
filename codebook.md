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

The tidy dataset had 10299 observations of 89 variables, down from the original 561 provided as raw data from the experiment. An extended description of the variables included in the dataset is hereby extracted literally from the features_info.txt file provided within the raw data's zip file under study:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation"

7. We wrote the results in a data table in the working directory under "tidyData.txt" file.

8. Stage 5 in documented code created the requested summary of the tidy dataset. Such summary is an average of all columns in the original features dataset by subject and activity.
9. Such summary, as requested, is written without row names in a file named "summary-output.txt" in the working directory.

Created by: Edgar Nunez, 2016.
