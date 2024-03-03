import numpy as np 
import matplotlib.pyplot as plt

# latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# solve for h
v = 1.2
gamma1 = 8
gamma2 = 8*2
gamma3 = 6
mu = np.log(v)
phi = 0.3
delta = 0.5

h_thres1 = v/(delta*gamma1)
h_thres2 = v/(delta*gamma2)
h_thres3 = v/(delta*gamma3)
hvals = np.linspace(0, 3, 100)
h1_vals = np.zeros(100)
h2_vals = np.zeros(100)
h3_vals = np.zeros(100)


def h1_(h):
    if h <= h_thres1:
        return mu
    else:
        return np.log(delta*(gamma1*h+v)/(1+delta))

def h2_(h):
    if h <= h_thres2:
        return mu
    else:
        return np.log(delta*(gamma2*h+v)/(1+delta))

def h3_(h):
    if h <= h_thres3:
        return mu
    else:
        return np.log(delta*(gamma3*h+v)/(1+delta))

for i in range(100):
    h1_vals[i] = h1_(hvals[i])
    h2_vals[i] = h2_(hvals[i])
    h3_vals[i] = h3_(hvals[i])


plt.figure(figsize=(4, 3))
#plt.ylim(0, 4)
plt.plot(hvals, h1_vals,
         label=r'$\gamma < \frac{v}{\delta}\frac{1}{\ln(v)} $', linewidth=2)
plt.plot(hvals, h2_vals, label=r'$\gamma > \frac{v}{\delta}\frac{1}{\ln(v)} $', linewidth=2, ls='--')
#plt.plot(hvals, h3_vals, label=r'$\gamma < \frac{v}{\delta}(1+\delta) $', linewidth=2, ls='--')
# plot 45 degree line
plt.plot(hvals, hvals, linestyle=':', color='grey', label=r'$h_{t+1} = h_t$')
# disable top and right frames
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.xlabel(r'$h_t$', fontsize=14, loc='right')
plt.ylabel(r'$h_{t+1}$', fontsize=14, loc='top', rotation=0)
# set margin to 0
plt.margins(0)
plt.legend(fontsize=9)
plt.show()