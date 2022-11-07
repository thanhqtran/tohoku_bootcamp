require(foreign)
audit <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/audit.dta")

# Example C.3: two-sided CI
t.test(audit$y)
# Examples C.5 & C.7: 1-sided test:
t.test(audit$y, alternative="less")