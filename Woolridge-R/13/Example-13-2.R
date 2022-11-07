data(cps78_85, package='wooldridge')

# Detailed OLS results including interaction terms
summary( lm(lwage ~ y85*(educ+female) +exper+ I((exper^2)/100) + union, 
                                                        data=cps78_85) )
