pollutantmean <- function(directory, pollutant, ids = 1:332) {
  pollutantData <- data.frame()
  for (id in ids) {
    fileName <- sprintf("%03d.csv",id)
    filePath <- paste(directory,"/",fileName,sep="")
    tempData = read.csv(filePath,header=TRUE,sep=",")
    pollutantData <- rbind(pollutantData, tempData)
  }
  mean(pollutantData[,pollutant], na.rm = TRUE)
}