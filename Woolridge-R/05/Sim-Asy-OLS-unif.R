# Note: We'll have to set the sample size first, e.g. by uncommenting:
# n <- 100
# Set the random seed
set.seed(1234567)
# set true parameters: intercept & slope 
b0<-1; b1<-0.5
# initialize b1hat to store 10000 results:
b1hat <- numeric(10000)

# Draw a sample of x, fixed over replications:
x <- rnorm(n,4,1)
# repeat r times:
for(j in 1:10000) {
  # Draw a sample of u (uniform betw.):
  u <- runif(n,-sqrt(3),sqrt(3))
  # Draw a sample of y:
  y <- b0 + b1*x + u
  # regress y on x and store slope estimate
  bhat <- coef( lm(y~x) )
  b1hat[j] <- bhat["x"]
}
