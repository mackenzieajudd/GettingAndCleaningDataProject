## Variables

### X
The X dataset composed of both X_test.txt and X_train.txt data

### Y
The Y dataset composed of both Y_test.txt and Y_train.txt data

### features
A vector af all features in features.txt

### extractIndexes
All indexes of the features vector with entries contining either "mean" or "std"

### extractMeasurementsX
A reformatted version of X with only entries from the indexes in extractIndexes

### sortedY
Y with an added column, order, of integers representing the order of the vector

### activities
A vector of activity names from activity_labels.txt

### namedActivities
A modified vector of Y with both the activity number and name

### variableNames
A vector af all features in features.txt

### extractedNames
Variable names at the indexes specified by extractIndexes

### names
All names for the final dataset including "Activity"

### finalDataSet
Final dataset with all names and activity labels

### meltedDataset
The melted finalDataset with all columns and the Activity column as ID

### tidyDataSet
The tidy dataset with means of all columns by Activity type