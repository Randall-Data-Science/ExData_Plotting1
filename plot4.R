if (!exists("df", mode = "list")) source("loadData.R")

png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2), 
    mar=c(5.1, 4.1, 4.1, 2.1)
)

#1
with(df, {
  plot(DateTime, Global_active_power, type = "l", main = "", 
       xlab = "", ylab = "Global Active Power");
#   lines(DateTime, Global_active_power, lwd=1)
})

#2
with(df, {
    plot(DateTime, Sub_metering_1, type = "l", main = "", xlab = "", 
         ylab = "Energy sub metering");
    lines(DateTime, Sub_metering_2, col = "red");
    lines(DateTime, Sub_metering_3, col = "blue");
    legend(x = "topright", lty = 1, col = c("black", "red", "blue"), bty = "n", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
})

#3
with(df,{
  plot(DateTime, Voltage, xlab = "datetime", type = "l");
})

#4
with(df,{
  plot(DateTime, Global_reactive_power, type = "l",
        xlab = "datetime");
})

dev.off()
