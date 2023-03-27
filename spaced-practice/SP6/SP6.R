# Read in data and libs
library(foreign)
library(car)

sp6.data = read.csv("lab 6 sra wc-1.csv", header = TRUE)

# does per_sensitive predict cost_controls
sp6.reg = lm(cost_controls ~ per_sensitive, data = sp6.data)

# independence of observations
dwt(sp6.reg)