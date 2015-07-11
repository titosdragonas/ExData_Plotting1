## edit the file to provide full path to the unzipped data file and save it
## run with source("plot1.R")
path<-"data/household_power_consumption.txt" #where the data file is, make sure it is the unzipped version
dat<-read.csv(file=path,sep=";",na.strings = "?",skip=66637,nrows=2880, header = FALSE) #read only the rows corresponding to 2007-02-01 and 2007-02-02
colnames(dat)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3") #set the column names since we skipped the header
png(filename = "plot1.png", width = 480, height = 480) #create a png device for the plot
par(bg=NA) #make background transparent like the example image
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)") #create a histogram of Global Active Power
dev.off() #close the png file
