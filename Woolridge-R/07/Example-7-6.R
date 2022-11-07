data(wage1, package='wooldridge')

lm(log(wage)~married*female+educ+exper+I(exper^2)+tenure+I(tenure^2),
                                                           data=wage1)
