plot3 <- function(){
  dados <- data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')))
  #Transformando as Data
  dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
  #Limitando o conjunto
  dados <- subset(dados,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  #tirando NA cados
  dados <- na.omit(dados)
  #copiando a data
  dados$Date <- as.POSIXct(paste(dados$Date,dados$Time))
  dados <- dados[-2]
  
  par(mfrow=c(1,1))
  with(dados, plot(Date,Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
  with(dados,lines(Date,Sub_metering_2,col='Red'))  
  with(dados,lines(Date,Sub_metering_3,col='Blue'))
  legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
}