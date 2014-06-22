## Explanation of run_analysis.R by Part

### Part 1 - Merges the training and the test sets to create one data set

Script reads in both the test and train datasets for X and Y and creates two new datasets, X and Y, from the test and train data sets.

### Part 2 - Extracts only the measurements on the mean and standard deviation for each measurement

Script reads all feature names into a vector and greps indexes with names containing either "mean" or "std". A new vector is created with only the X values at these indexes. An extra column of incrementing numbers is added to Y to preserve its order in later steps.

### Part 3 - Uses descriptive activity names to name the activities in the data set

Script reads all activity names into a new vector. activities is merged with the ordered Y by their "v1" column. The new activities vector is then re-ordered by the ordered column that was added in part 2. The named activities column is then added to the extracted X table created in part 2.

### Part 4 - Appropriately labels the data set with descriptive variable names

All variable names are read in and only those at the indexes found in part 2 are kept. The "Activities" name is added to the newly created names vector and the names of the data set is set to the new names vector.

### Part 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The named data set created in part 4 is melted down by Activity and dcast on Activity with the mean function getting the mean of every column by Activity.