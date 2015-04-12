

## Load the data, here we assume that the document "household_power_consumption.txt" is unzip and in the working directory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?") ## Loading the data
data <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007") ## subsetting the relevant dates
data <- na.omit(data) ## Removing NA's
data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S", tz = "") ## Concatenate Date and Time Collumn in a new collumn, and transforming both to strings
data$Date <- as.Date(data$Date,"%d/%m/%Y") ## Transform created collumn to a date format


## Make the plot

png("plot4.png", width=480, height=480, units="px", bg = "transparent") ## Calling the Graphics devices with the png requirements, and transparent background
par(mfrow=c(2,2)) ## Creating grid to plot
plot(data$Time,data$Global_active_power,
     type="l",xlab="",ylab="Global Active Power") 
plot(data$Time,data$Voltage,
     type="l",xlab="datetime",ylab="Voltage")
plot(data$Time,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),cex=0.7,lty=1)
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
plot(data$Time,data$Global_reactive_power,
     type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off() ## Closing png device




