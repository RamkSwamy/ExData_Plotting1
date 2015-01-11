library(data.table)

#read the file in the current working directory
DT <- fread("household_power_consumption.txt",na.strings = "?")
head(DT)

#subset the 2 days of data we want
Data <- DT[Date %in% c('1/2/2007', '2/2/2007'),]

Global_active_power <- as.numeric(Data$Global_active_power)
#combine date and Time
DateTime  <- as.POSIXct(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")
#write the plot to a png file
png(filename = "plot2.png",pointsize=12)
plot(DateTime,Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
dev.off()
