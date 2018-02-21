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
png(filename='./plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))
plot(data$DateAndTime, data$GlobalActivePower, xlab = '', ylab = 'Global Active Power', type = 'l')

plot(data$DateAndTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')

plot(data$DateAndTime, data$SubMetering1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateAndTime, data$SubMetering2, col='red')
lines(data$DateAndTime, data$SubMetering3, col='blue')

plot(data$DateAndTime, data$GlobalReactivePower, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()