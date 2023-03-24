# Read in data and libraries
library(foreign)

lab8.data = read.csv("lab 8 sra 365 wc.csv", header = TRUE)

# How many dummy variables for num_people_v2? x=n-1=2
# Which group is the default baseline? "Between 30-60 million" due to alphabetic order

# How many dummy variables for per_sensitive_v2? x=n-1=2
# Which group is the default baseline? "High" due to alphabetic order

# How many dummy variables for dys_detect_v2? x=n-1=4
# Which group is the default baseline? "Average" due to alphabetic order

# Evaluate if data_type has an impact on fin_loss, use identity as baseline

# Make data_type a factor
lab8.data$data_type = as.factor(lab8.data$data_type)

# Create contrasts; 1=auth 2=fin 3=health 4=intprop 5=personal
contrasts(lab8.data$data_type) <- contr.treatment(6, base = 4)

lab8.reg = lm(fin_loss ~ data_type, data = lab8.data)
summary(lab8.reg)

# get means
round(tapply(lab8.data$fin_loss, lab8.data$data_type, mean, na.rm = TRUE), 3)
