###############################################################
# Author  : Vinh N. Pham
# Coursera: Exploratory Data Analysis
# Purpose : Create Plot 3 as described in project requirements
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

# Function to create plot 3
Plot3 <- function(ec) {
   plot(ec$DateTime, ec$Sub_metering_1, type="l", col="black",
        xlab="",
        ylab="Energy sub metering")
   lines(ec$DateTime, ec$Sub_metering_2, col="red")
   lines(ec$DateTime, ec$Sub_metering_3, col="blue")
   legend("topright", lty=1, bty="n",
          col=c("black", "red", "blue"),
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   
}

############ MAIN ##################
ec <- ReadData()  # read data

# create plot on png device
png(filename="plot3.png", width=480, height=480)
Plot3(ec)
dev.off()
