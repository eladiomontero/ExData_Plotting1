plot3 <- function(){
        require(sqldf)
        ho = read.csv.sql("household_power_consumption.txt", sep = ";", sql = "select * from file where Date = '2/1/2007' or Date = '2/2/2007'")
        ho[ho == "?"]<-NA
        dates = as.Date(as.Date(ho$Date, format = "%m/%d/%Y"), format = "%Y-%m-%d")
        datetimes = paste(dates, ho$Time)
        ho$Date = strptime(datetimes, "%Y-%m-%d %H:%M:%S")
        png(filename = "plot3.png")
        with(ho, plot(Date, Sub_metering_1, type = "l", ylim = c(0,50), ylab = "Energy Sub Metering", xlab = ""))
        points(ho$Date, ho$Sub_metering_2, col = "red", type = "l")
        points(ho$Date, ho$Sub_metering_3, col = "blue", type = "l")
        legend('topright', c("sub_metering_1","sub_metering_2","sub_metering_3"), 
               lty=1, col=c('black','red', 'blue'), cex=.75)
        
        dev.off()
}