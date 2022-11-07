data(lawsch85, package='wooldridge')

# extract LSAT
lsat <- lawsch85$LSAT

# Create logical indicator for missings
missLSAT <- is.na(lawsch85$LSAT)

# LSAT and indicator for Schools No. 120-129:
rbind(lsat,missLSAT)[,120:129]

# Frequencies of indicator
table(missLSAT)

# Missings for all variables in data frame (counts)
colSums(is.na(lawsch85))

# Indicator for complete cases
compl <- complete.cases(lawsch85)
table(compl)

