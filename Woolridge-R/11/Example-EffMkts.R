library(zoo);library(quantmod);library(dynlm);library(stargazer)

# Download data using the quantmod package:
getSymbols("AAPL", auto.assign = TRUE)

# Calculate return as the log difference
ret <- diff( log(AAPL$AAPL.Adjusted) )
# Subset 2008-2016 by special xts indexing:
ret <- ret["2008/2016"]

# Plot returns
plot(ret)

# Linear regression of models with lags:
ret <- as.zoo(ret)  # dynlm cannot handle xts objects
reg1 <- dynlm(ret~L(ret) ) 
reg2 <- dynlm(ret~L(ret)+L(ret,2) ) 
reg3 <- dynlm(ret~L(ret)+L(ret,2)+L(ret,3) ) 

# Pretty regression table
stargazer(reg1, reg2, reg3, type="text",
                            keep.stat=c("n","rsq","adj.rsq","f"))
