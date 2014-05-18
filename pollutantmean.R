pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Returns the mean sulfate reading for a
  file.list <- list.files(directory, full.names = TRUE)  
  pol.data <- data.frame()
  for(i in id) {
    # Puts the data from all files from the id list in one data frame
    pol.data <- rbind(pol.data, read.csv(file.list[i]))
  } 
  mean.pollutant <- mean(pol.data[, pollutant], na.rm = TRUE)
  # Calculate mean while stripping NAs
  mean.pollutant <- round(mean.pollutant, 3)
  mean.pollutant
}