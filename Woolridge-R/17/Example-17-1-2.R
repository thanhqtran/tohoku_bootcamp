# predictions for two "extreme" women (run Example-17-1-1.R first!):
xpred <- list(nwifeinc=c(100,0),educ=c(5,17),exper=c(0,30),
              age=c(20,52),kidslt6=c(2,0),kidsge6=c(0,0))
predict(linprob,xpred)
