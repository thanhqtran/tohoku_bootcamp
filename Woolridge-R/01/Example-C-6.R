# Note: we reuse variables from Example-C-2.R. It has to be run first!
# t statistic for H0: mu=0:
(t <- avgCh/se)

# p value
(p <- pt(t,n-1))