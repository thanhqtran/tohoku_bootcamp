data(ceosal1, package='wooldridge')
attach(ceosal1)

# ingredients to the OLS formulas 
cov(roe,salary)
var(roe)
mean(salary)
mean(roe)

# manual calculation of OLS coefficients 
( b1hat <- cov(roe,salary)/var(roe) )
( b0hat <- mean(salary) - b1hat*mean(roe) )

# "detach" the data frame
detach(ceosal1)