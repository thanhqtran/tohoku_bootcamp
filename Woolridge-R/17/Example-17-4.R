library(survival)
data(recid, package='wooldridge')

# Define Dummy for UNcensored observations
recid$uncensored <- recid$cens==0
# Estimate censored regression model:
res<-survreg(Surv(log(durat),uncensored, type="right") ~ workprg+priors+
                     tserved+felon+alcohol+drugs+black+married+educ+age, 
                     data=recid, dist="gaussian")
# Output:
summary(res)
