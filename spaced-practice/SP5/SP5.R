# Read in data and libraries
library(foreign)

sp5.data = read.delim("lab 5 sra 365 wc-1.dat", header = TRUE)

# model to determine if dys_detect predicts fin_loss
sp5.reg = lm(fin_loss ~ dys_detect, data = sp5.data)
summary(sp5.reg)

# determine fin_loss if dys_detect is 200
sp5.predict = predict(sp5.reg, data.frame(dys_detect = 200), interval = "prediction")

# 85% range mean fin_loss if dys_detect is 365
sp5.confidence = predict(sp5.reg, data.frame(dys_detect = 365), interval = "confidence", level = .85)

# 85% range values fin_loss if dys_detect is 365
sp5.predictRange = predict(sp5.reg, data.frame(dys_detect = 365), interval = "prediction", level = .85)
