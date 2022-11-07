# Libraries for dynamic lm, regression table and F tests
library(dynlm);library(lmtest);library(car)
data(fertil3, package='wooldridge')

# Define Yearly time series beginning in 1913
tsdata <- ts(fertil3, start=1913)

# Linear regression of model with lags:
res <- dynlm(gfr ~ pe + L(pe) + L(pe,2) + ww2 + pill, data=tsdata)
coeftest(res)

# F test. H0: all pe coefficients are=0
linearHypothesis(res, matchCoefs(res,"pe"))

