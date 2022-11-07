data(hprice2, package='wooldridge')

# Estimate model with standardized variables:
lm(scale(price) ~ 0+scale(nox)+scale(crime)+scale(rooms)+
                              scale(dist)+scale(stratio), data=hprice2)

