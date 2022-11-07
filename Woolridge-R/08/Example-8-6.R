library(foreign)
d401k<-read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/401ksubs.dta")

# OLS (only for singles: fsize==1)
lm(nettfa ~ inc + I((age-25)^2) + male + e401k, 
                                         data=d401k, subset=(fsize==1))

# WLS
lm(nettfa ~ inc + I((age-25)^2) + male + e401k, weight=1/inc, 
                                         data=d401k, subset=(fsize==1))
