# Packages and data
library(foreign)
library(car)

sp9.data = read.delim("lab 9 sra 465 wc.dat", header = TRUE)
sp9.data$dys_detect_v2 = as.factor(hw9.data$dys_detect_v2)

# Eval if per_sensitive can predict dys_detect_v2
sp9.reg = glm(dys_detect_v2 ~ per_sensitive, data = hw9.data, family = binomial)
summary(sp9.reg)