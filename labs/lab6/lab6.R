# Setup data and packages
library(car)
library(ggplot2)
library(foreign)

lab6.data = read.csv("lab 6 sra 365 wc-1.csv", header = TRUE)

# Regression model for if per_sensitive predicts dys_detect, test for independence of observations
lab6.reg = lm(dys_detect ~ per_sensitive, data = lab6.data)
dwt(lab6.reg)

# Homogenity of variance test
plot(lab6.reg, which = 1)

# Test for normality w/ Q-Q plot
plot(lab6.reg, which = 2)

# Test for normality w/ Shapiro Wilk Test
lab6.data$res = resid(lab6.reg)
resid.plot = ggplot(lab6.data, aes(res))
resid.plot + geom_histogram()
shapiro.test(lab6.data$res)

#Stores standardized residuals
lab6.data$std.r = rstandard(lab6.reg)

