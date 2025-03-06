//2sls
* Load the built-in dataset
bcuse card, clear

* First-stage regression: Regress endogenous variable (education) on instrument (near college)
reg educ nearc4 exper expersq black south

* Save the predicted values of education (fitted values)
predict educ_hat, xb

* Second-stage regression: Use predicted education in place of actual education
reg lwage educ_hat exper expersq black south

//Perform 2SLS estimation using the ivregress command
ivregress 2sls lwage (educ = nearc4) exper expersq black south, robust

* Check first-stage F-statistic (should be > 10)
estat firststage

* Export regression results as a table
outreg2 using 2sls_results.doc, replace word

