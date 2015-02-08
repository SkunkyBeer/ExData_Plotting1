x<-read.csv("household_power_consumption.txt", na.strings="?", sep=";", comment.char="")
rows.keep <- (x[,1] == "1/2/2007")|(x[,1] == "2/2/2007")
csv<-x[rows.keep,]
timestamp <- as.POSIXlt(paste(as.Date(csv[,1],"%d/%m/%Y"),csv[,2],sep=" "))
csv<- cbind(timestamp,csv[,3:ncol(csv)])
#write.csv(csv,"cropped_data.csv", row.names = FALSE)
rm(x)
rm(timestamp)
rm(rows.keep)
#rm(csv)
gc()

IsFile <- TRUE

if (IsFile) {
    png(filename="plot3.png")
} else {dev.off()
}

plot(
  x=csv$timestamp
  , xlab=""
  , y=csv$Sub_metering_1
  , ylab="Energy sub metering"
  , ylim=c(0,32)
  , yaxp=c(0,30,3)
  , type="l"
  , col="black"
  )


par(new=TRUE)
plot(
    x=csv$timestamp
    , xlab=""
    , y=csv$Sub_metering_2
    , ylab="Energy sub metering"
    , ylim=c(0,32)
    , yaxp=c(0,30,3)
    , type="l"
    , col="red"
)

par(new=TRUE)
plot(
    x=csv$timestamp
    , xlab=""
    , y=csv$Sub_metering_3
    , ylab="Energy sub metering"
    , ylim=c(0,32)
    , yaxp=c(0,30,3)
    , type="l"
    , col="blue"
)

legend(
    "topright"
    , legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
    , lty = c(1,1,1)
    , lwd = c(2.5,2.5,2.5)
    , col = c("black", "red","blue")
)

if (IsFile) dev.off()
