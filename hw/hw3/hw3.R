# Staging libs and wd
setwd("~/GitHub/SRA365/hw/hw3")
install.packages("foreign")
library(foreign)

# Read in data
hw3.data <- read.csv("SouthGermanCredit_clean.csv", header = TRUE)

# Calculate zscore
hw3.data$z_sc <- (hw3.data$amount - 3271.248)/2822.752
