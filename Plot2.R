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


##Plot2
##By default, the png plots are 480x480 pixels in size

act <- as.numeric(as.character(sub.df$Global_active_power))

png("plot2.png")
plot(act~ sub.df$Datetime, type='l',
     ylab="Global Active Power (kilowatts)", xlab="",ylim=c(0,8))
dev.off()


