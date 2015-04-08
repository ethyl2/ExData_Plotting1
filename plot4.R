plot4 <- function() {
        ## Reads in the txt file and generates the fourth set of plots.
        
        ## First, reads in the txt file, reading only the rows between 2007-02-01 and 2007-02-02.
        energy <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, na.strings="?")
        names(energy) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity",
                           "sub_metering_1", "sub_metering_2", "sub_metering_3")
        
        ## Makes a new column which combines date and time:
        library(dplyr, lubridate)
        energy <- mutate(energy, date2 = dmy(date), time2 = hms(time), combo = date2 + time2)
        
        ## Now, to create the set of 4 plots:
        png(filename= "plot4.png", width=480, height=480, units="px")
        par(mfrow=c(2,2), mar = c(4.9, 4.1, 2.9, 2.1), cex.lab = 0.9, oma= c(0,0.5,0,0.5))
        
        ## Creates first plot:
        with(energy, plot(combo, global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
        with(energy, lines(combo, global_active_power))
        
        ## Creates the second plot:
        with(energy, plot(combo, voltage, type = "n", ylab="Voltage", xlab="datetime"))
        with(energy, lines(combo, voltage))
        
        ## Creates the third plot:
        with(energy, plot(combo, sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
        with(energy, lines(combo, sub_metering_1))
        with(energy, lines(combo, sub_metering_2, col="red"))
        with(energy, lines(combo, sub_metering_3, col="blue"))
        legend("topright", col=c("black", "red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               lty=c(1,1,1), lwd=c(2,2,2), cex=0.5, bty="n")
        
        ## Creates the fourth plot:
        with(energy, plot(combo, global_reactive_power, type="n", xlab = "datetime", ylab="Global_reactive_power"))
        with(energy, lines(combo, global_reactive_power))
        dev.off()
}