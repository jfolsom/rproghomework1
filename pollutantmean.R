pollutantmean <- function(directory, id) {
  # Returns the mean sulfate reading for a
  FileList <- list.files(directory, full.names = TRUE)  
  PolData <- data.frame()
  for(i in id) {
    # Puts the data from all files from the id list in one data frame
    PolData <- rbind(PolData, read.csv(FileList[i]))
  } 
  MeanSulfate <- mean(PolData$sulfate, na.rm = TRUE)
  # Calculate mean while stripping NAs
  MeanSulfate
}