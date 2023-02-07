# Setup Packages
install.packages("foreign")
library(foreign)

# Read in data
labData <- read.spss("sra 365 lab 3 data.sav", use.value.labels = TRUE, to.data.frame = TRUE)

# Calculate Z score
perSensMean <- mean(labData$per_sensitive)
perSensStDev <- sd(labData$per_sensitive)
labData$perSensZ <- (labData$per_sensitive - perSensMean)/perSensStDev
