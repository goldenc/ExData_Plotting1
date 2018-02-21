data <- read.table(
        './data/household_power_consumption.txt', 
        skip=66637, 
        nrows=2880, 
        sep = ';', 
        col.names = c(
                'Date', 
                'Time', 
                'GlobalActivePower', 
                'GlobalReactivePower', 
                'Voltage', 
                'GlobalIntensity', 
                'SubMetering1', 
                'SubMetering2', 
                'SubMetering3'))

data$DateAndTime = strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
png(filename='./plot2.png', width = 480, height = 480)
plot(data$DateAndTime, data$GlobalActivePower, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l')
dev.off()