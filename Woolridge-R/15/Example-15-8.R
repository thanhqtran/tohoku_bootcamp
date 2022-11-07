library(AER)
data(mroz, package='wooldridge')

# restrict to non-missing wage observations
oursample <- subset(mroz, !is.na(wage))

# IV regression
summary( res.2sls <- ivreg(log(wage) ~ educ+exper+I(exper^2)
                | exper+I(exper^2)+motheduc+fatheduc,data=oursample) )

# Auxiliary regression
res.aux <-  lm(resid(res.2sls) ~ exper+I(exper^2)+motheduc+fatheduc
                       , data=oursample) 

# Calculations for test
( r2 <- summary(res.aux)$r.squared )
( n <- nobs(res.aux) )
( teststat <- n*r2 )
( pval <- 1-pchisq(teststat,1) )
