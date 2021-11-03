source("survstat_webservice.R")
library(data.table)
library(XML)
library(dplyr)
library(ISOweek)
require(RCurl)
require(stringi)

dat <- get_weekly_timeseries_one_yr(disease = "RSV-Infection", year = "2020",  region_level = "State")

write.csv(dat, file = "test.csv")