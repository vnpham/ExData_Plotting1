###############################################################
# Author  : Vinh N. Pham
# Coursera: Exploratory Data Analysis
# Purpose : Create Plot 1 as described in project requirements
###############################################################

# Function to read data from source and clean up for using
ReadData <- function() {
   ec <- read.csv("household_power_consumption.txt",
                  header=TRUE, sep=";",
                  stringsAsFactors=FALSE,
                  na.strings="?")
   ec <- ec[ec$Date=="1/2/2007" | ec$Date=="2/2/2007",]
   
   ec$DateTime <- strptime(paste(ec$Date, ec$Time), "%d/%m/%Y %H:%M:%S")
   
   ec
}

# Function to create plot 1
Plot1  <- function(ec) {
   hist(ec$Global_active_power,
        col="red",
        xlab="Global Active Power (kilowatts)",
        main="Global Active Power")
}

############ MAIN ##################
ec <- ReadData()  # read data

# create plot on png device
png(filename="plot1.png", width=480, height=480)
Plot1(ec)
dev.off()