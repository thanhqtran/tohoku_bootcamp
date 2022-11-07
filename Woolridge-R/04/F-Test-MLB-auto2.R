# F test (F-Test-MLB-auto.R has to be run first!)
myH0 <- c("bavg", "hrunsyr=2*rbisyr")
linearHypothesis(res.ur, myH0)
