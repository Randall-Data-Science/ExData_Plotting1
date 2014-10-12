if (!exists("df", mode = "list")) source("loadData.R")

par(mfrow = c(1, 1))
png(filename="plot3.png", width=480, height=480)

with(df, {
  plot(DateTime, Sub_metering_1, type="l", main="", cex.lab=1.0, cex.axis=1.0, 
       xlab="", ylab="Energy sub metering", yaxp= c(0, 30, 3));
  lines(DateTime, Sub_metering_2, col="red");
  lines(DateTime, Sub_metering_3, col="blue");
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
         col= c("black", "red", "blue"), cex=1.0, pt.cex=1.0, bty="o");
})

dev.off()