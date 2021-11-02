# library(desurvdata)

source("survstat_webservice.R")
library(data.table)
library(XML)
library(dplyr)
library(ISOweek)
require(RCurl)
require(stringi)

today <- Sys.Date()

# dis <- get_diseases()

years <- as.character(year(Sys.Date()) - 0:2)

########## RSV
dir.create("RSV_Infection")

dat_rsv_age <- get_weekly_timeseries(disease = "RSV-Infection", years = years, 
                                     region_level = "Age stratification: 1 year intervals")
write.csv(dat_rsv_age, file = paste0("RSV_Infection/RSV_Infection-age-", today, ".csv"), row.names = FALSE)


# dat_rsv_states <- get_weekly_timeseries(disease = "RSV-Infection", years = years, 
#                                         region_level = "State")
# write.csv(dat_rsv_states, file = paste0("RSV_Infection/RSV_Infection-states-", today, ".csv"), row.names = FALSE)
# 
# 
# ########## Seasonal influenza
# 
# dir.create("Seasonal_Influenza")
# 
# dat_influenza_age <- get_weekly_timeseries(disease = "Influenza, saisonal", years = years, 
#                                            region_level = "Age stratification: 1 year intervals")
# write.csv(dat_influenza_age, file = paste0("Seasonal_Influenza/Seasonal_Influenza-age-", today, ".csv"), row.names = FALSE)
# 
# dat_influenza_states <- get_weekly_timeseries(disease = "Influenza, saisonal", year = "2020",
#                                               region_level = "State")
# write.csv(dat_influenza_states, file = paste0("Seasonal_Influenza/Seasonal_Influenza-states-", today, ".csv"), row.names = FALSE)
# 
# 
# ########## Pneumococcal disease
# 
# dir.create("Pneumococcal_Disease")
# 
# 
# dat_pneumococcal_age <- get_weekly_timeseries(disease = "Pneumococcal invasive disease", years = years, 
#                                               region_level = "Age stratification: 1 year intervals")
# write.csv(dat_pneumococcal_age, file = paste0("Pneumococcal_Disease/Pneumococcal_Disease-age-", today, ".csv"), row.names = FALSE)
# 
# dat_pneumococcal_states <- get_weekly_timeseries(disease = "Pneumococcal invasive disease", years = "2020",
#                                                  region_level = "State")
# write.csv(dat_pneumococcal_states, file = paste0("Pneumococcal_Disease/Pneumococcal_Disease-states-", today, ".csv"), row.names = FALSE)
