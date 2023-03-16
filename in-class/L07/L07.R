# Setup libraries and data
library(car)
library(foreign)
library(leaps)

ic7.data = read.csv("covid19_SRA365.csv", header = TRUE)

# which variables best predict new_deaths_per_million?

# generate all possible models
bestsubsets = regsubsets(new_deaths_per_million ~ human_development_index + people_vaccinated_per_hundred
                         + people_fully_vaccinated_per_hundred + median_age + gdp_per_capita
                         + cardiovasc_death_rate + diabetes_prevalence + life_expectancy, data = ic7.data, nbest = 1)

# find the best models with each # of predictors
subsets(bestsubsets, statistic = "adjr2")

# make all the best models and compare them
ic7.reg1 = lm(new_deaths_per_million ~ median_age, data = ic7.data)
summary(ic7.reg1)
ic7.reg2 = lm(new_deaths_per_million ~ median_age + cardiovasc_death_rate, data = ic7.data)
summary(ic7.reg2)
ic7.reg3 = lm(new_deaths_per_million ~ people_fully_vaccinated_per_hundred + median_age + cardiovasc_death_rate, data = ic7.data)
summary(ic7.reg3)
ic7.reg4 = lm(new_deaths_per_million ~ people_vaccinated_per_hundred + median_age + cardiovasc_death_rate + diabetes_prevalence, data = ic7.data)
summary(ic7.reg4)
ic7.reg5 = lm(new_deaths_per_million ~ people_vaccinated_per_hundred + median_age + cardiovasc_death_rate + diabetes_prevalence + gdp_per_capita, data = ic7.data)
summary(ic7.reg5)
ic7.reg6 = lm(new_deaths_per_million ~ people_vaccinated_per_hundred + median_age + cardiovasc_death_rate + diabetes_prevalence + gdp_per_capita + life_expectancy, data = ic7.data)
summary(ic7.reg6)
ic7.reg7 = lm(new_deaths_per_million ~ people_vaccinated_per_hundred + median_age + cardiovasc_death_rate + diabetes_prevalence + gdp_per_capita + life_expectancy + human_development_index, data = ic7.data)
summary(ic7.reg7)
ic7.reg8 = lm(new_deaths_per_million ~ people_vaccinated_per_hundred + median_age + cardiovasc_death_rate + diabetes_prevalence + gdp_per_capita + life_expectancy + human_development_index + people_fully_vaccinated_per_hundred, data = ic7.data)
summary(ic7.reg8)
