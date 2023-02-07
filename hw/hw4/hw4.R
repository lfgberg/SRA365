setwd("~/GitHub/SRA365/hw/hw4/")

# Setup packages
install.packages("foreign", "ggplot2")
library(foreign)
library(ggplot2)

# Read in data
hw4.data <- read.csv("SouthGermanCredit_clean.csv", header = TRUE)

# Create box whisker plot for employment duration vs age
plot1 <- ggplot(hw4.data, aes(employment_duration, age))
plot1 + geom_boxplot()

# Create age histogram
hist1 <- ggplot(hw4.data, aes(age))
hist1 + geom_histogram(binwidth = .5) + labs(x = "Age", y = "Frequency")

# Histogram for amount
hist2 <- ggplot(hw4.data, aes(amount))
hist2 + geom_histogram(binwidth = .5) + labs(x = "Amount", y = "Frequency")

# Histogram for duration
hist3 <- ggplot(hw4.data, aes(duration))
hist3 + geom_histogram(binwidth = .5) + labs(x = "Duration", y = "Frequency")

# Scatterplot for age vs amount
scatter1 <- ggplot(hw4.data, aes(age, amount))
scatter1 + geom_point()

# Scatterplot for duration v amount
scatter2 <- ggplot(hw4.data, aes(duration, amount))
scatter2 + geom_point()
