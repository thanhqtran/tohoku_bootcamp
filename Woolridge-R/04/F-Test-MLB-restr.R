data(mlb1, package='wooldridge')

summary(lm(log(salary) ~ years+gamesyr, data=mlb1))