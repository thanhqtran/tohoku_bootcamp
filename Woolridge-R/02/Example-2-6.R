data(ceosal1, package='wooldridge')

# extract variables as vectors:
sal <- ceosal1$salary
roe <- ceosal1$roe

# regression with vectors:
CEOregres <- lm( sal ~ roe  )

# obtain predicted values and residuals
sal.hat <- fitted(CEOregres)
u.hat <- resid(CEOregres)

# Wooldridge, Table 2.2: 
cbind(roe, sal, sal.hat, u.hat)[1:15,]
