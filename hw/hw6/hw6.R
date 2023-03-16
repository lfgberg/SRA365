# Setup data and packages
library(car)
library(ggplot2)
library(foreign)

hw6.data = read.csv("hw6.csv", header = TRUE)

# does remote_ips predict dns_query_times
hw6.reg = lm(dns_query_times ~ remote_ips, data = hw6.data)
summary(hw6.reg)

# test for independence of observations
dwt(hw6.reg)

# Homogenity of variance test
plot(hw6.reg, which = 1)

# Test for normality w/ Q-Q plot
plot(hw6.reg, which = 2)

# Test for normality w/ Shapiro Wilk Test
hw6.data$res = resid(hw6.reg)
resid.plot = ggplot(hw6.data, aes(res))
resid.plot + geom_histogram()
shapiro.test(hw6.data$res)

#Stores standardized residuals
hw6.data$std.r = rstandard(hw6.reg)
