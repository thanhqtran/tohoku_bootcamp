import numpy as np
import matplotlib.pyplot as plt
import sympy as sym

'''
given variables
a0: intercept of the demand curve(+ve) #gamma
b0: slope of the demand curve(-ve) #delta
a1: intercept of the supply curve(-ve) # N*alpha/(2*beta)) 
b1: slope of the supply curve(+ve) # N/(2*beta)
t: period
x0: period0 price

generated variables
x1: period1 price
pp: intertemporal eqm price
time_path: time path
dd: eqm demand
ss: eqm supply
in eqm condition dd and ss should and would be the same
'''

x0= sym.symbols('x0')
a0= sym.symbols('a0')
a1= sym.symbols('a1')
b0= sym.symbols('b0')
b1= sym.symbols('b1')
p0= sym.symbols('p0')
q0= sym.symbols('q0')
t= sym.symbols('t')

x1= (a1- a0)- (b1/b0)*x0
dd= a0+ b0*x1
ss= a1 + b1*x0
pp= -((a0-a1)/(b0-b1))
time_path_fn= ((p0- pp)*(b0/b1)**-t)+ pp
qq = a0 - b0 * x1

time_path=[]
solve= []
t1= list(range(1, 100))
x= 0
bi_pasa0= []
bi_qasa0= []
bi_pasa1= []
d=[]
s=[]

val_set1 = [1, -2, 2, 1.9, 0]
val_set2 = [2, -2, 5, 1.5, 4]

for i in t1:
  values= [1, -2, 2, 1.9, 0]
  x_1= x1.subs([(x0, x), (a0, values[0]), (b0, values[1]), (a1, values[2]), (b1, values[3])])
  op= time_path_fn.subs([(x0, x), (a0, values[0]), (b0, values[1]), (a1, values[2]), (b1, values[3]), (p0, values[4]), (t, i)])
  time_path.append(op)
  d.append(dd.subs([(x1, x_1), (a0, values[0]), (b0, values[1]), (a1, values[2]), (b1, values[3])]))
  s.append(ss.subs([(x0, x), (a0, values[0]), (b0, values[1]), (a1, values[2]), (b1, values[3])]))
  q= qq.subs([(x1, x_1), (a0, values[0]), (b0, values[1]), (a1, values[2]), (b1, values[3])])
  bi_pasa0.append(x)
  bi_pasa1.append(x_1)
  bi_qasa0.append(q)
  x= x_1

# plot
plt.plot(t1, time_path, label= 'time path')
plt.legend()
plt.show()
plt.plot(t1, bi_pasa0, label= 'price')
plt.plot(t1, bi_qasa0, label= 'quantity')
plt.legend()
plt.show()
# plot of demand and supply