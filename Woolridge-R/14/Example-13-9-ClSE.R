library(plm);library(lmtest)
data(crime4, package='wooldridge')

# Generate pdata.frame:
crime4.p <- pdata.frame(crime4, index=c("county","year") )

# Estimate FD model:
reg <- ( plm(log(crmrte)~d83+d84+d85+d86+d87+lprbarr+lprbconv+ 
                   lprbpris+lavgsen+lpolpc,data=crime4.p, model="fd") )
# Regression table with standard SE
coeftest(reg)
# Regression table with "clustered" SE (default type HC0):
coeftest(reg, vcovHC)
# Regression table with "clustered" SE (small-sample correction)
# This is the default version used by Stata and reported by Wooldridge:
coeftest(reg, vcovHC(reg, type="sss"))