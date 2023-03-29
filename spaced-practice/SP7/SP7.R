# Read in libs and data
library(foreign)
library(leaps)

sp7.data = read.delim("lab 7 sra 365 wc.dat", header = TRUE)

# determine best predictor of fin_loss, exclude event_ID and only use continuous variables
bestsubsets = regsubsets(fin_loss ~ num_people + num_records + per_sensitive + dys_impact + dys_detect + cost_controls,data = sp7.data, nbest = 1)
subsets(bestsubsets, statistic = "adjr2")

# models
sp7.reg1 = lm(fin_loss ~ num_records, data = sp7.data)
sp7.reg2 = lm(fin_loss ~ num_records + dys_detect, data = sp7.data)
sp7.reg3 = lm(fin_loss ~ num_records + dys_detect + per_sensitive, data = sp7.data)
sp7.reg4 = lm(fin_loss ~ num_records + dys_detect + per_sensitive + cost_controls, data = sp7.data)
sp7.reg5 = lm(fin_loss ~ num_records + dys_detect + per_sensitive + cost_controls + dys_impact, data = sp7.data)
sp7.reg6 = lm(fin_loss ~ num_records + dys_detect + per_sensitive + cost_controls + dys_impact + num_people, data = sp7.data)

summary(sp7.reg1)
summary(sp7.reg2)
summary(sp7.reg3)
summary(sp7.reg4)
summary(sp7.reg5)
summary(sp7.reg6)

# model 2 is best

# eval model 6 for multicollinarity
cor(sp7.data[, c("num_records", "dys_detect", "per_sensitive", "cost_controls", "dys_impact", "num_people")]) # .8 or higher is bad

# vif for each
vif(sp7.reg6) # greater than 10 is concerning
1/vif(sp7.reg6) # tolerance - lower than .2 is sus lower than .1 is bad bad
