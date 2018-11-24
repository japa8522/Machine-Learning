## machine Learning

# install.packages("caTools") #install packages
library("caTools")
set.seed(123)


# data preprocessing

# import the dataset
dataset <- read.csv('Data.csv')

#display dataset
dataset

dataset$Age <- ifelse(is.na(dataset$Age)
                      ,mean(dataset$Age, na.rm = T)
                      ,dataset$Age)

dataset$Salary <- ifelse(is.na(dataset$Salary)
                         , mean(dataset$Salary, na.rm = T)
                         , dataset$Salary)

# course step
# dataset$Salary <- ifelse(is.na(dataset$Salary)
#                       ,ave(dataset$Salary, FUN = function(x) mean(x, na.rm = T))
#                       ,dataset$Salary)


# Encoding categorical data
# converting data to numeric instead of categorical
head(dataset)
dataset$Country <- factor(dataset$Country
                          ,levels = unique(dataset$Country)
                          ,labels = 1:length(unique(dataset$Country)))

dataset$Purchased <- factor(dataset$Purchased
                          ,levels = unique(dataset$Purchased)
                          ,labels = c(0,1))

# Splitting the dataset in to training and test set
split <- sample.split(dataset$Purchased, SplitRatio = 0.8) #splitRatio for training set
                #returnsa length verctor for each row  T for training, F for testset
training_set <- dataset[split == T,]
test_set <- dataset[split == F,]


# Feature scaling
# transform the vetors to bring in same scales, else one variable will dominate the model
# standardization = (x - mean)/sd
# normalization = (x - min)/(max - min)
# use scale function to do that

training_set[,2:3] <- scale(training_set[,2:3])
test_set[,2:3] <- scale(test_set[,2:3])





