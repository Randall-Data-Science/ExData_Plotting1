if (!require("dplyr")) {install.packages("dplyr"); library(dplyr)}
## See notes on Dplyr at end
if (!file.exists("data/household_power_consumption.txt")) {
    download.file(
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
        method = "curl", destfile = "temp.zip", quiet = TRUE)
    unzip(zipfile = "temp.zip", exdir = "data")
    file.remove("temp.zip")
}

#parse data
df <- read.table(file = "data/household_power_consumption.txt", 
                 na.strings = "?", header = TRUE, sep = ";", nrows = 20)
colClasses <- sapply(X = df, FUN = class)
colClasses[1:2] <- rep("character", 2)
df <- tbl_df(read.table(file = "data/household_power_consumption.txt", 
        header = TRUE, na.strings = "?", sep = ";", nrow = 2.1e6, 
        colClasses = colClasses))

# Subset relevant dates
df <- subset(x = df, subset = Date %in% c("1/2/2007", "2/2/2007"))

# Create DateTime Index
df <- mutate(.data = df, DateTime = as.POSIXct(
    paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
)

#Clean Columns
df <- select(.data = df, DateTime, Global_active_power, Global_reactive_power, 
             Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, 
             Sub_metering_3
)

## Dplyr is a library created by Hadley Wickham as a next generation replacement
## for his collection of data manipulation functions in plyr. The most notable
## improvements are significantly faster speed similar to `data.table`, and the 
## use of a "pipe" operator from `magrittr`. The pipe operation written as 
## `%>%` makes it possible to flatten nested functions. For example:
##
##     rep(sqrt(sqrt(16)), 3)  # =>  [1] 2 2 2
## 
## can be written:
##
##     sqrt(16) %>% sqrt() %>% rep(3) # =>  [1] 2 2 2
##
## Though not very useful in this example, it can be very convenient when 
## nesting multiple operations on data.