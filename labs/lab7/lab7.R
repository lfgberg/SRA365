# Setup data and packages
library(car)
library(leaps)
library(foreign)

lab7.data = read.delim("lab 7 sra 365 wc-1.dat", header = TRUE)

# use best subsets to determine what best predicts cost_controls
bestsubsets = regsubsets(cost_controls ~ num_people + num_records + per_sensitive + dys_impact + dys_detect,
                         data = lab7.data, nbest = 1)
subsets(bestsubsets, statistic = "adjr2")

# make 5 models based off this
lab7.reg1 = lm(cost_controls ~ num_records, data = lab7.data)
summary(lab7.reg1)
lab7.reg2 = lm(cost_controls ~ num_records + per_sensitive, data = lab7.data)
summary(lab7.reg2)
lab7.reg3 = lm(cost_controls ~ num_records + per_sensitive + dys_detect, data = lab7.data)
summary(lab7.reg3)
lab7.reg4 = lm(cost_controls ~ num_records + per_sensitive + dys_detect + num_people, data = lab7.data)
summary(lab7.reg4)
lab7.reg5 = lm(cost_controls ~ num_records + per_sensitive + dys_detect + num_people + dys_impact, data = lab7.data)
summary(lab7.reg5)

# eval model 5 for multicollinearity
cor(lab7.data[, c("num_records", "per_sensitive", "dys_detect", "num_people", "dys_impact")]) # .8 or higher is bad

# vif for each
vif(lab7.reg5) # greater than 10 is concerning
1/vif(lab7.reg5) # tolerance - lower than .2 is sus lower than .1 is bad bad
