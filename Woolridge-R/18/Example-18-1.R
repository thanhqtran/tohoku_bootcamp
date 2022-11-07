library(dynlm); library(stargazer)
data(hseinv, package='wooldridge')

# detrended variable: residual from a regression on the obs. index: 
trendreg <- dynlm( log(invpc) ~ trend(hseinv), data=hseinv )
hseinv$linv.detr <-  resid( trendreg )
# ts data:
hseinv.ts <- ts(hseinv)

# Koyck geometric d.l.:
gDL<-dynlm(linv.detr~gprice + L(linv.detr)            ,data=hseinv.ts)
# rational d.l.:
rDL<-dynlm(linv.detr~gprice + L(linv.detr) + L(gprice),data=hseinv.ts)

stargazer(gDL,rDL, type="text", keep.stat=c("n","adj.rsq"))

# LRP geometric DL:
b <- coef(gDL)
 b["gprice"]                 / (1-b["L(linv.detr)"])

# LRP rationalDL:
b <- coef(rDL)
(b["gprice"]+b["L(gprice)"]) / (1-b["L(linv.detr)"])
