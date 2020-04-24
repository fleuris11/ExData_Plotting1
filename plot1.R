library("data.table")

setwd("~")

                                                                       #
powerDT <- data.table::fread(input = "household_power_consumption.txt" # Reads in data from file then subsets data for specified dates
                             , na.strings="?"                          #
                             )


powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]# Prevents histogram from printing in scientific notation

                                                                        #
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]# Change Date Column to Date Type
                                                                        #

powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]# Filter Dates for 2007-02-01 and 2007-02-02
                                                                   #                                                                    
png("plot1.png", width=480, height=480)

## Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()