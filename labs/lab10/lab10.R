# Packages and data
library(foreign)
library(gmodels)

lab10.data = read.delim("lab 9 sra 365 wc.dat", header = TRUE)

#  Can (cost_controls_v2) be predicted (num_people_v2)?
CrossTable(lab10.data$cost_controls_v2, lab10.data$num_people_v2, fisher = TRUE, chisq = TRUE, expected=TRUE, sresid = TRUE, format = "SPSS")

# per_sensitive_v2 predicts cost_controls_v2
CrossTable(lab10.data$cost_controls_v2, lab10.data$per_sensitive_v2, fisher = TRUE, chisq = TRUE, expected=TRUE, sresid = TRUE, format = "SPSS")

# dys_detect_v2 predicts cost_controls_v2
CrossTable(lab10.data$dys_detect_v2, lab10.data$cost_controls_v2, fisher = TRUE, chisq = TRUE, expected=TRUE, sresid = TRUE, format = "SPSS")
