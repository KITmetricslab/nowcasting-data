# setwd("~/Documents/RESPINOW/play_survstat/")

# get relevant libraries and functions:
source("survstat_webservice.R")
library(data.table)
library(XML)
library(dplyr)
library(ISOweek)
require(RCurl)
require(stringi)

# function to get day and time of day of current RKI release
get_time_last_update <- function(message = FALSE){
  available_versions <- getHierarchyMembers("SurvStat", "English", "Data status as published in")
  current <- available_versions$Caption[1]
  cat("Data status to be displayed:", current, "- returning as character vector.\n")
  status_date <- substr(current, 10, 19)
  status_time <- substr(current, 21, 28)
  return(c(date = status_date, time = status_time))
}

# function to get day and time of day of our request
get_time_request <- function(message = FALSE){
  current_time <- as.character(Sys.time())
  request_date <- substr(current_time, 1, 10)
  request_time <- substr(current_time, 12, 19)
  return(c(date = request_date, time = request_time))
}

# get times of last RKI update and request
time_last_update <- get_time_last_update(message = TRUE)
time_request <- get_time_request(message = TRUE)
already_updated <- time_last_update["date"] == time_request["date"]

# arrange into data.frame:
to_add <- data.frame(date_request = time_request["date"],
                     time_request = time_request["time"],
                     date_last_rki_update = time_last_update["date"],
                     time_last_rki_update = time_last_update["time"],
                     already_updated = already_updated)

# read in old version of summary table and add new line (or create new file)
fl <- "commits_and_updates.csv"
if(file.exists(fl)){
  tab <- read.csv("commits_and_updates.csv")
  tab <- rbind(tab, to_add)
}else{
  tab <- to_add
}

# write out
write.csv(tab, file = fl, row.names = FALSE, quote = FALSE)

