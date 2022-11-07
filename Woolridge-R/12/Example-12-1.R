library(dynlm);library(lmtest)
data(phillips, package='wooldridge')

# Define Yearly time series beginning in 1948
tsdata <- ts(phillips, start=1948)

# Estimation of static Phillips curve:
reg.s <- dynlm( inf ~ unem, data=tsdata, end=1996)
# residuals and AR(1) test:
residual.s <- resid(reg.s)
coeftest( dynlm(residual.s ~ L(residual.s)) )

# Same with expectations-augmented Phillips curve:
reg.ea <- dynlm( d(inf) ~ unem, data=tsdata, end=1996)
residual.ea <- resid(reg.ea)
coeftest( dynlm(residual.ea ~ L(residual.ea)) )
