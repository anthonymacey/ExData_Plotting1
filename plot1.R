source('load_function.R')

## Get Cleaned Data
clean.df <- cleanpowerds("2007-02-01", "2007-02-02") 

## Plot Histogram
png(filename="plot1.png", width = 480, height = 480)
hist(clean.df$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", col="red")
dev.off()