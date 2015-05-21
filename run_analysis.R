#read the files and input the data frame into testset and trainset

testset <- read.fwf(file = "./data/UCI HAR Dataset/test/X_test.txt");
trainset <- read.fwf(file = "./data/UCI HAR Dataset/train/X_train.txt");


#append the label of "test" and "train" at the end of the file respectively

testset = cbind(testset , label = "test");
trainset = cbind(trainset , label = "train");

#read merge the data sets into one dataframe called overall set
overallSet = mapply(cbind, testset, trainset, SIMPLIFY=TRUE);

#extract the mean and standard deviations
overallSet = rbind(means = colMeans(overallSet))

library(matrixStats)
overallSet = rbind(std = colSds(matrixStats))

#read the activity labels and merge them
activitylabels <- read.table(file = "./data/UCI HAR Dataset/activity_labels.txt");
trainLabels <-read.table(file = "./data/UCI HAR Dataset/y_train.txt")
testLabels <-read.table(file = "./data/UCI HAR Dataset/y_test.txt")

#add the names to the columns in the activity labels
trainLabels = cbind(trainLabels, activity_label = activitylabels$V2);
testLabels = cbind(testLabels, activity_label = activitylabels$V2);

