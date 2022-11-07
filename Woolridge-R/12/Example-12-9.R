library(dynlm);library(lmtest)
data(nyse, package='wooldridge')

tsdata <- ts(nyse)

# Linear regression of model:
reg <- dynlm(return ~ L(return), data=tsdata) 

# squared residual
residual.sq <- resid(reg)^2

# Model for squared residual:
ARCHreg <- dynlm(residual.sq ~ L(residual.sq)) 
coeftest(ARCHreg)
