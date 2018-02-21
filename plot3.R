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
png(filename='./plot3.png', width = 480, height = 480)
plot(data$DateAndTime, data$SubMetering1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateAndTime, data$SubMetering2, col='red')
lines(data$DateAndTime, data$SubMetering3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1,1,1))
dev.off()