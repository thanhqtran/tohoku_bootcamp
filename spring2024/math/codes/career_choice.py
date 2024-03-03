# kimura and yasui 2007
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.optimize import fsolve

# latex font
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# parameters
alpha = 0.33
tau = 0.6
gamma = 0.6
z = 0.2
b = 0.1
A = 4.5

# functions


def theta_():
    term1 = (1-tau)**( (1/(alpha*(1-gamma))) - 1  ) / (1-gamma) 
    term2 = ( (1-alpha)/b) ** (1/alpha)
    return term1 * term2

theta = theta_()
k_bar = 1/theta

def k1_(k):
    if k < k_bar:
        C1 = A * z * (1-gamma)/gamma 
        C2 = 1 / (1-tau*theta*k)
        B1 = (1-alpha) * ((1-tau)**(1-alpha)) * (theta**(1-alpha)) / ((1-gamma)**alpha)
        return C1 * C2 * (B1 * k + (1-theta*k)*b) 
    else:
        C1 = A * z * (1-gamma)/gamma
        C2 = (1-alpha) / (((1-tau)**alpha) * ((1-gamma)**alpha))
        return C1 * C2 * (k**alpha)

# finding  m and phi given k


def phi_(k):
    phi_crude = theta * k
    if phi_crude < 1:
        return phi_crude
    else:
        return 1


def m_(k):
    return (1 - tau * phi_(k)) * gamma / z

k_vals = np.linspace(0, 1, 100)
k1_vals = np.zeros(100)

for i in range(100):
    k1_vals[i] = k1_(k_vals[i])

# find the steady states
def k1L_(k):
    C1 = A * z * (1-gamma)/gamma 
    C2 = 1 / (1-tau*theta*k)
    B1 = (1-alpha) * ((1-tau)**(1-alpha)) * (theta**(1-alpha)) / ((1-gamma)**alpha)
    return C1 * C2 * (B1 * k + (1-theta*k)*b) - k 

def k1H_(k):
    C1 = A * z * (1-gamma)/gamma
    C2 = (1-alpha) / (((1-tau)**alpha) * ((1-gamma)**alpha))
    return C1 * C2 * (k**alpha) - k




# steady states
kL = fsolve(k1L_, 0.1)
kL_unstable = fsolve(k1L_, 0.5)
kH = fsolve(k1H_, k_bar)

mL = m_(kL)
phiL = phi_(kL)
mH = m_(kH)
phiH = phi_(kH)

plt.figure(figsize=(4, 3))
# plot the function
plt.plot(k_vals, k1_vals)
# plot the 45 degree line
plt.plot(k_vals, k_vals, linestyle=':', color='grey')
# plot the steady states
plt.scatter(kL, kL, color='blue')
plt.scatter(kH, kH, color='red')
# plot the unstable steady state
plt.scatter(kL_unstable, kL_unstable, color='orange')
# plot the threshold
plt.vlines(k_bar, 0, k1_(k_bar), linestyle='--', color='grey')

# vertical and horizontal lines
plt.vlines(kL, 0, kL, linestyle='--', color='grey')
plt.vlines(kH, 0, kH, linestyle='--', color='grey')
plt.vlines(kL_unstable, 0, kL_unstable, linestyle='--', color='grey')

# some cosmetics
plt.xlabel('$k_t$', fontsize=15, loc='right')
plt.ylabel('$k_{t+1}$', fontsize=15, rotation=0, loc='top')
# disable the top and right frame
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.ylim(0, 1)
ax.margins(0)
# annotate xticks and yticks
plt.xticks([kL[0], kH[0], kL_unstable[0], k_bar], [
           r'$k_L$', r'$k_H$', r'$k_U$', r'$\bar{k}$'], fontsize=12)
# print the steady states m and phi
print('kL:', kL)
print('mL:', mL)
print('phiL:', phiL)
print('kH:', kH)
print('mH:', mH)
print('phiH:', phiH)