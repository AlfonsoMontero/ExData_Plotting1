sourceFile<-"household_power_consumption.txt"
dates<- c('1/2/2007','2/2/2007') # Dates of interest
allData<-read.table(sourceFile,header=TRUE, sep=';',colClasses = 'character',comment.char='')
twoDaysData<-allData[allData$Date %in% dates,]
rm(allData) #Remove Big data.frame from Memory
twoDaysData$Global_active_power<-as.numeric(twoDaysData$Global_active_power)
twoDaysData$datetime<-strptime(paste(twoDaysData[,'Date'],twoDaysData[,'Time']),"%e/%m/%Y %H:%M:%S")
png('plot2.png',width=480,height=480) # Open Device for png
with(twoDaysData, plot(datetime,Global_active_power, type='l',xlab='',ylab='Global Active Power (kilowatts)'))
dev.off() # Close Device