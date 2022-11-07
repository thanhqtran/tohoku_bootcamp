# Note: Script "F-Test-MLB-auto.R" has to be run first to create res.ur.
# Which variables used in res.ur contain "yr" in their names?
myH0 <- matchCoefs(res.ur,"yr")
myH0

# F test (F-Test-MLB-auto.R has to be run first!)
linearHypothesis(res.ur, myH0)
