if (!exists("df")) source("loadData.R")

par(mfrow=c(1,1))
png(filename="plot1.png", width=504, height=504)

with(data = df,
     hist(
         Global_active_power, 
         col="red", 
         xlab="Global Active Power (kilowatts)", 
         main = "Global Active Power")
)

dev.off()