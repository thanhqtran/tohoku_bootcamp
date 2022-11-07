library(dynlm);library(car);library(orcutt)
data(barium, package='wooldridge')

tsdata <- ts(barium, start=c(1978,2), frequency=12)

# OLS estimation
olsres <- dynlm(log(chnimp)~log(chempi)+log(gas)+log(rtwex)+
      befile6+affile6+afdec6, data=tsdata)

# Cochrane-Orcutt estimation
cochrane.orcutt(olsres)
