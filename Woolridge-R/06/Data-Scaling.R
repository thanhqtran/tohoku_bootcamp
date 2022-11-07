data(bwght, package='wooldridge')

# Basic model:
lm( bwght ~ cigs+faminc, data=bwght)

# Weight in pounds, manual way:
bwght$bwghtlbs <- bwght$bwght/16
lm( bwghtlbs ~ cigs+faminc, data=bwght)

# Weight in pounds, direct way:
lm( I(bwght/16) ~ cigs+faminc, data=bwght)

# Packs of cigarettes:
lm( bwght ~ I(cigs/20) +faminc, data=bwght)
