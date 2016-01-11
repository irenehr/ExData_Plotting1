# Load data in R.Note that you should first download and unzip dataset in your working directory. 
home_electricity <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
# Convert Date and Time variables to Date/Time classes in R (creating a new datetime value which combines date and time columns)
home_electricity$DateTime <- paste(home_electricity$Date, home_electricity$Time)
home_electricity$DateTime <- as.Date(home_electricity$DateTime, format = "%d/%m/%Y %H:%M:%S")
# subset data using dplyr package (choose data from the dates 2007-02-01 and 2007-02-02)
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)
home_electricity <- filter(home_electricity, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
# create plot1.png
png(file="plot1.png", width = 480, height = 480)
hist(home_electricity$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()