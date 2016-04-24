
powerData <- read.table("./household_power_consumption.txt", stringsAsFactors = F ,header =TRUE, sep =';')

date <- paste(powerData$Date, powerData$Time)
date <- strptime(date, "%d/%m/%Y %H:%M:%S")
powerData$Date = date

selectDataRange <- powerData[as.Date(date) >= as.Date("2007-02-01") & as.Date(date) <= as.Date("2007-02-02"),]
selectDataRange$Global_active_power <- as.numeric(selectDataRange$Global_active_power)

png(filename = "plot2.png",width = 480, height = 480)

plot(selectDataRange$Date, selectDataRange$Global_active_power,xlab = "", ylab = "Gloabal Active Power(kilowatts)",type = "l")

dev.off()