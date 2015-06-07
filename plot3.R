## Leyendo datos
originaldata <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
originaldata$Date <- as.Date(originaldata$Date, format="%d/%m/%Y")

## Tomando subconjunto
subdata <- subset(originaldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(originaldata)

## Convirtiendo
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Plot3
with(subdata, {
  plot(Sub_metering_1~Datetime, type="l", xlab="",
       ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=c(1,1), lwd=c(1,1), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()