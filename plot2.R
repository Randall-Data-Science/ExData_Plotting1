if (!exists("df", mode = "list")) source("loadData.R")

par(mfrow=c(1,1))
png(filename="plot2.png", width=480, height=480)

with(df, {
    plot(DateTime, Global_active_power, type = "n", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(DateTime, Global_active_power, lwd=1)
})

dev.off()