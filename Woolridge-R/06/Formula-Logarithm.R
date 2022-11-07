data(hprice2, package='wooldridge')

# Estimate model with logs:
lm(log(price)~log(nox)+rooms, data=hprice2)