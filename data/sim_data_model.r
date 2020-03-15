# Code for creating simulated dataset 
# This is the data we would gather when implementing the code in real life
# Predictors were selected based on ease for the doctor to obtain
# as well as relevance to opioid addiction/dependency

# The model is logistic regression (outputting a probability)

library(tidyverse)

#Set seed in this simulation so we are able to consistently replicate the same results 

set.seed(2112)

# Predictors (data that we would have theoretically gotten to predict)

# BMI
# Education level
# Annual salary
# Marital status 
# Children
# Hours worked/week
# Pain tolerance 
# Smoking
# Frequency of alcohol consumption 

# Response variable
# Probability of opioid dependency 

# Number of observations  
n <- 500

# BMI

BMI <- rlnorm(n, mean = log(27), sd = 0.1)
BMI <- BMI[order(-BMI)]

# Income

income <- round(rlnorm(n, mean = log(50000), sd = 0.5))
income <- income[order(income)]

# Educational levels

edu_prob <- runif(n, min = 0, max = 1)

edu_hs <- edu_prob < 0.5
edu_ug <- edu_prob >= 0.5

edu_prob[edu_hs] <- 0
edu_prob[!edu_hs] <- 1

edu_status <- edu_prob[order(edu_prob)]

# Marital Status 

marital_prob <- runif(n, min = 0, max = 1)

never_married <- (marital_prob < 0.3) * 1

married <- (marital_prob >= 0.3 & marital_prob < 0.8) * 1

divorced <- (marital_prob >= 0.8 & marital_prob < 0.9) * 1

other <- (marital_prob >= 0.9 & marital_prob < 1) * 1

marital_status <- data.frame(never_married, married, divorced)
marital_status <- marital_status[order(-divorced),]

# Children

children <- read.csv("children.csv")
children <- children[1:n,1]
children <- children[order(-children)]

# Hours per work week 

work_wk <- read.csv("work.csv")
work_wk <- work_wk[1:n,1]
work_wk <- work_wk[order(-work_wk)]

# Pain tolerance 

pain_tol <- round(rlnorm(n, meanlog = log(1), sdlog = 0.6))
pain_tol <- pain_tol[order(pain_tol)]

# Smoking

smoke <- round(rlnorm(n, meanlog = log(14.9), sdlog = 0.07))
smoke <- smoke[order(-smoke)]

# Alcohol frequency (days per week)

alc <- round(rlnorm(n, meanlog = log(2), sdlog = 0.5))
alc[alc > 7] <- 7
alc <- alc[order(-alc)]

opioid_user <- vector(length = n)

for(i in 1:n){
  opioid_user[i] <- sample(c(rep(1, n-i+1), rep(0, i-1)), size = 1)
}

df <- data.frame(BMI, income, edu_status, marital_status, children, work_wk, pain_tol, smoke, alc,
                 opioid_user)

# Create the logistic regression 

model <- glm(opioid_user ~ ., data = df, family = binomial)

predict <- predict(model, type = "response")

response_predicted <- (predict > 0.5) * 1

# Get a confusion matrix to evaluate the effectiveness of our algorithm

data <- data.frame(y_hat = response_predicted, actual = df$opioid_user)

conf_matrix <- table(data$y_hat, data$actual)
conf_matrix

accuracy <- (conf_matrix[1,1] + conf_matrix[2,2])/nrow(data)
accuracy 

sensitivity <- conf_matrix[2,2]/sum(conf_matrix[,2])
sensitivity

precision <- conf_matrix[2,2]/sum(conf_matrix[2,])
precision 

# Use backward BIC for feature selection

model_bic = step(model, direction = "backward", k=log(n))

predict <- predict(model_bic, type = "response")

response_predicted <- (predict > 0.5) * 1

data <- data.frame(y_hat = response_predicted, actual = df$opioid_user)

conf_matrix <- table(data$y_hat, data$actual)
conf_matrix

accuracy <- (conf_matrix[1,1] + conf_matrix[2,2])/nrow(data)
accuracy 

sensitivity <- conf_matrix[2,2]/sum(conf_matrix[,2])
sensitivity

precision <- conf_matrix[2,2]/sum(conf_matrix[2,])
precision 

