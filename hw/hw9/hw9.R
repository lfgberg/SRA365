# Packages and data
library(foreign)
library(car)

sp9.data = read.delim("lab 9 sra 365 wc.dat", header = TRUE)
sp9.data$dys_detect_v2 = as.factor(sp9.data$dys_detect_v2)

# Eval if per_sensitive can predict dys_detect_v2
sp9.reg = glm(dys_detect_v2 ~ per_sensitive, data = sp9.data, family = binomial)
summary(sp9.reg)

# 1/(1+(exp(-(2.0597808+(0.0006407*50)))))

# Determine the odds ratio
exp(sp9.reg$coefficients)

# Change baseline
sp9.data$dys_detect_v2 = relevel(sp9.data$dys_detect_v2, "Slow")

# McFadden = 1 - residual / null