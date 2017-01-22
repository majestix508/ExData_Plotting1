library(dplyr)

#load the file
data<-read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

#Select just 2/2/2007 and 1/2/2007
data_feb<-filter(data,Date %in% c("1/2/2007","2/2/2007"))

#cleanup ram
rm(data)

#convert the date-time columns to Dates
data_feb$DateTime <- strptime(paste(data_feb$Date,data_feb$Time),"%d/%m/%Y %H:%M:%S")

#create the png graphic device
png(file = "plot3.png", width = 480, height = 480, units = "px")
#create the plot
with(data_feb,plot(DateTime, Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black"))
with(data_feb,lines(DateTime, Sub_metering_2, col="red"))
with(data_feb,lines(DateTime, Sub_metering_3, col="blue"))
#add the legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty=1)
#close the device
dev.off()