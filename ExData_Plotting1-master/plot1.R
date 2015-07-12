


## Getting full dataset
TableData <- read.table("Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
TableData$Date <- as.Date(TableData$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(TableData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(TableData)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="figure/plot1.png", height=480, width=480)
dev.off()

