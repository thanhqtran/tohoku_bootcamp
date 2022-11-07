data(ceosal1, package='wooldridge')

# Estimate log-log model
lm( log(salary) ~ log(sales), data=ceosal1 )