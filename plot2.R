plot2 <- function() {
        ## Reads in the txt file and generates the second plot.
        
        ## First, reads in the txt file, reading only the rows between 2007-02-01 and 2007-02-02.
        energy <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, na.strings="?")
        names(energy) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity",
                           "sub_metering_1", "sub_metering_2", "sub_metering_3")
        
        ## Makes a new column which combines date and time:
        library(dplyr, lubridate)
        energy <- mutate(energy, date2 = dmy(date), time2 = hms(time), combo = date2 + time2)
        
        ## Creates a simplified data set with only the 2 relevant columns: combo and global_active_power
        energy2 <- select(energy, combo, global_active_power)
        # View(head(energy2))
        
        ## Now, creates a line plot of combo on x-axis and global_active_power on y-axis:
        png(filename= "plot2.png", width=480, height=480, units="px")
        with(energy2, plot(combo, global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
        with(energy2, lines(combo, global_active_power))
        dev.off()
        
        
        
        
        
        
}