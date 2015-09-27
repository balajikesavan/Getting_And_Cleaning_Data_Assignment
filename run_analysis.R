#installing required packages
package_names <- installed.packages()
package_names <- package_names[,1]

if(!("reshape" %in% package_names)){
  install.packages("reshape")
}
if(!("reshape2" %in% package_names)){
  install.packages("reshape2")
}

#loading the required libraries
library(reshape)
library(reshape2)

#Getting list of labels
location <- file.path(getwd(), "activity_labels.txt")
labels <- read.table(location)
labels <- labels[,2]

#Getting list of features
location <- file.path(getwd(), "features.txt")
features <- read.table(location)
features <- features[,2]

#Getting list of required features
features_required <- grepl("mean|std", features)

#Loading the X_test file
location <- file.path(getwd(), "test/X_test.txt")
X_test <- read.table(location)
names(X_test) <- features
X_test <- X_test[,features_required]

#Loading the Y_test file
location <- file.path(getwd(), "test/Y_test.txt")
Y_test <- read.table(location)
Y_test[,2] <- labels[Y_test[,1]]
names(Y_test) <- c("Activity_ID", "Activity_Label")

#Loading the Subject_test file
location <- file.path(getwd(), "test/subject_test.txt")
Subject_test <- read.table(location)
names(Subject_test) <- c("subject")

#Creating the final test dataset
test_data <- cbind(Subject_test, Y_test, X_test)

#Loading the X_train file
location <- file.path(getwd(), "train/X_train.txt")
X_train <- read.table(location)
names(X_train) <- features
X_train <- X_train[,features_required]

#Loading the Y_train file
location <- file.path(getwd(), "train/Y_train.txt")
Y_train <- read.table(location)
Y_train[,2] <- labels[Y_train[,1]]
names(Y_train) <- c("Activity_ID", "Activity_Label")

#Loading the Subject_train file
location <- file.path(getwd(), "train/subject_train.txt")
Subject_train <- read.table(location)
names(Subject_train) <- c("subject")

#Creating the final train dataset
train_data <- cbind(Subject_train, Y_train, X_train)

#Creating the final dataset
final_data <- rbind(test_data, train_data)

#Melting final dataset
melt_data <- melt(final_data, id = c("subject", "Activity_ID", "Activity_Label"), measure.vars = setdiff(colnames(final_data), c("subject", "Activity_ID", "Activity_Label")))

#Dcasting final dataset
tidy_data   <- dcast(melt_data, subject + Activity_Label ~ variable, mean)

#writing the final dataset to a .txt file
write.table(tidy_data, file = "./tidy_data.txt",row.names = FALSE)