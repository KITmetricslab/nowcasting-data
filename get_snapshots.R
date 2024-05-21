# library(desurvdata)

source("survstat_webservice.R")
library(data.table)
library(XML)
library(dplyr)
library(ISOweek)
require(RCurl)
require(stringi)

today <- Sys.Date()

time_of_last_update <- function(message = FALSE){
  available_versions <- getHierarchyMembers("SurvStat", "English", "Data status as published in")
  current <- available_versions$Caption[1]
  cat("Data status to be displayed:", current, "- returning as date. \n")
  current <- as.Date(substr(current, 10, 19))
  return(current)
}

time_of_last_update(message = TRUE)

# dis <- get_diseases()

# define years to load. Note: For some pathogens we can only start in 2024
years <- year(Sys.Date()) - 0:2
years_short <- years[years >= 2024]
years <- as.character(years)
years_short <- as.character(years_short)


########## RSV
try({
dir.create("RSV_Infection")

dat_rsv_age <- get_weekly_timeseries(disease = "RSV (Meldepflicht gemäß IfSG)", years = years_short,
                                     region_level = "Age stratification: 1 year intervals")

write.csv(dat_rsv_age, file = paste0("RSV_Infection/RSV_Infection-age-", today, ".csv"), row.names = FALSE)


dat_rsv_states <- get_weekly_timeseries(disease = "RSV (Meldepflicht gemäß IfSG)", years = years_short,
                                        region_level = "State")
write.csv(dat_rsv_states, file = paste0("RSV_Infection/RSV_Infection-states-", today, ".csv"), row.names = FALSE)
})


########## Seasonal influenza
try({
dir.create("Seasonal_Influenza")

dat_influenza_age <- get_weekly_timeseries(disease = "Influenza, saisonal", years = years, 
                                           region_level = "Age stratification: 1 year intervals")
write.csv(dat_influenza_age, file = paste0("Seasonal_Influenza/Seasonal_Influenza-age-", today, ".csv"), row.names = FALSE)

dat_influenza_states <- get_weekly_timeseries(disease = "Influenza, saisonal", years = years,
                                              region_level = "State")
write.csv(dat_influenza_states, file = paste0("Seasonal_Influenza/Seasonal_Influenza-states-", today, ".csv"), row.names = FALSE)
})


########## Pneumococcal disease
try({
dir.create("Pneumococcal_Disease")


dat_pneumococcal_age <- get_weekly_timeseries(disease = "Pneumokokken (Meldepflicht gemäß IfSG)", years = years_short,
                                              region_level = "Age stratification: 1 year intervals")
 write.csv(dat_pneumococcal_age, file = paste0("Pneumococcal_Disease/Pneumococcal_Disease-age-", today, ".csv"), row.names = FALSE)

dat_pneumococcal_states <- get_weekly_timeseries(disease = "Pneumokokken (Meldepflicht gemäß IfSG)", years = years_short,
                                                 region_level = "State")
write.csv(dat_pneumococcal_states, file = paste0("Pneumococcal_Disease/Pneumococcal_Disease-states-", today, ".csv"), row.names = FALSE)
})


########## Norovirus
try({
dir.create("Noroviral_Gastroenteritis")


dat_noro_age <- get_weekly_timeseries(disease = "Noroviral gastroenteritis", years = years, 
                                      region_level = "Age stratification: 1 year intervals")
write.csv(dat_noro_age, file = paste0("Noroviral_Gastroenteritis/Noroviral_Gastroenteritis-age-", today, ".csv"), row.names = FALSE)

dat_noro_states <- get_weekly_timeseries(disease = "Noroviral gastroenteritis", years = years,
                                         region_level = "State")
write.csv(dat_noro_states, file = paste0("Noroviral_Gastroenteritis/Noroviral_Gastroenteritis-states-", today, ".csv"), row.names = FALSE)
})


########## Rotavirus
try({
dir.create("Rotavirus_Gastroenteritis")


dat_rota_age <- get_weekly_timeseries(disease = "Rotavirus gastroenteritis", years = years, 
                                      region_level = "Age stratification: 1 year intervals")
write.csv(dat_rota_age, file = paste0("Rotavirus_Gastroenteritis/Rotavirus_Gastroenteritis-age-", today, ".csv"), row.names = FALSE)

dat_rota_states <- get_weekly_timeseries(disease = "Rotavirus gastroenteritis", years = years,
                                         region_level = "State")
write.csv(dat_rota_states, file = paste0("Rotavirus_Gastroenteritis/Rotavirus_Gastroenteritis-states-", today, ".csv"), row.names = FALSE)
})


