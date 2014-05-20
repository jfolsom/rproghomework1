corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  Files.Long <- list.files(directory, full.names = TRUE)
  Corr.Vector <- vector(mode = "numeric")
  
  for(i in 1:length(Files.Long)) {
    Monitor.Data <- read.csv(Files.Long[i])
    Number.Complete <- sum(complete.cases(Monitor.Data))
    if(Number.Complete >= threshold) {
      Correlation <- cor(Monitor.Data$sulfate, Monitor.Data$nitrate,
                         use = "pairwise.complete.obs")
      Corr.Vector <- c(Corr.Vector, Correlation)
    }
  }
  Corr.Vector <- Corr.Vector[!is.na(Corr.Vector)] 
  Corr.Vector
}