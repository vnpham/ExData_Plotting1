###############################################################
# Author  : Vinh N. Pham
# Coursera: Exploratory Data Analysis
# Purpose : Create Plot 4 as described in project requirements
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

# Function to create plot 3
Plot3 <- function(ec) {
   plot(ec$DateTime, ec$Sub_metering_1, type="l", col="black",
        xlab="",
        ylab="Energy sub metering")
   lines(ec$DateTime, ec$Sub_metering_2, col="red")
   lines(ec$DateTime, ec$Sub_metering_3, col="blue")
   legend("topright", lty=1, col=c("black", "red", "blue"),
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   
}

# Function to create plot of voltage
VoltagePlot <- function(ec) {
   plot(ec$DateTime, ec$Voltage, type="l",
        xlab="datetime",
        ylab="Voltage")
}

# Function to create plot of global reactive power
GlobalReactivePowerPlot  <- function(ec) {
   plot(ec$DateTime, ec$Global_reactive_power, type="l",
        xlab="datetime",
        ylab="Global_reactive_power")
}

# Function to create plot 4 that combine 4 above plots
Plot4  <- function(ec) {
   orgPar <- par(no.readonly=TRUE)
   par(mfcol=c(2,2))
   
   Plot2(ec)
   Plot3(ec)
   VoltagePlot(ec)
   GlobalReactivePowerPlot(ec)
   
   par(orgPar)
}

############ MAIN ##################
ec <- ReadData()  # read data

# create plot on png device
png(filename="plot4.png", width=480, height=480)
Plot4(ec)
dev.off()