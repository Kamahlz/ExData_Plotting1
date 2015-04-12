

## Load the data, here we assume that the document "household_power_consumption.txt" is unzip and in the working directory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?") ## Loading the data
data <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007") ## subsetting the relevant dates
data <- na.omit(data) ## Removing NA's
data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S", tz = "") ## Concatenate Date and Time Collumn in a new collumn, and transforming both to strings
data$Date <- as.Date(data$Date,"%d/%m/%Y") ## Transform created collumn to a date format


## Make the plot

png("plot2.png", width=480, height=480, units="px", bg = "transparent") ## Calling the Graphics devices with the png requirements, and transparent background

plot(data$Time,data$Global_active_power,
     type="l",xlab="",ylab="Global Active Power (kilowatts)") ##Plotting the line graph

dev.off() ## Closing png device




