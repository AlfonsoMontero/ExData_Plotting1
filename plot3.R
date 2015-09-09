sourceFile<-"household_power_consumption.txt"
dates<- c('1/2/2007','2/2/2007') # Dates of interest
allData<-read.table(sourceFile,header=TRUE, sep=';',colClasses = 'character',comment.char='')
twoDaysData<-allData[allData$Date %in% dates,]
rm(allData) #Remove Big data.frame from Memory
twoDaysData$Sub_metering_1<-as.numeric(twoDaysData$Sub_metering_1)
twoDaysData$Sub_metering_2<-as.numeric(twoDaysData$Sub_metering_2)
twoDaysData$Sub_metering_3<-as.numeric(twoDaysData$Sub_metering_3)
twoDaysData$datetime<-strptime(paste(twoDaysData[,'Date'],twoDaysData[,'Time']),"%e/%m/%Y %H:%M:%S")
png('plot3.png',width=480,height=480) # Open Device for png
with(twoDaysData,plot(datetime,Sub_metering_1,type='l',ylab='Energy sub metering',xlab=''))
with(twoDaysData,points(datetime,Sub_metering_2,col='red',type='l'))
with(twoDaysData,points(datetime,Sub_metering_3,col='purple',type='l'))
legend('topright',col=c('black','red','purple'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty='solid')
dev.off() # Close Device