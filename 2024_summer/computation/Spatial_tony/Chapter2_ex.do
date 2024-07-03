// Simple regression using Stata

********************************************************************************************************************
// 1. Map data preparation

// cd ... to your directory or go to File -> change working directory

// Change the .shp file to .dta
spshape2dta "NCVA CO" // This will automatically generate two .dta files. We will ignore the _shp file

use "NCVA CO.dta", clear
describe

// In our case, the administrative code FIPS are strings. We need to destring them
destring FIPS, replace
rename FIPS fips // Make the names consistent
spset fips, modify replace // spatial-set the data, similar to xtset in panel analysis

// Generate the spatial weight matrix 
spmatrix create contiguity W, normalize(row) replace // The Queen rule
// spmatrix create idistance M, normalize(row) replace // Inverse distance rule

********************************************************************************************************************
// 2. Merge with our economic dataset

// Load file
import delimited "CODAT2003.csv", clear

// Merge
merge 1:1 fips using "NCVA CO.dta"
keep if _merge==3 // You should check your data, simply dropping all non-matched data may not be good practice
drop _merge

// In this example we have cross-sectional data. If you have panel data, please look at Chapter 24 of the Stata manual
// https://www.stata.com/manuals13/u24.pdf

// Save the combined file
save All_Combined, replace // Next time you can use this file to create the spatial weight matrix and estimate

********************************************************************************************************************
// 3. Estimation

// For exercise, let's regress unemployment on urbanisation
regress urbanp unempp

// Run Moran's test
estat moran, errorlag(W) // The result suggests we reject the null hypothesis and adopt spatial model

// Spatial estimation
spregress urbanp unempp, gs2sls // Without using W, this produces the same results as OLS

// SAR model
// y = rho W y + X beta + e
spregress urbanp unempp, gs2sls dvarlag(W)

// SLX model
// y = X beta + W X theta + e
spregress urbanp unempp, gs2sls ivarlag(W:unempp) 
// Inside the bracket you can choose which are used as spatial-lagged variables and which are controls

// SEM model
// y = X beta + u, u = lambda W u + e
spregress urbanp unempp, gs2sls errorlag(W)

// Finally, we need all the effects
estat impact // run this after each model to see the effects

/* In practice, you might need to test a few model specifications and present several results
   When you deal with panel data, fixed effects can also be used by adding the fe option as usual
   However, fe sometimes can be tricky. For more on fixed effects, please check the manual and Lee & Yu (2010a & b)
   Other than Stata built-in command sp, there are also some user written commands such as xsmle, spregxt and ivreghdfe
*/




