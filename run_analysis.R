# 1
# Merges the training and the test sets to create one data set

testX <- read.table(".\\test\\X_test.txt")
testY <- read.table(".\\test\\Y_test.txt")
trainX <- read.table(".\\train\\X_train.txt")
trainY <- read.table(".\\train\\Y_train.txt")
X <- rbind(trainX, testX)
Y <- rbind(trainY, testY)

# 2
# Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table(".\\features.txt")
extractIndexes <- grep("mean|std", features[,2])
extractedMeasurementsX <- X[,extractIndexes]
sortedY <- Y
sortedY$order <- 1:nrow(Y)

# 3
# Uses descriptive activity names to name the activities in the data set
activities <- read.table(".\\activity_labels.txt")
namedActivities <- merge(activities, sortedY, by.x="V1", by.y="V1", sort=FALSE)
namedActivities <- namedActivities[order(namedActivities$order),]
extractedMeasurementsX$Activity <- namedActivities$V2

# 4
# Appropriately labels the data set with descriptive variable names
variableNames <- read.table(".\\features.txt")
extractedNames <- as.vector(variableNames[extractIndexes, 2])
names <- c(extractedNames, "Activity")
finalDataSet <- extractedMeasurementsX
names(finalDataSet) <- names

# 5
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
meltedDataset <- melt(finalDataSet, id=c("Activity"), measure.vars=extractedNames)
tidyDataSet <- dcast(meltedDataset, Activity ~ variable, mean)
tidyDataSet