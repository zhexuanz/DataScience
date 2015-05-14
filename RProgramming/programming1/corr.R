corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  x <- numeric(0)
  
  df_complete <- complete(directory)
    
  df_meet <- subset(df_complete,nobs>threshold)
  
  for (i in df_meet$id) {
    df <- read.csv(paste("./",directory,"/",sprintf("%03d", i),".csv",sep=""))
    x <- c(x,cor(df$sulfate, df$nitrate , use="complete.obs"))
  }
  x
  
}