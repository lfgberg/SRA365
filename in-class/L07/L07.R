# Setup libraries and data
library(car)
library(foreign)
library(leaps)

ic7.data = read.csv("covid19_SRA365.csv", header = TRUE)

# which variables best predict new_deaths_per_million?

# generate all possible models
bestsubsets = regsubsets(new_deaths_per_million ~ new_cases_per_million + people_vaccinated_per_hundred
                         + people_fully_vaccinated_per_hundred + median_age + gdp_per_capita
                         + cardiovasc_death_rate + diabetes_prevalence + life_expectancy)

# find the best models with each # of predictors

# make all the best models and compare them