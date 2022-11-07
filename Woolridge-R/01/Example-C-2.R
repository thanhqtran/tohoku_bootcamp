# Manually enter raw data from Wooldridge, Table C.3:
SR87<-c(10,1,6,.45,1.25,1.3,1.06,3,8.18,1.67,.98,1,.45,
                                      5.03,8,9,18,.28,7,3.97)
SR88<-c(3,1,5,.5,1.54,1.5,.8,2,.67,1.17,.51,.5,.61,6.7,
                                            4,7,19,.2,5,3.83)
# Calculate Change (the parentheses just display the results):
(Change <- SR88 - SR87)

# Ingredients to CI formula
(avgCh<- mean(Change))
(n    <- length(Change))
(sdCh <- sd(Change))
(se   <- sdCh/sqrt(n))
(c    <- qt(.975, n-1))

# Confidence intervall:
c( avgCh - c*se, avgCh + c*se )