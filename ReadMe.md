To dos:
1. Merge the training and test data sets to create one data sets:
	- training set is contained in the file: UCI HAR Dataset/train/X_train.txt
	- test set is contained in the file: UCI HAR Dataset/train/X_test.txt
	- read the both the files into a list using data.table
	- add a new label to each train and test set: "train" and "test" respectively

```
	testset = cbind(testset , label = "test")
	trainset = cbind(trainset , label = "train")
```
	- merge the two datasets into one
```
		overallSet = mapply(cbind, testset, trainset, SIMPLIFY=FALSE)
```
	- write the merged data to a csv file
```
		write.csv(overallSet, file = ".~/UCI HAR Dataset/merge/mergedDataSet.csv")
```

2.Extract the mean and the standard deviation
	overallSets = rbind(means = colMeans(overallSet))

```
	library(matrixStats)
	overallSets = rbind(std = colSds(matrixStats))
```

3.Adding the labels by running the cbind command

```
    trainLabels = cbind(trainLabels, activity_label = activitylabels$V2);
    testLabels = cbind(testLabels, activity_label = activitylabels$V2);
```

4.Read the activity labels from the traiing and test files and merge them

```
	activitylabels <- read.table(file = "./data/UCI HAR Dataset/activity_labels.txt");
	trainLabels <-read.table(file = "./data/UCI HAR Dataset/y_train.txt")
	testLabels <-read.table(file = "./data/UCI HAR Dataset/y_test.txt")
```

5.add the names to the columns in the activity labels

```
	trainLabels = cbind(trainLabels, activity_label = activitylabels$V2);
	testLabels = cbind(testLabels, activity_label = activitylabels$V2);
```