sourceFile<-"household_power_consumption.txt"
dates<- c('1/2/2007','2/2/2007') # Dates of interest
allData<-read.table(sourceFile,header=TRUE, sep=';',colClasses = 'character',comment.char='')
twoDaysData<-allData[allData$Date %in% dates,]
rm(allData) #Remove Big data.frame from Memory
twoDaysData$datetime<-strptime(paste(twoDaysData[,'Date'],twoDaysData[,'Time']),"%e/%m/%Y %H:%M:%S")
twoDaysData$Global_active_power<-as.numeric(twoDaysData$Global_active_power)
twoDaysData$Sub_metering_1<-as.numeric(twoDaysData$Sub_metering_1)
twoDaysData$Sub_metering_2<-as.numeric(twoDaysData$Sub_metering_2)
twoDaysData$Sub_metering_3<-as.numeric(twoDaysData$Sub_metering_3)
twoDaysData$Voltage<-as.numeric(twoDaysData$Voltage)
twoDaysData$Global_reactive_power<- as.numeric(twoDaysData$Global_reactive_power)
png('plot4.png',width=480,height=480) # Open Device for png
par(mfcol=c(2,2))
# Graphic 1
with(twoDaysData, plot(datetime,Global_active_power, type='l',xlab='',ylab='Global Active Power (kilowatts)'))

# Graphic 2
with(twoDaysData,plot(datetime,Sub_metering_1,type='l',ylab='Energy sub metering',xlab=''))
with(twoDaysData,points(datetime,Sub_metering_2,col='red',type='l'))
with(twoDaysData,points(datetime,Sub_metering_3,col='purple',type='l'))
legend('topright',pch='__',col=c('black','red','purple'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# Graphic 3
with(twoDaysData, plot(datetime,Voltage, type='l'))

# Graphic 4
with(twoDaysData, plot(datetime,Global_reactive_power, type='l'))

dev.off() # Close Device