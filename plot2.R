if (!exists("df")) source("loadData.R")

par(mfrow=c(1,1))
png(filename="plot2.png", width=504, height=504)

with(df, {
    plot(DateTime, Global_active_power, type="n", main="", cex.lab=1,
         cex.axis=1, xlab="", ylab="Global Active Power (kilowatts)");
    lines(DateTime, Global_active_power, lwd=1)
})

dev.off()