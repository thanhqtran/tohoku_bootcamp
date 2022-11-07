library(dynlm);library(stargazer)
data(nyse, package='wooldridge')

# Define time series (numbered 1,...,n)
tsdata <- ts(nyse)

# Linear regression of models with lags:
reg1 <- dynlm(return~L(return)                        , data=tsdata) 
reg2 <- dynlm(return~L(return)+L(return,2)            , data=tsdata) 
reg3 <- dynlm(return~L(return)+L(return,2)+L(return,3), data=tsdata) 

# Pretty regression table
stargazer(reg1, reg2, reg3, type="text",
                            keep.stat=c("n","rsq","adj.rsq","f"))
