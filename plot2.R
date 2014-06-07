###############################################################
# Author  : Vinh N. Pham
# Coursera: Exploratory Data Analysis
# Purpose : Create Plot 2 as described in project requirements
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

# Function to create plot 2
Plot2 <- function(ec) {
   plot(ec$DateTime, ec$Global_active_power, type="l",
        xlab="",
        ylab="Global Active Power (kilowatts)")
}

############ MAIN ##################
ec <- ReadData()  # read data

# create plot on png device
png(filename="plot2.png", width=480, height=480)
Plot2(ec)
dev.off()