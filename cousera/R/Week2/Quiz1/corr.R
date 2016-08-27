corr <- function(directory, threshold=0) {
  df <- complete(directory)
  ids = df[df["Nobs"] > threshold, ]$Id
  corrs = numeric()
  for (id in ids) {
    fileName <- sprintf("%03d.csv",id)
    filePath <- paste(directory,"/",fileName,sep="")
    tempData <- na.omit(read.csv(filePath,header=TRUE,sep=","))
    cdf = tempData[complete.cases(tempData), ]
    corrs = c(corrs, cor(cdf$sulfate, cdf$nitrate))
  }
  return(corrs)
}