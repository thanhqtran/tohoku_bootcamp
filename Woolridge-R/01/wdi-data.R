# packages: WDI for raw data, dplyr for manipulation
library(WDI);

wdi_raw <- WDI(indicator=c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014)

head(wdi_raw)
tail(wdi_raw)
