# Values for x: all between 0 and 10
x <- seq(0,10)

# pmf for all these values
fx <- dbinom(x, 10, 0.2)

# Table(matrix) of values:
cbind(x, fx) 
# Plot
plot(x, fx, type="h")