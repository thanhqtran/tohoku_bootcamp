# The first 20 of 10000 estimates:
ybar[1:20]

# Simulated mean:
mean(ybar)

# Simulated variance:
var(ybar)

# Simulated density:
plot(density(ybar))
curve( dnorm(x,10,sqrt(.04)), add=TRUE,lty=2)