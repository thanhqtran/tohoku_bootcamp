library(systemfit)
data(mroz, package='wooldridge')
oursample <- subset(mroz,!is.na(wage))

# Define system of equations and instruments
eq.hrs   <- hours    ~ log(wage)+educ+age+kidslt6+nwifeinc
eq.wage  <- log(wage)~ hours    +educ+exper+I(exper^2)
eq.system<- list(eq.hrs, eq.wage)
instrum  <- ~educ+age+kidslt6+nwifeinc+exper+I(exper^2)
