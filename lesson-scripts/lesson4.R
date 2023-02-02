#****************************
#Step 1: Specify a folder as the working directory using the following command.

setwd("~/Documents/LABS")

# In this example, LABS folder created in Documents is set as the working directory. You can specify any folder on your computer as the working directory.

#***************************
# Step 2: Load a dat file in R using read.delim () function.

cyberDATA <- read.csv("cyber-attack-v4.csv", header = TRUE)

#******************************
# Step 3: Install the ggplot2 package to display data by exacuting thef following command.

install.packages("ggplot2")

#*******************************
# Step 4: Activate the ggplot2 package by executing the command

library(ggplot2)


#**************************************
# Step 5: Create scatterplot where response_time is variable to be plotted on the x-axis and num_attack is variable to be plotted on the y-axis
# First, create a graph where the graph object is graphCyber, data frame is cyberDATA.
#          where aes (varibale for x axis, variable for y axis)


graphCyber <- ggplot (cyberDATA, aes(response_time, num_attack)) 
print(graphCyber)

graphCyber + geom_point()

#Step 6: Use 'labs()' function to add axis labels other than default labels (response_time and num_attack in this case) 

graphCyber + geom_point() + labs(x= "Response Time", y="Number of Cyberattacks")


#***********************************
# Step 7: Create boxplot where Fin_loss is variable to be plotted on the x-axis and num_attack is variable to be plotted on the y-axis
# First, create a plot object (cyberBoxplot).

cyberBoxplot <- ggplot (cyberDATA, aes (Fin_loss, num_attack))
# then, create another layer using '+geom_boxplot()
print(cyberBoxplot)
cyberBoxplot + geom_boxplot()

# Step 8: Use 'labs()' function to add axis labels other than default labels (Fin_loss and num_attack in this case) 

cyberBoxplot + geom_boxplot() + labs(x= "Financial Loss", y="Number of Cyberattacks")



#****************************************
# Step 9: Create histogram where num_attack is variable to be plotted on the x-axis 
# First, create a plot object (cyberHistogram).


cyberHistogram <- ggplot(cyberDATA, aes (num_attack))
print(cyberHistogram)
cyberHistogram + geom_histogram()  + labs(x="Number of Cyberattacks")

#****************************************
# Step 10: In this step, we will create bar charts. Before doing so, please download 'Success.dat' file from Canvas and load it in R.

successDAT <- read.delim("Success.dat", header=TRUE)

# Once the dataset has been loaded in R, then create an object for bar chart where expertise is variable to be plotted on the x-axis and success is variable to be plotted on the y-axis.

successBarchart <- ggplot(successDAT, aes(expertise, Success))
print(successBarchart)

# once the object has been created, then use the stat_summary() function to plot summary of the data (the mean in this case, so 'fun.y' property should be set to 'mean'; fun.y=mean)

successBarchart + stat_summary (fun.y=mean, geom="bar", fill="blue", colour="Black")


# Step 11: Let's look for gender effects, meaning how gender factors into the success rate of cyber security and sra experts. To do so, we will set the 'fill' aesthetic to the variable gender.

successBarchart <- ggplot(successDAT, aes(expertise, Success, fill=Gender))
print(successBarchart)
successBarchart + stat_summary (fun.y=mean, geom="bar")

# Once you have executed the command above, you will notice that female and male bars stand behind each other. To overcome this issue, we have to specify ' position="dodge" '. 

successBarchart + stat_summary (fun.y=mean, geom="bar", position="dodge")

