# library
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve

# parameters
# =================================
# CHECK THE FILE 
# chenhj2008_find_multi_eqm.py 
# FOR THE VALUES OF THE PARAMETERS
# =================================


## fixed
beta = 0.99**30
alpha = 0.33

# test
x = 0.5
b = 0.1
gamma = 0.142105
sigma = 0.9
z = 0.1
A = 6.14


# functions
def eta_(x):
    return (1 + gamma + beta*x) / (1 + beta*x)

def theta_(x):
    return ((1-alpha)/b)**(1/alpha) * (1-sigma)**((eta_(x)/alpha) - 1) * eta_(x)

def kbar_(x):
    return ((b/(1-alpha))**(1/alpha)) * ((1-sigma)**(1 - (eta_(x))/alpha)) / eta_(x)

# dynamics of k
def k1_(k, x):
    if k < kbar_(x):
        C = A * beta * z * x / (gamma * (1 - sigma * theta_(x) * k))
        B1 = (((1-alpha)/(b**(1-alpha)))**(1/alpha)) * \
            ((1-sigma)**((1-alpha)*eta_(x)/alpha)) * eta_(x)
        return C * (B1 * k + (1 - theta_(x)*k)*b)
    else:
        C = A * beta * z * x * (1-alpha) / (gamma*((1-sigma)**alpha))
        return C * ((eta_(x))**alpha) * (k**alpha)
    
# create some values
k_vals = np.linspace(0.1, 4, 100)
k1_vals = np.zeros(100)

# assign values to k1_vals
for i in range(100):
    k1_vals[i] = k1_(k_vals[i], x)

# find the steady states

def k1L_(k, x):
    C = A * beta * z * x / (gamma * (1 - sigma * theta_(x) * k))
    B1 = (((1-alpha)/(b**(1-alpha)))**(1/alpha)) * \
        ((1-sigma)**((1-alpha)*eta_(x)/alpha)) * eta_(x)
    return C * (B1 * k + (1 - theta_(x)*k)*b) - k


def k1H_(k, x):
    C = A * beta * z * x * (1-alpha) / (gamma*((1-sigma)**alpha))
    return C * ((eta_(x))**alpha) * (k**alpha) - k




plt.figure(figsize=(10, 8))

# plot the function
plt.plot(k_vals, k1_vals)
plt.plot(k_vals, k_vals, linestyle=':', color='grey')

# delete top and right frame
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.margins(0)
plt.xlabel('$k_t$', fontsize=15, loc='right')
plt.ylabel('$k_{t+1}$', fontsize=15, rotation=0, loc='top')