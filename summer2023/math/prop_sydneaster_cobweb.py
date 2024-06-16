import numpy as np
import matplotlib.pyplot as plt

n = 100
T = np.arange(n)
q = np.zeros(n)
p = np.zeros(n)
S = np.zeros(n)
D = np.zeros(n)

# parameters
alpha = 2
beta = -2
gamma = 5
delta = 1.5
N = 3

# params
a = N / (2 * beta * delta)
b = (alpha * N + 2 * beta * gamma) / (2*beta*gamma)

# function to cal p
def cal_q(p):
    return (p-alpha)/(2*beta)

def cal_S(p):
    return N*(p-alpha)/(2*beta)

def cal_D(p):
    return gamma - delta*p

# initial values

T[0] = 0
q[0] = 0.5
p[0] = 1
D[0] = cal_D(p[0])
S[0] = cal_S(p[0])

# equilibrium
pp = b/(1-a)
qq = cal_q(pp)

# simulation
for t in range(1, n):
    T[t] = t
    p[t] = pp + (-a)**t * (p[0] - pp)
    q[t] = cal_q(p[t])
    S[t] = cal_S(p[t])
    D[t] = cal_D(p[t])

# print
print("a: ", a)
print("b: ", b)
print("pp: ", pp)
print("qq: ", qq)
print("p: ", p)
print("q: ", q)