## Leyendo datos
originaldata <- read.csv("./data/household_power_consumption.txt", header=T, sep=';',
                         na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                         comment.char="", quote='\"')
originaldata$Date <- as.Date(originaldata$Date, format="%d/%m/%Y")

## Tomando un subconjunto
subdata <- subset(originaldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(originaldata)

## Convirtiendo 
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Plot1
hist(subdata$Global_active_power, main=paste("Global Active Power"),
     xlab="Global Active Powers (kilowatts)", ylab="Frequency", col="Red")

## Guardando archivo plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
