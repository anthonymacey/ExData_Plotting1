source('load_function.R')

## Get Cleaned Data
clean.df <- cleanpowerds("2007-02-01", "2007-02-02") 

## Plot 3 multi layers & legend

png(filename="plot3.png", width = 480, height = 480)

ylimits = range(c(clean.df$Sub_metering_1, clean.df$Sub_metering_2, clean.df$Sub_metering_3))
plot(clean.df$Time, clean.df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
par(new = TRUE)
plot(clean.df$Time, clean.df$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
par(new = TRUE)
plot(clean.df$Time, clean.df$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()

