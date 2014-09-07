if (!exists("df")) source("loadData.R")

png(filename="plot4.png", width=504, height=504)
par(mfcol=c(2,2), mar=c(5.1, 4.1, 4.1, 2.1))
    
#1
with(df, {
  plot(DateTime, Global_active_power, type="l", main="", 
       xlab="", ylab="Global Active Power");
#   lines(DateTime, Global_active_power, lwd=1)
})

#2
with(df, {
  plot(DateTime, Sub_metering_1, type="l", main="", cex.lab=1.0, cex.axis=1.0, 
       xlab="", ylab="Energy sub metering", yaxp= c(0, 30, 3));
  lines(DateTime, Sub_metering_2, col="red");
  lines(DateTime, Sub_metering_3, col="blue");
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
         col= c("black", "red", "blue"), fill="white", border = "white", box.lwd = 0);
})

#3
with(df,{
  plot(DateTime, Voltage, xlab="DateTime", type="l");
})

#4
with(df,{
  plot(DateTime, Global_reactive_power, type="l",
        xlab="DateTime");
})

dev.off()
