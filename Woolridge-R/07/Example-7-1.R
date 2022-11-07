data(wage1, package='wooldridge')

lm(wage ~ female+educ+exper+tenure, data=wage1)
