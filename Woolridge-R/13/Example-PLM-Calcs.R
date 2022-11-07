library(plm)
data(crime4, package='wooldridge')

# Generate pdata.frame:
crime4.p <- pdata.frame(crime4, index=c("county","year") )

# Calculations within the pdata.frame:
crime4.p$cr.l <- lag(crime4.p$crmrte)
crime4.p$cr.d <- diff(crime4.p$crmrte)
crime4.p$cr.B <- Between(crime4.p$crmrte)
crime4.p$cr.W <- Within(crime4.p$crmrte)

# Display selected variables for observations 1-16:
crime4.p[1:16,c("county","year","crmrte","cr.l","cr.d","cr.B","cr.W")]
