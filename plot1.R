sourceFile<-"household_power_consumption.txt"
dates<- c('1/2/2007','2/2/2007') # Dates of interest
allData<-read.table(sourceFile,header=TRUE, sep=';',colClasses = "character",comment.char='')
twoDaysData<-allData[allData$Date %in% dates,]
rm(allData) #Remove Big data.frame from Memory
twoDaysData$Global_active_power<-as.numeric(twoDaysData$Global_active_power)
png('plot1.png',width=480,height=480) # Open Device for png
hist(twoDaysData$Global_active_power,main='Global Active Power',xlab='Global Active Power (Kilowatts)',col='red')
dev.off() # Close Device