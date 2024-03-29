twoway (scatter y0 xc, msymbol(+) msize(*0.4) mcolor(black*0.3))  ,   title("no discontinuity")
graph save y0,  replace
twoway (scatter y1 xc, msymbol(+) msize(*0.4) mcolor(black*0.3))  ,   title("discontinuity exist")
graph save y1, replace

graph  combine y0.gph y1.gph, row(1)



help rdplot 

twoway (scatter y1 xc, msymbol(+) msize(*0.4) mcolor(black*0.3)), title("Scatter Plot")
// Scatter plot with customized symbols, size, and color, with the title "散点图" (Scatter Plot in Chinese)

graph save scatter.gph, replace
// Save the scatter plot as "scatter.gph", replacing if it already exists

rdplot y1 xc, c(0) p(1) graph_options(title(Linear Fit))
// Generate a regression discontinuity plot with a linear fit, with the title "线性拟合" (Linear Fit in Chinese). "y1" is the outcome variable, with a cutoff effect. c(0) means set the critical value to 0

graph save rd1, replace
// Save the first RD plot as "rd1", replacing if it already exists

rdplot y1 xc, c(0) p(2) graph_options(title(Quadratic Fit))
// Generate a regression discontinuity plot with a quadratic fit, with the title "二次型拟合" (Quadratic Fit in Chinese). "y1" is the outcome variable, with a cutoff effect.

graph save rd2, replace
// Save the second RD plot as "rd2", replacing if it already exists

rdplot y1 xc, c(0) p(3) graph_options(title(Cubic Fit))
// Generate a regression discontinuity plot with a cubic fit, with the title "三次型拟合" (Cubic Fit in Chinese). "y1" is the outcome variable, with a cutoff effect.

graph save rd3, replace
// Save the third RD plot as "rd3", replacing if it already exists

graph combine scatter.gph rd1.gph rd2.gph rd3.gph
// Combine all saved graphs (scatter plot and three RD plots) into one graph


//The use of local linear regression assumes that the treatment effect in the neighborhood of the cutoff is linear. It identifies the effect by conducting linear regressions separately on the left and right sides of the cutoff and comparing the differences in regression coefficients.

//An important aspect of local regression testing is the selection of the cutoff neighborhood size, which involves a trade-off in bandwidth selection in RDD analysis.

//Because a larger bandwidth implies that more samples are included in the test, parameter estimation is more accurate. However, it also means that the randomness requirement of samples is harder to satisfy, and endogeneity issues may be more severe.

//In this article, the neighborhood of the cutoff xc is defined as ([xc-h1, xc+h2]), where h1 and h2 are the bandwidths on the left and right sides, respectively. h1 and h2 can be equal or not.

//In cutoff analysis, there are three commands available for local linear cutoff regression: rd, rdrobust, and rdcv. All three commands automatically provide the optimal bandwidth for the command used.



set matsize 2000
set seed 135
sample 10          // Randomly sample 10% of the observations
rdplot y1 xc, c(0) // Check if there are significant changes in data characteristics

// Different local linear regression discontinuity commands
ssc install rd
rd   y1 xc, c(0)  // Provides optimal bandwidth and regression results with bandwidth set to 50% and 200% of the optimal bandwidth

ssc install rdrobust
rdrobust y1 xc, c(0) p(1) 
ssc install rdcv
rdcv y1 xc, thr(0) deg(1)





