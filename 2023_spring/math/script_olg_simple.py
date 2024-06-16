# OLG Model
# Endogenous Savings

import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd

# parameters
alpha = 0.5
delta = 0.05
n = 0.2
beta = 0.98**30

# initialize
K = 0.01
L = 1
i = 0

# values
k_list = [ K/L ]
time = [ i ]
kstar = ( (beta/(1+beta)) * ((1-alpha)/(1+n)) )**(1/(1-alpha))
# time loop
na = 20

for i in range(na):
    i = i + 1
    time.append(i)
    # capital-labor ratio at t 
    k = K / L
    k_list.append(k)
    # calculate factor prices
    w = (1-alpha) * ( k ** alpha)
    r = alpha * ( k ** (alpha-1))
    # houshold choices
    c = w / (1+beta)
    s = (beta/(1+beta)) * w 
    # update capital and population
    K = s * L
    L = L * (1 + n)

plt.plot(time, k_list)
plt.xlabel('Time')
plt.ylabel('Capital-labor ratio $k$')
plt.hlines(kstar, 0, loop, linestyles='dashed')