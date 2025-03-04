library(fixest)
data(trade)

#OLS
gravity_ols = feols(log(Euros) ~ log(dist_km) | Origin + Destination + Product + Year, trade)

#PPML
gravity_pois = fepois(log(Euros) ~ log(dist_km) | Origin + Destination + Product + Year, trade)

#clustered se
summary(gravity_pois, vcov = "twoway")
summary(gravity_pois, vcov = ~Product)

#Other Estimation
#binomial(link = "logit")
#gaussian(link = "identity")
#Gamma(link = "inverse")
#inverse.gaussian(link = "1/mu^2")
#poisson(link = "log")
#quasi(link = "identity", variance = "constant")
#quasibinomial(link = "logit")
#quasipoisson(link = "log")

gravity_glm = feglm(Euros ~ log(dist_km) | Origin + Destination + Product + Year, family = poisson() ,trade)

gravity_negbin = fenegbin(Euros ~ log(dist_km) | Origin + Destination + Product + Year, trade)

#Summary Results
etable(gravity_pois, gravity_negbin, gravity_ols,
       vcov = "twoway", headers = c("Poisson", "Negative Binomial", "Gaussian"))

gravity_subfe = list()
all_FEs = c("Year", "Destination", "Origin")
for(i in 0:3){
  gravity_subfe[[i+1]] = fepois(Euros ~ log(dist_km), trade, fixef = all_FEs[0:i])
}

etable(gravity_subfe, cluster = ~Origin+Destination)

#Multiple Estimation in One Line
res_multi = fepois(Euros ~ log(dist_km) | csw0(Year, Destination, Origin), trade)

#Export to Latex 
etable(res_multi, cluster = ~Origin+Destination, tex = TRUE)

#If you want to see coefs in the FE
fixedEffects = fixef(gravity_pois)
summary(fixedEffects)
fixedEffects$Year
plot(fixedEffects)

#Interact the FE
gravity_pois = fepois(log(Euros) ~ log(dist_km) | Origin + Destination + Product^Year, trade)

#DiD
data(base_did)
head(base_did)


est_did = feols(y ~ x1 + i(period, treat, 5) | id + period, base_did)
est_did1 = feols(y ~ x1 + i(post,treat,0) | id + period, base_did)
est_did
iplot(est_did)
