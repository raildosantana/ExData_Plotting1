plot2 <- function(){
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
  plot(dados$Date,dados$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png,"plot2.png", width=480, height=480)
  dev.off()
}