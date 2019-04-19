## Background Notes
# Introduction

#This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:
#        
#        Dataset: Electric power consumption [20Mb]

# Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

#The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
        
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#Loading the data

#When loading the dataset into R, please consider the following:
        
#The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).

#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

#Note that in this dataset missing values are coded as ?.

#Making Plots

#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

#First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

#For each plot you should

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

#Name each of the plot files as plot1.png, plot2.png, etc.

#Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.

#Add the PNG file and R code file to your git repository

#When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files.

#-------------------------------


# Set the working directory (step after this assumes you have downloaded the "household_power_consumption.zip" in the working directory )
setwd("/Users/daniel/datasciencecoursera/exploratory/ExData_Plotting1")

# Unzip the downloaded "household_power_consumption.zip"
unzip("household_power_consumption.zip")

# Read the data from the unzipped file (*.txt) as a table into a variable. 
## It is already known from the task description that (see above): 
## (1) semi-colons are used as the separator; and
## (2) missing values are coded as ?

electropower <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?" )

# Take a peek at the data and double-check the headings - commented out here as only needed during experimentation
# head(electropower)

# Extract the data for the period 01.02.2007 to 02.02.2007
plot4data <- electropower[electropower$Date %in% c("1/2/2007","2/2/2007"),]

# As per plots 2 and 3, the required plot x-axis shows days of the week for all four plot, so as per the 
# proposal in the instructions for this exercise, convert the Date and Time 
# variables to Date/Time classes in R using the strptime() and as.Date() functions
CombDateTime <-strptime(paste(plot4data$Date, plot4data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# Add the new column to the data (recycled from plot 2.R)
plot4data <- cbind(CombDateTime, plot4data)


#Set up a 2x2 panel for four plots:
# 1. Energy sub metering vs Time (day), as used in plot3.R
# 2. Global Active Power vs Time (day)
# 3. Voltage vs Time (day)
# 4. Global reactive power vs Time (day)
#par(mfrow=c(2,2))

#Generate plot 2 - top left
#plot(plot4data$CombDateTime, plot4data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")

#Generate plot 3 - top right
#plot(plot4data$CombDateTime, plot4data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

#Generate plot 1 - from plot3.R - bottom left
#plot(plot4data$CombDateTime, plot4data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
#lines(plot4data$CombDateTime, plot4data$Sub_metering_2, type="l", col="red")
#lines(plot4data$CombDateTime, plot4data$Sub_metering_3, type="l", col="blue")
#legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty="solid")

# Generate plot 4 - bottom right
#plot(plot4data$CombDateTime, plot4data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")


# Export the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename="plot4.png",width= 480,height = 480)

par(mfrow=c(2,2))

#Generate plot 2 - top left
with(plot4data, plot(plot4data$CombDateTime, plot4data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power"))

#Generate plot 3 - top right
with(plot4data, plot(plot4data$CombDateTime, plot4data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage"))

#Generate plot 1 - from plot3.R - bottom left
with(plot4data, plot(plot4data$CombDateTime, plot4data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
with(plot4data, lines(plot4data$CombDateTime, plot4data$Sub_metering_2, col="red"))
with(plot4data, lines(plot4data$CombDateTime, plot4data$Sub_metering_3, col="blue"))
with(plot4data, legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty="solid"))

# Generate plot 4 - bottom right
with(plot4data, plot(plot4data$CombDateTime, plot4data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power"))

dev.off() 

