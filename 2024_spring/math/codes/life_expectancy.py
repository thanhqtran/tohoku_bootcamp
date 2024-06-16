# library
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve

# parameters
A = 5
b = 0.2
z = 0.12
beta = 0.99**35
gamma = 0.4
sigma = 0.45
alpha = 0.35

# key param
x1 = 0.6
x2 = 0.7

# functions
def eta_(x):
    return (1 + gamma + beta*x) / (1 + beta*x)

def theta_(x):
    return ((1-alpha)/b)**(1/alpha) * (1-sigma)**((eta_(x)/alpha) - 1) * eta_(x)

def kbar_(x):
    return ((b/(1-alpha))**(1/alpha)) * ((1-sigma)**(1 - (eta_(x))/alpha)) / eta_(x)

def k1_(k, x):
    if k < kbar_(x):
        C = A * beta * z * x / (gamma * (1 - sigma * theta_(x) * k))
        B1 = (((1-alpha)/(b**(1-alpha)))**(1/alpha)) * ((1-sigma)**((1-alpha)*eta_(x)/alpha)) * eta_(x) 
        return C * (B1 * k + (1 - theta_(x)*k)*b)
    else:
        C = A * beta * z * x * (1-alpha) / (gamma*((1-sigma)**alpha))
        return C * ((eta_(x))**alpha) * (k**alpha)

k_vals = np.linspace(0.01, 1, 100)
k1_vals = np.zeros(100)
k2_vals = np.zeros(100)

for i in range(100):
    k1_vals[i] = k1_(k_vals[i], x1)
    k2_vals[i] = k1_(k_vals[i], x2)

# find the steady states
def k1L_(k, x):
    C = A * beta * z * x / (gamma * (1 - sigma * theta_(x) * k))
    B1 = (((1-alpha)/(b**(1-alpha)))**(1/alpha)) * ((1-sigma)**((1-alpha)*eta_(x)/alpha)) * eta_(x) 
    return C * (B1 * k + (1 - theta_(x)*k)*b) - k

def k1H_(k, x):
    C = A * beta * z * x * (1-alpha) / (gamma*((1-sigma)**alpha))
    return C * ((eta_(x))**alpha) * (k**alpha) - k

# solve for the steady states
kL1 = fsolve(k1L_, kbar_(x1), args=(x1))
kH1 = fsolve(k1H_, kbar_(x1), args=(x1))
kH2 = fsolve(k1H_, kbar_(x2), args=(x2))
kL2 = fsolve(k1L_, kbar_(x2), args=(x2))


plt.figure(figsize=(4, 3))
# plot the function
plt.plot(k_vals, k1_vals, label=r'$x=0.6$')
plt.plot(k_vals, k2_vals, label=r'$x=0.7$')
# plot the 45 degree line
plt.plot(k_vals, k_vals, linestyle=':', color='grey')
# plot the steady states
#plt.scatter(kL, kL, color='blue')
plt.scatter(kH1, kH1, color='red')
plt.scatter(kH2, kH2, color='orange')
# delete top and right frame
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.margins(0)
plt.legend()
plt.xlabel('$k_t$', fontsize=15, loc='right')
plt.ylabel('$k_{t+1}$', fontsize=15, rotation=0, loc='top')
plt.show()