# illustrate the dynamics of the system and print the results

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from scipy.optimize import fsolve

# parameters
a = 0.9
b = -0.2
c = 0.1
d = 0.7

# Define the system functions
def phi(x, y):
    return a*x + b*y

def psi(x, y):
    return c*x + d*y

x = [0.1]
y = [0.1]
t = [0]

for i in range(100):
    t.append(t[i] + 1)
    x.append(phi(x[i], y[i]))
    y.append(psi(x[i], y[i]))

# plot
plt.plot(t, x, label='x')
plt.plot(t, y, label='y')
plt.xlabel('t')
plt.ylabel('x, y')
plt.hlines(0, 0, 100, colors='grey', linestyles='dashed')
plt.legend()

plt.show()