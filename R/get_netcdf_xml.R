## Function to scrape netcdf metadata to build XML
library(tidyverse)

nc <- ncdf4::nc_open(file.path(here::here("data/sst.day.mean.2021.nc"))) #netcdf example

example_csv<- read.csv(file.path(here::here("data-raw/InportXML-template.csv"))) #csv example

# only required fields
req_example<- example_csv %>%
  dplyr::filter(value == "REQUIRED")

# Example metadata extraction
title<- nc$var$sst$longname
accronym<- nc$var$sst$name
dimension_count<- nc$var$sst$ndims
