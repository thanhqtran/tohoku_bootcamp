import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd

# Solow Model
# 
# No population growth nor technological progress

# In[51]:


# parameters
alpha = 0.3
delta = 0.05
s = 0.5
g = 0.02

# initialize
K = 0.2
L = 1
A = 1
i = 0

# values
k_list = [ K/L ]
time = [ i ]

# time loop
diffk = K

while diffk > 0.05:
    i = i + 1
    time.append(i)
    Y = A * ( K ** (alpha)) * ( L ** (1 - alpha))
    K = s * Y + (1 - delta) * K
    k = K / (L)
    k_list.append(k)
    diffk = k - k_list[i-1]
    K = K

plt.plot(time, k_list)
plt.xlabel('Time')
plt.ylabel('Capital-labor ratio $k$')