pollutantmean <- function(directory, date) {
  # Returns the mean sulfate reading for a given date from the files in the
  # directory.  Currently set to only read the first 5 files.
  FileList <- list.files(directory, full.names = TRUE)
  # NumberFiles <- length(FileList)
  PolData <- data.frame()
  for(i in 1:5) {
    # Puts the data from all files in the directory into one data frame
    PolData <- rbind(PolData, read.csv(FileList[i]))
  } 
  DateData <- PolData[PolData[, "Date"] == date, ]  # The data for that date
  MeanSulfateDate <- mean(DateData$sulfate, na.rm = TRUE)
  # Calculate mean while stripping NAs
  MeanSulfateDate
}