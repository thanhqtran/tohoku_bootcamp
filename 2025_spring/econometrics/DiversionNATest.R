data<-read.csv(file.choose())

data <- na.omit(data)
data$pair <- paste(data$reporterISO, data$partnerISO, sep = "_")

data6 <- data %>% filter(TimeIndex < 0)
data7 <- data %>% filter(TimeIndex < 10)
data7 <- data7 %>% filter(reporterISO != "USA" & reporterISO != "CZE")
data6$After3 = case_when(data6$TimeIndex >= -15 ~ 1, 
                         .default = 0)
data6$After4 = case_when(data6$TimeIndex >= -20 ~ 1, 
                         .default = 0)
data6$After5 = case_when(data6$TimeIndex >= -6 ~ 1, 
                         .default = 0)


est_did2 <- fepois(trade ~ LGDP + i(LGDP,pair)+ REXR + CA + After5 * Group_1|  pair + TimeIndex,vcov = ~reporterISO+ TimeIndex, data6)
est_did3 <- fepois(trade ~ LGDP + REXR + CA + After2 * Group_2|  pair + TimeIndex,vcov = ~reporterISO+TimeIndex, data7)