## machine Learning: Multiple Linear Regression
rm(list = ls())

set.seed(123) # set seed incase we need randomization
# install.packages("caTools") #install packages
library("caTools")  # bring the library
library("ggplot2")

# read
dataset <- read.csv("50_Startups.csv")


# encode the state variable #categorical

labs1 <- 1:length(unique(dataset$State))
dataset$State <- factor(dataset$State, labels = labs1)

# test and trainnig datasets
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- dataset[split == T,]
test_set <- dataset[split == F, ]



# Fitting multiple linear regression on Training Set
regressor <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State
                  , data = training_set)
#class
#regressor <- lm(Profit ~ .               #R understands . as all vars 
#                , data = training_set)

summary(regressor)

#backward elimination 1
regressor <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend
                , data = training_set)
summary(regressor)

#backward elimination 2
regressor <- lm(Profit ~ R.D.Spend + Marketing.Spend
                , data = training_set)
summary(regressor)

#backward elimination 3 #final
regressor <- lm(Profit ~ R.D.Spend
                , data = training_set)
summary(regressor)


# Predict the test set results
y_pred <- predict(regressor, test_set)







##Backward with full dataset
# Fitting multiple linear regression on  dataset
regressor <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State
                , data = dataset)
summary(regressor)

#backward elimination 1
regressor <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend
                , data = dataset)
summary(regressor)

#backward elimination 2
regressor <- lm(Profit ~ R.D.Spend + Marketing.Spend
                , data = dataset)
summary(regressor)

#backward elimination 3 #final
regressor <- lm(Profit ~ R.D.Spend
                , data = dataset)
summary(regressor)



# a function to do backward elimination
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}


SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)

x = training_set
sl = 0.05





















