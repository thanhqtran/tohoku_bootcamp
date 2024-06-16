#!/usr/bin/env python
# coding: utf-8

# In[26]:


import numpy as np
import matplotlib.pyplot as plt


# In[64]:


# METHOD 2 (Array updating)

iter = 20
k = np.zeros(iter)
t = np.zeros(iter)
l = np.zeros(iter)
pop = np.zeros(iter) 

# INITIAL VALUES
A = 1
K = 1
L = 1000
N = L/(1-phi*n)
k0 = K/L

k[0] = k0 
t[0] = 0
l[0] = L
pop[0] = N

# loop
for i in np.arange(1,iter):
    k[i] = beta*(1-alpha)/(1+beta) * A * (k[i-1]**alpha)
    pop[i] = pop[i-1]*n
    l[i] = pop[i]*(1-phi*n)

print(f'{k} \n {l} \n {pop}')

