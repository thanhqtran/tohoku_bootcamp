# Using functions
import numpy as np
import matplotlib.pyplot as plt
# PARAMETERS

alpha = 1 - 0.43
beta = 0.95**30 # literature: 0.99, 0.98, 0.95 (quarterly)
n = 1.05
phi = (98.48 + 46.74)/(2*60*(24-8))
gamma = n*phi*(1+beta)/(1-n*phi)


def cal_k(k):
    return beta*(1-alpha)/(1+beta) * A * (k**alpha)

def cal_pop(population):
    return population * n 

def cal_labor(population):
    return population * (1-phi*n)

# METHOD 2
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
    k[i] = cal_k(k[i-1])
    pop[i] = cal_pop(pop[i-1])
    l[i] = cal_labor(pop[i])

print(f'{k} \n {l} \n {pop}')