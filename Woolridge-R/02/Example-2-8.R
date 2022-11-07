data(ceosal1, package='wooldridge')

CEOregres <- lm( salary ~ roe, data=ceosal1 )

# Calculate predicted values & residuals:
sal.hat <- fitted(CEOregres)
u.hat <- resid(CEOregres)

# Calculate R^2 in three different ways:
sal <- ceosal1$salary
var(sal.hat) / var(sal)
1 - var(u.hat) / var(sal)
cor(sal, sal.hat)^2
