library(dynlm);library(lmtest)
data(barium, package='wooldridge')

# Define monthly time series beginning in Feb. 1978
tsdata <- ts(barium, start=c(1978,2), frequency=12)

res <- dynlm(log(chnimp) ~ log(chempi)+log(gas)+log(rtwex)+befile6+
                          affile6+afdec6+ season(tsdata) , data=tsdata )
coeftest(res)
