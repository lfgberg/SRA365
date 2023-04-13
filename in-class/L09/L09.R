# Packages and data
library(foreign)
library(car)

dataFrame = read.delim("lab 9 sra 365 wc.dat", header = TRUE)

# Read as factor
dataFrame$dys_detect_v2 = as.factor(dataFrame$dys_detect_v2)

# Evaluate whether the number of records breached ("num_records") can be used to predict if an organization is fast or slow in detecting the breach ("dys_detect_v2").  
reg = glm(dys_detect_v2 ~ num_records, data = dataFrame, family = binomial)
summary(reg)

# equation P(Y)=1/(1+(exp(-(1.998789+(0.001865*X)))))