#Step 1: Specify a folder as the working directory using the following command.

setwd("~/Documents/LABS")

# In this example, LABS folder created in Documents is set as the working directory. You can specify any folder on your computer as the working directory.

# Step 2: Load a text file in R using read.delim () function

cyberTXT <- read.delim("cyber-attack-dc.txt", header = TRUE)

# Step 3: Load a cvs file in R using read.csv () function.

cyberCSV <- read.csv("cyber-attack-dc.csv", header = TRUE)

#Step 4: Laad an SPSS data set in R using read.spss() function.

install.packages("foreign")
library(foreign)
cyberSPSS <-read.spss("cyber-attack-dc.sav", use.value.labels = TRUE, to.data.frame = TRUE) 


# Step 5: Load a dat file in R using read.delim () function

cyberDAT <- read.delim("cyber-attack-dc.dat", header = TRUE)

# Step 6: Compute the mean for the "response_time" variable in the cyberCSV data set using mean() function.

meanRT <-mean(cyberCSV$response_time)

#Step 7: Computer the sd for the "response_time" variable in the cyberCSV data set using sd() function.
sdRT <- sd(cyberCSV$response_time)

#Step 8: Creating a new variable in R that includes Z-scores for "response_time".

cyberCSV$Zrt <- (cyberCSV$response_time - meanRT)/sdRT


