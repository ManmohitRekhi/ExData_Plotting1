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

#FOR CONVETRING DATE TIME INTO THE REQUIRED FORMAT

datetime <- strptime(paste(dataTable$Date, dataTable$Time), format= '%d/%m/%Y %H:%M:%S')

#FOR PLOTTING THE DATA IN plot2.png IN THE REQUIRED FORMAT

png(filename = "plot2.png", height = 480, width = 480)
par(bg = "transparent")

plot(datetime, dataTable$Global_active_power, type= "l",xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()