#Step 1: Load the csv file "cyber_attack" in R using read.csv () function.

cyberData <- read.csv("cyber_attack.csv", header = TRUE)

#Step 2: Check the trend that we have in data. We want to make sure if there is a linear trend in the data.
library(ggplot2)
cyberPlot <- ggplot(cyberData, aes(response_time, num_attack))
cyberPlot + geom_point()


#Step 3: Run a regression analysis using the lm() function.

cyberAttack <- lm(num_attack ~ response_time, data = cyberData)
#where num_acctack is outcome variable and respose_time is predictor.


#Step 4: Use summary () function to generate output of the regression analysis.

summary(cyberAttack)

#Step 5: Insert the regression model into ggplot in order to add a line to the scatterplot. 

cyberPlot <- ggplot(cyberAttack, aes(response_time, num_attack)) # this command is used to create the empty canvas (first layer)
cyberPlot + geom_point() # this command is used to create the base plot representing data with data points
cyberPlot + geom_point() + geom_line(data=fortify(cyberAttack), aes(x=response_time, y=.fitted)) # use geom_line () function. It adds the line to the base plot by using the fortified fit data, plotting the x vs. the fitted values.

#Step 6 : Determine an 95% interval of the potential range of values for the number of cyber-attacks when the response time is 200.
          #we use predict() function for this purpose.

predictionINT <- predict(cyberAttack, data.frame(response_time = 200), interval = "prediction", level = .95)
#in the predict() function cyberAttack represents the object we created earlier to store the results of our regression model, response_time = 200 represents the data point that we’re interested in for our prediction, and “prediction” represent the type of interval we are requesting.

#Step 7: Determine an 95% interval of the range of the mean for cyber-attacks when response time is 200.

confidenceINT <- predict(cyberAttack, data.frame(response_time = 200), interval = "confidence", level = .95)


