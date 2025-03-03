ssc install reghdfe
ssc install ftools  
ssc install boottest 
ssc install outreg2
ssc install estout
ssc install schemepack


* 1. Import data (you can use Stata's own data or import external data)
use http://www.stata-press.com/data/r17/nlswork.dta, clear
import delimited "panel_data.csv", clear

* 2. View data structure
describe   
summarize  
list idcode year age ln_wage if _n<=10  
tabstat ln_wage age union tenure, stats(mean sd p50 min max) col(stat)

* 3. set panel data
xtset idcode year   

* 4.OLS
reg ln_wage age union tenure 

* 5. FE
xtreg ln_wage age union tenure, fe 

* 6. RE
xtreg ln_wage age union tenure, re 

* 7. Hausman test（FE vs. RE）
xtreg ln_wage age union tenure, fe
estimates store fe
xtreg ln_wage age union tenure, re
estimates store re
hausman fe re, sigmamore
// If Prob > chi2 is < 0.05 use fixed effects

* 8. Two-Way Fixed Effects
xtreg ln_wage age union tenure i.year, fe 
reghdfe ln_wage age union tenure, absorb(idcode year) 

* 9. output the result
//9.1 
outreg2 using "/Users/mq/Desktop/xxx.doc", replace 
//9.2
est store m1 
esttab m1 using "/Users/mq/Desktop/xxx.rtf", replace b(%6.3f) se(%6.3f) se ar2(3) star(* 0.1 ** 0.05 *** 0.01) compress nogaps title("Baseline Regressions") scalar(N)
//b(%6.3f) se(%6.3f):beta and se are kept to 2 decimal places
//ar2(3): adjusted r2 is kept to 2 decimal places
//star(* 0.1 ** 0.05 *** 0.01): define significance stars
//compress: make tables more compact and reduce column widths
//nogaps:remove extra spacing between columns
//sclar: show additional statistics

* Some useful commands
// ssc install xxx 
// help xxx
// cls
// clear all
// exit

*visualizing 
//scatterplot
sysuse auto, clear
twoway (scatter price mpg, mcolor(%60) mlwidth(0)) ///
  (lowess price mpg), /// 
  title("{bf}Scatterplot", pos(11) size(2.75)) /// 
  subtitle("Price Vs. MPG", pos(11) size(2.5)) ///
  legend(off) ///no legend
  scheme(white_tableau)  // drawing templates in white
//histogram
histogram price, percent normal color(blue) title("Histogram of Price")
//box plot
graph box price, over(foreign) title("Price Distribution: Domestic vs. Foreign")
//bar chart
graph bar (mean) price, over(foreign) title("Average Price by Car Type") ylabel(,grid)
//line chart
twoway (line price mpg, sort lcolor(red)), title("Line Chart: Price vs. MPG") xlabel(,grid) ylabel(,grid)

  