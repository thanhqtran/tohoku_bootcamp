# stochastic RBC model With AR(1) process
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import minimize_scalar
import random

# latex font
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Define global variables
beta = 0.98
delta = 0.1
theta = 0.36
numits = 240

# initialize
vlast = np.zeros(100)
k0 = np.arange(0.06, 6.06, 0.06)

# AR(1) process of technology
rho = 0.95
mu = 0
sigma = 0.01

def inverse_log(y):
    return np.exp(y)

# Simulate the AR(1) process
T = 100
y = np.zeros(T)
A = np.zeros(T)

y[0] = 0
A[0] = inverse_log(y[0])

for t in range(1, T):
    y[t] = rho * y[t-1] + random.normalvariate(mu, sigma)
    A[t] = inverse_log(y[t])

print(A)

# Function to calculate the value function
def valfun(k): # k as k'
    global vlast, beta, delta, theta, kt, At
    g = np.interp(k, k0, vlast)
    c = At*kt**theta - k + (1 - delta) * kt
    if c <= 0:
        val = -888 - 800 * abs(c)
    else:
        val = np.log(c) + beta * g
    return -val

# Initialize arrays
v = np.zeros(100)
kt1 = np.zeros(100)

# Begin recursive calculations
for its in range(1, numits + 1):
    for j in range(100):
        kt = (j + 1) * 0.06
        At = A[j]
        ktp1 = minimize_scalar(valfun, bounds=(0.01, 6.2), method='bounded').x
        v[j] = -valfun(ktp1)
        kt1[j] = ktp1

    if its % 48 == 0:
        plt.plot(k0, v, label='Iteration ' + str(its))
        plt.xlabel('k(t)', fontsize=16)
        plt.ylabel('V(k(t))', fontsize=16)
        plt.legend()
        plt.draw()

    vlast = v.copy()

#plt.savefig('valuefun.pdf', format='pdf', dpi=1000)
plt.show()

# Plot the policy function
plt.plot(k0, kt1)
plt.plot(k0, k0, ls=':', label='45 degree line')
plt.xlabel('k(t)', fontsize=16)
plt.ylabel('k(t+1)', fontsize=16)
#plt.savefig('policyfun.pdf', format='pdf', dpi=1000)
plt.show()
