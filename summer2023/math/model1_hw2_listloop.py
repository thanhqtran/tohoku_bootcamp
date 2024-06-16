#!/usr/bin/env python
# coding: utf-8

# In[26]:


import numpy as np
import matplotlib.pyplot as plt


# In[62]:


# METHOD 1 (Loop through a list)

# PARAMETERS

alpha = 1 - 0.43
beta = 0.95**30 # literature: 0.99, 0.98, 0.95 (quarterly)
n = 1.05
phi = (98.48 + 46.74)/(2*60*(24-8))
gamma = n*phi*(1+beta)/(1-n*phi)

# INITIAL VALUES
A = 1
K = 1
L = 1000
N = L/(1-phi*n)
k0 = K/L

### LISTS TO STORE OUTPUT

T_out = [0]
L_out = [L]
N_out = [N]
K_out = [K]
k_out = [k0]

### LOOP SIMUL
for i in range(20):
    k1 = beta*(1-alpha)/(1+beta) * A * (k0**alpha)
    N1 = n * N 
    L1 = N1 * (1 - phi*n)
    K1 = (k1/A)*L1
    # add back to lists
    T_out.append(i+1)
    L_out.append(L1)
    N_out.append(N1)
    K_out.append(K1)
    k_out.append(k1)
    # update next value
    k0 = k1
    N = N1 
    L = L1
    K = K1
