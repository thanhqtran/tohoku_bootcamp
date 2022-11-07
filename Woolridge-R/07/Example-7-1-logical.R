data(wage1, package='wooldridge')

# replace "female" with logical variable
wage1$female <- as.logical(wage1$female)
table(wage1$female)
  
# regression with logical variable
lm(wage ~ female+educ+exper+tenure, data=wage1)
