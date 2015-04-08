plot1 <- function() {
        ## Reads in the txt file and generates the first plot
        
        ## First, reads in the txt file, reading only the rows between 2007-02-01 and 2007-02-02.
        energy <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, na.strings="?")
        names(energy) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity",
                           "sub_metering_1", "sub_metering_2", "sub_metering_3")
        
        ## Next, creates a histogram of global_active_power
        png(filename= "plot1.png", width=480, height=480, units="px")
        hist(energy$global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
        
        
        
        
        
        
        
        
}