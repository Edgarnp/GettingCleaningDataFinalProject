runanalysis<-function(){
  require("plyr","dplyr")
  #STAGE 1: File loading stage
  #Changing working directory
  setwd("C:/Users/Ed/Box Sync/Coursera/UCI HAR Dataset")
  
  #Load fact data
  x_train<-read.table("train/X_train.txt")
  x_test<-read.table("test/X_test.txt")
  x<-rbind(x_train, x_test)
  rm(x_train, x_test)
  #Names will be defined later
  
  #Load test labels
  y_train<-read.table("train/y_train.txt")
  y_test<-read.table("test/y_test.txt")
  activity<-rbind(y_train,y_test)
  rm(y_train, y_test) #Housekeeping
  names(activity)<-"activityID"
  
  #Load subject data
  subject_train <-read.table("train/subject_train.txt")
  subject_test <- read.table("test/subject_test.txt")
  subject <- rbind(subject_train, subject_test)
  rm(subject_train, subject_test)
  names(subject)<-"subject"
  
  #Load activity labels
  activity_labels<-read.table("activity_labels.txt")
  names(activity_labels)<-c("activityID","activity")
  
  #Load features (x labels)
  features <- read.table("features.txt")
  names(features)<-c("featureID","feature")
  features$feature<-as.character(features$feature)
  View(features)
  #Replacing names with tidy ones
  tidyFeatures<-data.frame(search_for = c("^t", "^f", "Acc", "Gyro", "Mag", "BodyBody"),
                           replace_with = c("time","frequency","Accelerometer","Gyroscope","Magnitude","Body"))
  for (tf in 1:nrow(tidyFeatures)) features$feature <- with(tidyFeatures[tf,],gsub(search_for,replace_with,features$feature))
  names(x)<-features$feature
  
  #STAGE 2: Data merging across datasets
  
  x<- cbind(x,subject)
  x<- cbind(x,activity)
  x<- join(x,activity_labels,"activityID")
  
  #STAGE 3: Selecting from the total dataset the Mean and STD columns
  x.names<-as.data.frame(names(x))
  names(x.names)<-"names"
  x.names$cols_to_keep<-regexpr("[Mm]ean|[Ss]td|subject|activity",x.names$names) !=-1
  x<-x[,x.names$cols_to_keep]
  
  #STAGE 5: Create a summary by activity and subject
  x.summary<-aggregate(.~subject + activity, x, mean)
  x.summary<-x.summary[order(x.summary$subject,x.summary$activity),]
  write.table(x.summary,file="summary-output.txt", row.names = F)
}