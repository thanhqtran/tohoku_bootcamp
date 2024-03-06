import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# latex font
plt.rc('text', usetex=True)
plt.rc('font', family='serif')


# parameters
delta = 0.6
psi = 0.1
s_bar = 1
phi = 0.4
w_m = 1
p_s = 0.5

# functions


def sthres_():
    return (w_m * phi - psi) / ((p_s + w_m)*phi)


def s_(w_f):
    if w_f < p_s:
        return 0
    else:
        return s_bar


def n_(w_f):
    s = s_(w_f)
    return (delta/(1+delta)) * (w_m + w_f) / (psi + (s*p_s + (1-s)*w_f)*phi)


w_f_vals = np.linspace(0, w_m, 100)
n_vals = np.zeros(100)
for i in range(100):
    n_vals[i] = n_(w_f_vals[i])

plt.figure(figsize=(4, 3))
plt.plot(w_f_vals, n_vals)
plt.xlabel('$w_f$', fontsize=15, loc='right')
plt.ylabel('$n$', fontsize=15, rotation=0, loc='top')
plt.scatter(sthres_(), n_(p_s), color='red')
plt.vlines(p_s, 0, n_(p_s), linestyle='--', color='grey')
plt.hlines(n_(p_s), 0, p_s, linestyle='--', color='grey')
plt.ylim(1.4, 4)

ax = plt.gca()
ax.margins(0)
# disable the top and right frame
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.show()