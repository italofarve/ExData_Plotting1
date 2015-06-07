## Leyendo datos
originaldata <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
originaldata$Date <- as.Date(originaldata$Date, format="%d/%m/%Y")

## Tomando subconjunto
subdata <- subset(originaldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(originaldata)

## Convertiendo
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Plot4
par(mfrow=c(2,2))
with(subdata, {
  ## Plot1
  plot(Datetime, Global_active_power,type="l", xlab="", ylab="Global Active Power")
  
  ## Plot2
  plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ## Plot3 
  plot(Datetime, Sub_metering_1, type="l",  xlab="", ylab="Energy sub metering")
  lines(Datetime, Sub_metering_2, col='Red')
  lines(Datetime, Sub_metering_3, col='Blue')
  ## cex, encoge el texto
  legend("topright", col=c("black", "red", "blue"), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1), cex=.4, bty="n")
  ## Plot4
  plot(Global_reactive_power~Datetime, type="l", 
       xlab="datetime", ylab="Global_rective_power")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()