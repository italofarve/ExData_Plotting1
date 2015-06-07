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

## Plot2
plot(subdata$Datetime, subdata$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()