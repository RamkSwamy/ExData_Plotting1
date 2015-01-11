library(data.table)

#read the file in the current working directory
DT <- fread("household_power_consumption.txt",na.strings = "?")
head(DT)

#subset the 2 days of data we want
Data <- DT[Date %in% c('1/2/2007', '2/2/2007'),]
Data


## Draw the histogram in red color and lable the axis
## and write the file to the plot1.png file
Global_active_power <- as.numeric(Data$Global_active_power)
png(filename = "plot1.png",pointsize=12)
hist(Global_active_power, col = c("red"), main = "Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()



