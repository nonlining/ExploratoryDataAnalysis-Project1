
powerData <- read.table("./household_power_consumption.txt", stringsAsFactors = F ,header =TRUE, sep =';')

date <- paste(powerData$Date, powerData$Time)
date <- strptime(date, "%d/%m/%Y %H:%M:%S")
powerData$Date = date

selectDataRange <- powerData[as.Date(date) >= as.Date("2007-02-01") & as.Date(date) <= as.Date("2007-02-02"),]
selectDataRange$Global_active_power <- as.numeric(selectDataRange$Global_active_power)

png(filename = "plot3.png",width = 480, height = 480)

plot(selectDataRange$Date, selectDataRange$Sub_metering_1,xlab = "", ylab = "Energy sub metering",type = "l")
lines(selectDataRange$Date, selectDataRange$Sub_metering_2,xlab = "", col = "red")
lines(selectDataRange$Date, selectDataRange$Sub_metering_3,xlab = "", col = "blue")
legend("topright","group",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1),col=c("black" ,"blue","red"))

dev.off()

