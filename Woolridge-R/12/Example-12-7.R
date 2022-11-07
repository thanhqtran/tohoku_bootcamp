library(dynlm);library(lmtest);library(sandwich)
data(prminwge, package='wooldridge')

tsdata <- ts(prminwge, start=1950)

# OLS regression
reg<-dynlm(log(prepop)~log(mincov)+log(prgnp)+log(usgnp)+trend(tsdata), 
                                                          data=tsdata )
# results with usual SE
coeftest(reg)
# results with HAC SE
coeftest(reg, vcovHAC)
