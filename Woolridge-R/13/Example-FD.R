library(plm); library(lmtest)
data(crime2, package='wooldridge')

crime2.p <- pdata.frame(crime2, index=46 )

# manually calculate first differences:
crime2.p$dcrmrte <- diff(crime2.p$crmrte)
crime2.p$dunem   <- diff(crime2.p$unem)

# Display selected variables for observations 1-6:
crime2.p[1:6,c("id","time","year","crmrte","dcrmrte","unem","dunem")]

# Estimate FD model with lm on differenced data:
coeftest( lm(dcrmrte~dunem, data=crime2.p) )

# Estimate FD model with plm on original data:
coeftest( plm(crmrte~unem, data=crime2.p, model="fd") )
