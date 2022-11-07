# Sample from a standard normal RV with sample size n=5:
rnorm(5)
# A different sample from the same distribution:
rnorm(5)

# Set the seed of the random number generator and take two samples:
set.seed(6254137)
rnorm(5)
rnorm(5)

# Reset the seed to the same value to get the same samples again:
set.seed(6254137)
rnorm(5)
rnorm(5)