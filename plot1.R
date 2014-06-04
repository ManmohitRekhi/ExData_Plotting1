#FOR READING THE RELAVENT DATA FROM THE FILE

dataTable <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", colClasses="character", col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")))

#CONVERTING ALL THE "?" TO "NA"

for( i in 1:9) 
{
  dataTable[dataTable[, i] == "?"] <- "NA"
}

#CONVERTING COLOUMS 3 TO 9 NEED TO BE NUMERIC

for(i in 3:9)
{
  dataTable[, i] <- as.numeric(dataTable[, i])
}

#FOR PLOTTING THE HISTOGRAM IN plot1.png WITH THE GIVEN REQUIRMENTS

png(filename = "plot1.png", height = 480, width = 480)
par(bg = "transparent")

hist(dataTable$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()