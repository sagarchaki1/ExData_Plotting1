setwd("~/Nandini/Coursera/Specialization_Data Science/4.Exploratory Data Analysis/Project1")

data1 <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                    header=TRUE, sep=";")

data1$Date <- as.Date(data1$Date,"%d/%m/%Y") 


# Subsetting for the dates 2007-02-01 and 2007-02-02
sub.df = subset(data1, Date == '2007-02-01' | 
                  Date == '2007-02-02')
##2880 rows



## Converting dates
datetime <- paste(as.Date(sub.df$Date), sub.df$Time)
sub.df$Datetime <- as.POSIXct(datetime)

##Plot3
##By default, the png plots are 480x480 pixels in size

sub1 <- as.numeric(as.character(sub.df$Sub_metering_1))
sub2 <- as.numeric(as.character(sub.df$Sub_metering_2))
sub3 <- as.numeric(as.character(sub.df$Sub_metering_3))

png("plot3.png")
plot(sub1~ sub.df$Datetime, type='l',
     ylab="Energy sub metering", xlab="", ylim=c(0,40))
lines(sub2~ sub.df$Datetime, type='l',col="red")
lines(sub3~ sub.df$Datetime, type='l',col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()
