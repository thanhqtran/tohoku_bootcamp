data(intdef, package='wooldridge')

# Linear regression of static model:
summary( lm(i3~inf+def,data=intdef)  )
