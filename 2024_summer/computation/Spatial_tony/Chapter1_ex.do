// This Do-file illustrates the very simple spatial regression in Stata using the Example in the note of Chapter 1

// Load data
use Chapter1_ex.dta, clear

/* Spatial-set the data. For this practice, there is no coordinates information given so we will simply set the data
using its ID. In practice you will have a .shp file that includes all the location information with longitudes and latitudes. For this simply exercise, we will use our user-defined matrix W.
*/
spset ID

spmatrix fromdata W = R1 - R7 // Defines the spatial weight matrix W using data in variables R1 to R7

spregress y x1 x2, gs2sls dvarlag(W) // This does the SAR model, regressing y on x1 and x2 given the spatial matrix W

/* The coefficients for x1 and x2 are therefore the beta_hat in the notes. The coefficient for W is rho_hat.

There is some difference between our estimates and the ones in the notes. This is possibly because they do not have a constant term. */
