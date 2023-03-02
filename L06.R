# Setup packages and libraries
library(car, foreign, ggplot2)

# Read in data
data = read.csv("cyber-attack-v3.csv", header = TRUE)

# Regression model to see if cyber-literate predicts cyber-attacks
reg1 = lm(num_attack ~ cyber_literate_users, data = data)
summary(reg1)

# run dwt test
dwt(reg1)

# Test for normality w/ Shapiro Wilk Test
data$res = resid(reg1)
resid.plot = ggplot(data, aes(res))
resid.plot + geom_histogram()
shapiro.test(data$res)
