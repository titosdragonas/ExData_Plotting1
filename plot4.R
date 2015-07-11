## edit the file to provide full path to the unzipped data file and save it
## run with source("plot2.R")
path<-"data/household_power_consumption.txt" #where the data file is, make sure it is the unzipped version
dat<-read.csv(file=path,sep=";",na.strings = "?",skip=66637,nrows=2880, header = FALSE) #read only the rows corresponding to 2007-02-01 and 2007-02-02
colnames(dat)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3") #set the column names since we skipped the header
x<-as.POSIXlt(strptime(paste(dat$Date,dat$Time,sep=" "),"%d/%m/%Y %H:%M:%S")) #create a vector of POSIXlt dates by combining the date and time columns
png(filename = "plot4.png", width = 480, height = 480) #create a png device for the plot
par(bg=NA) #make background transparent like the example image
par(mfrow=c(2,2))
plot(x,dat$Global_active_power, type = "n", ylab = "Global Active Power", xlab="") #create the plot without data
lines(x,dat$Global_active_power) #plot the data as lines

plot(x,dat$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(x,dat$Voltage)

plot(x,dat$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab="") #create the plot without data
lines(x,dat$Sub_metering_1, col="black") #plot Sub_metering_1 data as black lines
lines(x,dat$Sub_metering_2, col="red") #plot Sub_metering_2 data as red lines
lines(x,dat$Sub_metering_3, col="blue") #plot Sub_metering_3 data as red lines
legend("topright", border="none", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=c(1,1,1), cex=0.9, bty="n") #create the legend, the cex parameter scales the legend text down

plot(x,dat$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(x,dat$Global_reactive_power)

dev.off() #close the png file
