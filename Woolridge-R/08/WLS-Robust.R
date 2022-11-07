library(foreign)
d401k<-read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/401ksubs.dta")

# WLS
wlsreg <- lm(nettfa ~ inc + I((age-25)^2) + male + e401k, 
                             weight=1/inc, data=d401k, subset=(fsize==1))

# non-robust results
library(lmtest); library(car)
coeftest(wlsreg)

# robust results (Refined White SE:)
coeftest(wlsreg,hccm)
