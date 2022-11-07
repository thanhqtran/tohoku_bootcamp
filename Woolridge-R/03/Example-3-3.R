d401k <- rio::import("401k.dta")

# OLS regression:
summary( lm(prate ~ mrate+age, data=d401k) )
