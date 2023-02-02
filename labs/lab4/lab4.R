# Staging
setwd("~/GitHub/SRA365/labs/lab4/")
install.packages("foreign", "ggplot2")
library(foreign, ggplot2)

# Read in data
lab4.data <- read.csv("lab4.csv", header = TRUE)

# Create boxplot
plot1 <- ggplot(lab4.data, aes(data_type, num_people))
print(plot1)
plot1 + geom_boxplot()

# Create histogram - number of people
hist1 <- ggplot(lab4.data, aes(num_people))
hist1 + geom_histogram(binwidth = .4) + labs(x = "Number of People (in millions)", y = "Frequency")

# Create histogram - percent sensitive data
hist2 <- ggplot(lab4.data, aes(per_sensitive))
hist2 + geom_histogram(binwidth = .4)

# Create histogram - cost of controls
hist3 <- ggplot(lab4.data, aes(cost_controls))
hist3 + geom_histogram(binwidth = .4)

# Scatterplot for num people + fin loss
scatter1 <- ggplot(lab4.data, aes(num_people, fin_loss))
scatter1 + geom_point()

# Scatterplot for sensitive data + fin loss
scatter2 <- ggplot(lab4.data, aes(per_sensitive, fin_loss))
scatter2 + geom_point()

# Scatterplot for cost controls + fin loss
scatter3 <- ggplot(lab4.data, aes(cost_controls, fin_loss))
scatter3 + geom_point()

# Bar chart for sensitive data breached + fin loss varies by num people
bar1 <- ggplot(lab4.data, aes(per_sensitive_v2, fin_loss, fill = num_people_v2))
bar1 + stat_summary(fun.y = mean, geom = "bar", position = "dodge")
