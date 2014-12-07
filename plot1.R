if (!exists("df", mode = "list")) source("loadData.R")

# `df` is a dataframe loaded by `loadData.R` if not already present in the
# current environment. It has the following structure:

# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':    2880 obs. of  8 variables:
# $ DateTime             : POSIXct, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" "2007-02-01 00:03:00" ...
# $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
# $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
# $ Voltage              : num  243 243 244 244 243 ...
# $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

par(mfrow=c(1,1))
png(filename="plot1.png", width=480, height=480)
# For whatever reason the plots are 504x504 px, but the directions
# specify 480x480 px.

with(data = df,
     hist(Global_active_power, col="red", 
          xlab="Global Active Power (kilowatts)", 
          main = "Global Active Power"
     )
)

dev.off()