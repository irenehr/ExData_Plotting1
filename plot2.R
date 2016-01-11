# Load data in R.Note that you should first download and unzip dataset in your working directory. 
home_electricity <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
# Convert Date and Time variables to Date/Time classes in R (creating a new datetime value which combines date and time columns)
home_electricity$Date <- as.Date(home_electricity$Date, format = "%d/%m/%Y")
home_electricity$Time <- format(strptime(home_electricity$Time, format="%H:%M:%S"),"%H:%M:%S")
home_electricity$DateTime <- paste(home_electricity$Date, home_electricity$Time)
home_electricity$DateTime <- strptime(home_electricity$DateTime, format = "%Y-%m-%d %H:%M:%S")

# subset data using dplyr package (choose data from the dates 2007-02-01 and 2007-02-02)
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)
home_electricity <- filter(home_electricity, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))
# create plot2.png
Sys.setlocale("LC_TIME", "English")
png(file="plot2.png", width = 480, height = 480)
plot(home_electricity$DateTime, home_electricity$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()