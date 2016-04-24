# This R script source code is for exploratory data analysis first week project 
# Author : Min-Jung wang
# 4/23/2016

#fetch data from url

dataDirectory<-"household_power_consumption.txt"

if (!file.exists(dataDirectory)) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  tempfile <- "./tempData.zip"
  download.file(url,tempfile)
  unzip(tempfile)
  unlink(tempfile)
}

# read table
powerData <- read.table("./household_power_consumption.txt", stringsAsFactors = F ,header =TRUE, sep =';')

date <- paste(powerData$Date, powerData$Time)
date <- strptime(date, "%d/%m/%Y %H:%M:%S")
powerData$Date = date

# get data in range 2007-02-01 to 2007-02-02

selectDataRange <- powerData[as.Date(date) >= as.Date("2007-02-01") & as.Date(date) <= as.Date("2007-02-02"),]
selectDataRange$Global_active_power <- as.numeric(selectDataRange$Global_active_power)

#save plot to png
png(filename = "plot3.png",width = 480, height = 480)

plot(selectDataRange$Date, selectDataRange$Sub_metering_1,xlab = "", ylab = "Energy sub metering",type = "l")
lines(selectDataRange$Date, selectDataRange$Sub_metering_2,xlab = "", col = "red")
lines(selectDataRange$Date, selectDataRange$Sub_metering_3,xlab = "", col = "blue")
legend("topright","group",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1),col=c("black" ,"blue","red"))

dev.off()

