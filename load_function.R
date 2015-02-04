library(lubridate)

cleanpowerds <- function(start, end) {
  ##some filepath variables

  ##start <- "2007-02-01"
  ##end <- "2007-02-02"
  
  ##########################################################################################################
  ## All setup data
  ##########################################################################################################
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  rawtxt <- file.path(getwd(),"data","household_power_consumption.txt")
  unziped <- file.path(getwd(),"data","powerdata.zip") 


  ## If there is no data directory make it
  if (!file.exists("data")) {
    dir.create("data")
  }
  
  ## If the file has been downloaded then git it, if not clean it and then 
  if (!file.exists(rawtxt)) {
    download.file(url, destfile=unziped)
    unzip(unziped, exdir="data", overwrite=TRUE)}
    
  ## Create dataset for plotting examples

  ## Read all the data
  unclean.df <- read.table(rawtxt, header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

  # Convert dates and times

  ## Convert the date column to Date class
  unclean.df$Date <- as.Date(unclean.df$Date, format="%d/%m/%Y")
  
  ## stick the date and time together then convert the time POSIXlt datetime format 
  unclean.df$Time <- paste(unclean.df$Date, unclean.df$Time, sep=" ")
  unclean.df$Time <- strptime(unclean.df$Time, "%Y-%m-%d %H:%M:%S")
  
  ## Return subsetted data.frame to only include dates between start & end
  return(unclean.df[unclean.df$Date >= as.Date(start) & unclean.df$Date<=as.Date(end),])
}