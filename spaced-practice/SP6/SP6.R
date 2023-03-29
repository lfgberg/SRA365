# Read in data and libs
library(foreign)
library(car)
library(ggplot2)

sp6.data = read.csv("lab 6 sra 365 wc-1.csv", header = TRUE)

# does per_sensitive predict cost_controls
sp6.reg = lm(cost_controls ~ per_sensitive, data = sp6.data)

# independence of observations
dwt(sp6.reg)

# homogenity of variance
plot(sp6.reg, which = 1)

# Test for normality w/ Q-Q plot
plot(sp6.reg, which = 2)

# Test for normality w/ Shapiro Wilk Test
sp6.data$res = resid(sp6.reg)
resid.plot = ggplot(sp6.data, aes(res))
resid.plot + geom_histogram()
shapiro.test(sp6.data$res)
