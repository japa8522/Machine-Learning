## machine Learning: Simple Linear Regression

set.seed(123) # set seed incase we need randomization
# install.packages("caTools") #install packages
library("caTools")  # bring the library
library("ggplot2")

# read
dataset <- read.csv("Salary_Data.csv")

# test and trainnig datasets
split <- sample.split(dataset$Salary, SplitRatio = 20/30)
training_set <- dataset[split == T,]
test_set <- dataset[split == F, ]


# Fitting simple linear regressin line to training set
regressor <- lm(Salary ~ YearsExperience, training_set)

# predicting Test dataset values
y_pred <- predict(regressor, test_set)


#visualize training set results
plot(training_set)
abline(coefficients(regressor)[1], coefficients(regressor)[2])

plot(test_set)
abline(coefficients(regressor)[1], coefficients(regressor)[2])

#visulize 2
  ggplot()+
    geom_point(aes(x= training_set$YearsExperience, y = training_set$Salary)
               ,color = "red")+
    geom_line(aes(x= training_set$YearsExperience, y = predict(regressor, training_set))
              , color = "blue")+
    ggtitle("Salary vs Experience (Training Set)")+
    xlab("Years of experience")+
    ylab("Salary")

  #test set prediction
  ggplot()+
    geom_point(aes(x= test_set$YearsExperience, y = test_set$Salary)
               ,color = "red")+
    geom_line(aes(x= training_set$YearsExperience, y = predict(regressor, training_set))
              , color = "blue")+
    ggtitle("Salary vs Experience (Test Set)")+
    xlab("Years of experience")+
    ylab("Salary")
  
  


