# Read in data + libs
library(foreign)

data = read.csv("lab 8 sra 365 wc.csv", header = TRUE)

# Create contrasts
data$data_type = as.factor(data$data_type)
contrasts(data$data_type) <- contr.treatment(6, base = 3)

# Name contrasts
Health = c(0,0,0,0,0)
Financial = c(0,1,0,0,0)
Personal = c(0,0,0,0,1)
AuthenticationCredentials = c(1,0,0,0,0)
IntellectualProperty = c(0,0,0,1,0)
Identity = c(0,0,1,0,0)

contrasts(data$data_type) = cbind(Health, Financial, Personal, AuthenticationCredentials, IntellectualProperty, Identity)

# Create model
reg = lm(num_people ~ data_type, data = data)
summary(reg)

# get means
round(tapply(data$num_people, data$data_type, mean, na.rm = TRUE), 3)
