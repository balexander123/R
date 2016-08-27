complete <- function(directory, ids = 1:332) {
  nobs_df <- data.frame(Id=integer(0),Nobs=integer(0))
  for (id in ids) {
    fileName <- sprintf("%03d.csv",id)
    filePath <- paste(directory,"/",fileName,sep="")
    tempData <- na.omit(read.csv(filePath,header=TRUE,sep=","))
    nobs_df[nrow(nobs_df)+1,] <- c(id,nrow(tempData))
  }
  nobs_df
}