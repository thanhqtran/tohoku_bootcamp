data(hprice1, package='wooldridge')

# original linear regression
orig <- lm(price ~ lotsize+sqrft+bdrms, data=hprice1)

# regression for RESET test
RESETreg <- lm(price ~ lotsize+sqrft+bdrms+I(fitted(orig)^2)+ 
                                        I(fitted(orig)^3), data=hprice1)
RESETreg

# RESET test. H0: all coeffs including "fitted" are=0 
library(car)
linearHypothesis(RESETreg, matchCoefs(RESETreg,"fitted"))
