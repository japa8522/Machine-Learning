## machine Learning: Polinomial Regression
rm(list = ls())

set.seed(123) # set seed incase we need randomization
# install.packages("caTools") #install packages
library("caTools")  # bring the library
library("ggplot2")

# read
dataset <- read.csv("Position_Salaries.csv")


# encode the state variable #categorical

labs1 <- 1:length(unique(dataset$Position))
dataset$State <- factor(dataset$State, labels = labs1)

# test and trainnig datasets
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- dataset[split == T,]
test_set <- dataset[split == F, ]
