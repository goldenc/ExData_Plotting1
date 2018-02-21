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

png(filename='./plot1.png', width = 480, height = 480)
plot(hist(data$GlobalActivePower), col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()