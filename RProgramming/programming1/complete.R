complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  nobsvec = integer(0)
  
  for (i in id) {
    df <- read.csv(paste("./",directory,"/",sprintf("%03d", i),".csv",sep=""))
    nobsvec <- c(nobsvec,sum((!is.na(df$sulfate)) * (!is.na(df$nitrate))))
  }
  
  data.frame(id = id, nobs = nobsvec)
}