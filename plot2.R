source('load_function.R')

## Get Cleaned Data
clean.df <- cleanpowerds("2007-02-01", "2007-02-02") 

## Plot 
png(filename="plot2.png", width = 480, height = 480)
plot(clean.df$Time, clean.df$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()