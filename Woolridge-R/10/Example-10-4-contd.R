# Calculating the LRP
b<-coef(res)
b["pe"]+b["L(pe)"]+b["L(pe, 2)"]

# F test. H0: LRP=0
linearHypothesis(res,"pe + L(pe) + L(pe, 2) = 0")
