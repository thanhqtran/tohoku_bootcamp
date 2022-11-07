stargazer(reg.fe,reg.dum,reg.cre,reg.re,type="text",model.names=FALSE,
          keep=c("married","union",":educ"),keep.stat=c("n","rsq"),
          column.labels=c("Within","Dummies","CRE","RE"))
