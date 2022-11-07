library(dynlm);library(stargazer)
data(hseinv, package='wooldridge')

# Define Yearly time series beginning in 1947
tsdata <- ts(hseinv, start=1947)

# Linear regression of model with lags:
res1 <- dynlm(log(invpc) ~ log(price)                , data=tsdata)
res2 <- dynlm(log(invpc) ~ log(price) + trend(tsdata), data=tsdata)

# Pretty regression table
stargazer(res1,res2, type="text")
