# Predictions from linear probability, probit and logit model:
# (run 17-1-1.R through 17-1-4.R first to define the variables!)
predict(linprob,  xpred,type = "response")
predict(logitres, xpred,type = "response")
predict(probitres,xpred,type = "response")