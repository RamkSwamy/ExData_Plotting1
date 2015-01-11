library(data.table)

#read the file in the current working directory
DT <- fread("household_power_consumption.txt",na.strings = "?")
head(DT)

#subset the 2 days of data we want
Data <- DT[Date %in% c('1/2/2007', '2/2/2007'),]

Global_active_power <- as.numeric(Data$Global_active_power)
#combine date and Time
DateTime  <- as.POSIXct(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")

submet1<- as.numeric(Data$Sub_metering_1)
submet2 <- as.numeric(Data$Sub_metering_2)
submet3 <- as.numeric(Data$Sub_metering_3)

#- open the device - write the plot to a png file 
png(filename = "plot4.png",pointsize=12)
#split screen
par(mfcol=c(2,2))
#write First plot
plot(DateTime,Global_active_power,type="l", ylab="Global Active Power", xlab= "")

#write second plot Sub metering
plot(DateTime,submet1,type="l", ylab="Energy sub metering", xlab= "")
lines(DateTime,submet2,type="l" ,col = c("red"))
lines(DateTime,submet3,type="l",col = c("blue") )
legend("topright", lty = c(1, 1, 1), col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bg = "transparent", box.col = "transparent")

#write the Third plot Volatge

Voltage <-  as.numeric(Data$Voltage)
plot(DateTime,Voltage,type="l", ylab="Voltage" , xlab="datetime")

#write the 4th plot Global reactive power
Global_reactive_power <- as.numeric(Data$Global_reactive_power)
plot(DateTime,Global_reactive_power,type="l",  xlab="datetime")

dev.off()

