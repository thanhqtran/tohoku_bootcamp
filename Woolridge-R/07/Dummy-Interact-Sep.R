data(gpa3, package='wooldridge')

# Estimate model for males (& spring data)
lm(cumgpa~sat+hsperc+tothrs, data=gpa3, subset=(spring==1&female==0))

# Estimate model for females (& spring data)
lm(cumgpa~sat+hsperc+tothrs, data=gpa3, subset=(spring==1&female==1))
