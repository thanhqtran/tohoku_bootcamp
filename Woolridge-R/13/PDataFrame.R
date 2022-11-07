library(plm)
data(crime2, package='wooldridge')

# Define panel data frame
crime2.p <- pdata.frame(crime2, index=46 )

# Panel dimensions:
pdim(crime2.p)

# Observation 1-6: new "id" and "time" and some other variables:
crime2.p[1:6,c("id","time","year","pop","crimes","crmrte","unem")]
