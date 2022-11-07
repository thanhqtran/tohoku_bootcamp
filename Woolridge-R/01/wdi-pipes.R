library(dplyr)
# All manipulations with pipes:
ourdata <- wdi_raw %>% 
  filter(iso2c=="US") %>% 
  rename(LE_fem=SP.DYN.LE00.FE.IN) %>% 
  select(year, LE_fem) %>% 
  arrange(year) 