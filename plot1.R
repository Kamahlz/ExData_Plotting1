## Histogram of the variable Global Active Power

## Load the data, here we assume that the document "household_power_consumption.txt" is unzip and in the working directory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?") ## Loading the data
data <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007") ## subsetting the relevant dates
data <- na.omit(data) ## Removing NA's

## Make the plot
png("plot1.png", width=480, height=480, units="px", bg = "transparent") ## Calling the Graphics devices with the png requirements, and transparent background
hist(data$Global_active_power,  
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red") ## Histogram for the variable Global Active Power with the requeriments
dev.off() ## Closing png device




