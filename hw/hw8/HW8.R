# read data and libs
library(foreign)

hw8.data = read.csv("hw8.csv", header = TRUE)

hw8.data$server = as.factor(hw8.data$server)

contrasts(hw8.data$server) <- contr.treatment(5, base = 5)

hw8.reg = lm(freq ~ server, data = hw8.data)
summary(hw8.reg)

round(tapply(hw8.data$freq, hw8.data$server, mean, na.rm = TRUE), 3)