########## Listeriosis
try({
dir.create("Listeriosis")


dat_listeriosis_age <- get_weekly_timeseries(disease = "Listeriosis", years = years, 
                                             region_level = "Age stratification: 1 year intervals")
write.csv(dat_listeriosis_age, file = paste0("Listeriosis/Listeriosis-age-", today, ".csv"), row.names = FALSE)

dat_listeriosis_states <- get_weekly_timeseries(disease = "Listeriosis", years = years,
                                                region_level = "State")
write.csv(dat_listeriosis_states, file = paste0("Listeriosis/Listeriosis-states-", today, ".csv"), row.names = FALSE)
})


########## Salmonellosis
try({
dir.create("Salmonellosis")


dat_salmonellosis_age <- get_weekly_timeseries(disease = "Salmonellosis", years = years, 
                                               region_level = "Age stratification: 1 year intervals")
write.csv(dat_salmonellosis_age, file = paste0("Salmonellosis/Salmonellosis-age-", today, ".csv"), row.names = FALSE)

dat_salmonellosis_states <- get_weekly_timeseries(disease = "Salmonellosis", years = years,
                                                  region_level = "State")
write.csv(dat_salmonellosis_states, file = paste0("Salmonellosis/Salmonellosis-states-", today, ".csv"), row.names = FALSE)
})


########## Campylobacteriosis
try({
dir.create("Campylobacteriosis")


dat_campylobacteriosis_age <- get_weekly_timeseries(disease = "Campylobacteriosis", years = years, 
                                                    region_level = "Age stratification: 1 year intervals")
write.csv(dat_campylobacteriosis_age, file = paste0("Campylobacteriosis/Campylobacteriosis-age-", today, ".csv"), row.names = FALSE)

dat_campylobacteriosis_states <- get_weekly_timeseries(disease = "Campylobacteriosis", years = years,
                                                       region_level = "State")
write.csv(dat_campylobacteriosis_states, file = paste0("Campylobacteriosis/Campylobacteriosis-states-", today, ".csv"), row.names = FALSE)
})


########## Meningococcal disease
try({
dir.create("Meningococcal_Disease")


dat_meningococcal_age <- get_weekly_timeseries(disease = "Meningococcal disease, invasive", years = years, 
                                               region_level = "Age stratification: 1 year intervals")
write.csv(dat_meningococcal_age, file = paste0("Meningococcal_Disease/Meningococcal_Disease-age-", today, ".csv"), row.names = FALSE)

dat_meningococcal_states <- get_weekly_timeseries(disease = "Meningococcal disease, invasive", years = years,
                                                  region_level = "State")
write.csv(dat_meningococcal_states, file = paste0("Meningococcal_Disease/Meningococcal_Disease-states-", today, ".csv"), row.names = FALSE)
})


########## Lyme disease
try({
dir.create("Lyme_Disease")


dat_lyme_age <- get_weekly_timeseries(disease = "Lyme disease", years = years, 
                                      region_level = "Age stratification: 1 year intervals")
write.csv(dat_lyme_age, file = paste0("Lyme_Disease/Lyme_Disease-age-", today, ".csv"), row.names = FALSE)

dat_lyme_states <- get_weekly_timeseries(disease = "Lyme disease", years = years,
                                         region_level = "State")
write.csv(dat_lyme_states, file = paste0("Lyme_Disease/Lyme_Disease-states-", today, ".csv"), row.names = FALSE)
})


########## TBE

# dir.create("Tick-borne_encephalitis")
# 
# 
# dat_tbe_age <- get_weekly_timeseries(disease = "Tick-borne encephalitis (TBE)", years = years, 
#                                      region_level = "Age stratification: 1 year intervals")
# write.csv(dat_tbe_age, file = paste0("Tick-borne_encephalitis/Tick-borne_encephalitis-age-", today, ".csv"), row.names = FALSE)
# 
# dat_tbe_states <- get_weekly_timeseries(disease = "Tick-borne encephalitis (TBE)", years = years,
#                                         region_level = "State")
# write.csv(dat_tbe_states, file = paste0("Tick-borne_encephalitis/Tick-borne_encephalitis-states-", today, ".csv"), row.names = FALSE)


########## Legionnaires disease
try({
dir.create("Legionnaires_Disease")


dat_legionnaires_age <- get_weekly_timeseries(disease = "Legionnaires' disease", years = years, 
                                     region_level = "Age stratification: 1 year intervals")
write.csv(dat_legionnaires_age, file = paste0("Legionnaires_Disease/Legionnaires_Disease-age-", today, ".csv"), row.names = FALSE)

dat_legionnaires_states <- get_weekly_timeseries(disease = "Legionnaires' disease", years = years,
                                        region_level = "State")
write.csv(dat_legionnaires_states, file = paste0("Legionnaires_Disease/Legionnaires_Disease-states-", today, ".csv"), row.names = FALSE)
})

