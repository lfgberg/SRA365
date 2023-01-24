#Set wd
setwd("~/GitHub/SRA365/labs/lab3")

#Load an SPSS data set in R using read.spss() function.
install.packages("foreign")
library(foreign)
lab3.data <- read.spss("lab3.sav", use.value.labels = TRUE, to.data.frame = TRUE)

#read z scores from fin_loss
mean_fin_loss <- mean(lab3.data$fin_loss)
sd_fin_loss <- sd(lab3.data$fin_loss)
lab3.data$z_score <- (lab3.data$fin_loss - mean_fin_loss)/sd_fin_loss