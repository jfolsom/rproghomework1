complete <- function(directory, id = 1:332) {
  # Returns the mean sulfate reading for a
  files.long <- list.files(directory, full.names = TRUE)  
  files.column <- data.frame(id)
  cases.column <- data.frame()
  for(i in id) {
    # Create a data frame column listing the number of complete cases
    mon.data <- read.csv(files.long[i])
    number.complete <- sum(complete.cases(mon.data))
    cases.column <- rbind(cases.column, number.complete)
  } 
  complete.data <- cbind(files.column, cases.column)
  colnames(complete.data) <- c("id", "nobs")
  complete.data
}