library(urca)
data(inven, package='wooldridge')

# automated ADF test using urca:
summary( ur.df(log(inven$gdp) , type = c("trend"), lags = 1) )
