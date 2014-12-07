if (!exists("df", mode = "list")) source("loadData.R")

par(mfrow = c(1, 1))
png(filename="plot3.png", width=480, height=480)

with(df, {
  plot(DateTime, Sub_metering_1, type = "l", main = "", xlab = "", 
       ylab = "Energy sub metering");
  lines(DateTime, Sub_metering_2, col = "red");
  lines(DateTime, Sub_metering_3, col = "blue");
  legend(x = "topright", lty = 1, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
})

dev.off()