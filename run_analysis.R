
#function to install and load a list of packages
test_and_load.packages = function (packagesList, load=TRUE) {
  for (pkg in packagesList) {
    if (!is.element(pkg, installed.packages()[,1])) {
      install.packages(pkg)
    }
    if (load) { library(pkg, character.only=TRUE) }
  }
}

#load useful packages
test_and_load.packages(c("data.table", "LaF"), TRUE)

#download zip file if run for the first time
if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip", destfile="./getdata_projectfiles_UCI HAR Dataset.zip")
}

#unzip files if run for the first time
if (!file.exists("UCI HAR Dataset")) {
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}

#read test dataset. For x_test, we use the LaF package
subject_test = fread("UCI HAR Dataset/test/subject_test.txt")
x_test = laf_open_fwf("UCI HAR Dataset/test/X_test.txt", column_types=rep("double", 561), column_widths=rep.int(16,561))
x_te = x_test[,] #converts x_test to data frame
y_test = fread("UCI HAR Dataset/test/y_test.txt")

#read train dataset
subject_train = fread("UCI HAR Dataset/train/subject_train.txt")
x_train = laf_open_fwf("UCI HAR Dataset/train/X_train.txt", column_types=rep("double", 561), column_widths=rep.int(16,561))
x_tr = x_train[,]
y_train = fread("UCI HAR Dataset/train/y_train.txt")

#merge train and test datasets
subject = rbind(subject_train, subject_test)
x = rbind(x_tr, x_te)
y = rbind(y_train, y_test)

#clear memory of unused variables
rm(subject_train, subject_test, x_te, x_tr, y_test, y_train, x_test, x_train)

#transform data tables in data frames 
subject = as.data.frame(subject)
y = as.data.frame(y)
names(subject) = c("Subject")
names(y)=c("Activity")


features = fread("UCI HAR Dataset/features.txt") #read variable names
names(x) = features$V2 #use variable names as headers of x

vmean = grep("mean\\(\\)", names(x)) #find indexes of variable names containing "mean()"
vstd = grep("std\\(\\)", names(x)) #find indexes of variable names containing "std()"
v = sort(c(vmean, vstd)) 
x = subset(x, select=v) #select only the mean and std variables
rm(vmean, vstd, v)

#read activity labels
ActLabels = fread("UCI HAR Dataset/activity_labels.txt")
ActLabels = as.data.frame(ActLabels)

#add labels to activities of observations
y$Activity = factor(y$Activity, levels = as.character(ActLabels$V1), labels = ActLabels$V2)

#Group x, y, and subject
#conso=cbind(subject, y2, x2)

#Create a second, independent tidy data set
# with the average of each variable for each activity and each subject.
agg = aggregate(x=x, by=list(y$Activity, subject$Subject), FUN="mean")
write.csv(agg, file="result.txt", row.names=FALSE) #write result to csv file
