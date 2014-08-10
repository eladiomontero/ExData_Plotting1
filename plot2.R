plot2 <- function(){
        require(sqldf)
        ho = read.csv.sql("household_power_consumption.txt", sep = ";", sql = "select * from file where Date = '2/1/2007' or Date = '2/2/2007'")
        ho[ho == "?"]<-NA
        dates = as.Date(as.Date(ho$Date, format = "%m/%d/%Y"), format = "%Y-%m-%d")
        datetimes = paste(dates, ho$Time)
        ho$Date = strptime(datetimes, "%Y-%m-%d %H:%M:%S")
        png(filename = "plot2.png")
        with(ho, plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)"))
        dev.off()
}