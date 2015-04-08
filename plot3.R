plot3 <- function() {
        ## Reads in the txt file and generates the third plot.
        
        ## First, reads in the txt file, reading only the rows between 2007-02-01 and 2007-02-02.
        energy <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, na.strings="?")
        names(energy) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity",
                           "sub_metering_1", "sub_metering_2", "sub_metering_3")
        
        ## Makes a new column which combines date and time:
        library(dplyr, lubridate)
        energy <- mutate(energy, date2 = dmy(date), time2 = hms(time), combo = date2 + time2)
        
        ## Creates a simplified data set with only the relevant columns: combo, sub_metering_1, sub_metering_2, and sub_metering_3
        energy2 <- select(energy, combo, sub_metering_1, sub_metering_2, sub_metering_3)
        # View(tail(energy2))
        
        ## Now, creates a line plot with 3 different lines for each sub_meter:
        png(filename= "plot3.png", width=480, height=480, units="px")
        with(energy2, plot(combo, sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
        with(energy2, lines(combo, sub_metering_1))
        with(energy2, lines(combo, sub_metering_2, col="red"))
        with(energy2, lines(combo, sub_metering_3, col="blue"))
        legend("topright", col=c("black", "red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               lty=c(1,1,1), lwd=c(2,2,2))
        dev.off()
       
        
        
        
        
        
        
        
}