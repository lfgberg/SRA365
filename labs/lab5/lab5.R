# Read in data
library(foreign)
lab5.data = read.delim("lab 5 sra 365 wc.dat", header = TRUE)

# Does per_sensitive have an impact on dys_impact
model1 = lm(dys_impact ~ per_sensitive, data = lab5.data)
summary(model1)

# Can cost_controls be predicted by per_sensitive
model2 = lm(cost_controls ~ per_sensitive, data = lab5.data)
summary(model2)

# can num_records predict dys_impact
model3 = lm(dys_impact ~ num_records, data = lab5.data)
summary(model3)

# Does num_records effect cost_controls
model4 = lm(cost_controls ~ num_records, data = lab5.data)
summary(model4)

# regression equation Y = intercept + slope * x
# cost_controls = 38.78248 + 0.22183 * num_records

# Determine cost_controls if num_records is 10 million
prediction1 = predict(model4, data.frame(num_records = 10), interval = "prediction", level = .7)

# Determine a 70% confidence interval for cost_controls when num_records is 10 million
confidenceInt1 = predict(model4, data.frame(num_records = 10), interval = "confidence", level = .7)

