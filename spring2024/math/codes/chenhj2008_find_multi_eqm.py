# library
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve
import pandas as pd

# parameters
## unchaged parameters regardless of other params

beta = 0.99**35
alpha = 0.33


# functions
def eta_(x):
    return (1 + gamma + beta*x) / (1 + beta*x)

def theta_(x):
    return ((1-alpha)/b)**(1/alpha) * (1-sigma)**((eta_(x)/alpha) - 1) * eta_(x)

def kbar_(x):
    return ((b/(1-alpha))**(1/alpha)) * ((1-sigma)**(1 - (eta_(x))/alpha)) / eta_(x)

# Conditions for 3 equilibria
# there exists an k < kbar such that f(k, x) < k
def upper_bound_A(k, x):
    a = ((1-alpha)/(b**(1-alpha)))**(1/alpha) * ((1-sigma)**((1-alpha)*eta_(x)/alpha)) * eta_(x)
    num = gamma * (1 - sigma * theta_(x) * k) * k
    dem = beta * z * x * ( (a - b * theta_(x))*k + b)
    return num/dem

# condition of A such that f'(k) > k for k > kbar
def lower_bound_A(x):
    num = gamma * ((1-sigma)**alpha) * (kbar_(x)**(1-alpha))
    dem = alpha * beta * z * x * (1-alpha) * (eta_(x)**alpha)
    return num/dem

# A routine to find an A satisfying the above conditions

freq = 20 # number of steps. Increasing this number will make the loop longer, but more accurate.

sigma_vals = np.linspace(0.1, 0.9, freq)    # specify the range of values for sigma
z_vals = np.linspace(0.1, 0.9, freq)        # specify the range of values for z
xvals = np.linspace(0.5, 0.9, 6)            # specify the range of values for x. Since x is life longevity, it should be more than half
bvals = np.linspace(0.1, 2, freq)           # specify the range of values for b
gammavals = np.linspace(0.1, 0.9, freq)     # specify the range of values for gamma. Gamma should be <1
epsilon_vals = np.linspace(0.1, 0.9, freq)  # epsilon is proportional to kbar. epsilon = 0.9 means the k at that spot = 0.9 kbar.

# find the combination of x,b, and gamma such that there are 3 equilibria
# create a bunch of lists to store results

res_x = []
res_b = []
res_gamma = []
res_sigma = []
res_z = []
res_epsilon = []
res_k = []
res_A_upper = []
res_A_lower = []
res_tcons_skill = []
res_tcons_unskill = []

# loop through each values to find the params

for x in xvals:
    for b in bvals:
        for gamma in gammavals:
            for sigma in sigma_vals:
                for z in z_vals:
                    kbar = kbar_(x)
                    if kbar > 5: # specify the desired value of kbar. Lowering this value will make the loop faster.
                        pass
                    else:
                        for epsilon in epsilon_vals:
                            k = epsilon*kbar
                            upper_A = upper_bound_A(k, x)
                            lower_A = lower_bound_A(x)
                            if (upper_A - lower_A > 0):
                                # check if the time constraints for both types satisfy
                                diff_skill = 1 - sigma - z * (gamma*(1-sigma)/(z*(1+gamma+beta*x)))
                                diff_unskill = 1 - z * (gamma/(z*(1+gamma+beta*x)))
                                # if time constraint is > 0, add to result
                                if ((diff_skill > 0) and (diff_unskill > 0)):
                                    res_x.append(x)
                                    res_b.append(b)
                                    res_gamma.append(gamma)
                                    res_sigma.append(sigma)
                                    res_z.append(z)
                                    res_epsilon.append(epsilon)
                                    res_k.append(k)
                                    res_A_lower.append(lower_A)
                                    res_A_upper.append(upper_A)
                                    res_tcons_skill.append(diff_skill)
                                    res_tcons_unskill.append(diff_unskill)         
                                print(
                                    'x', x,
                                    'b', b,
                                    '𝜎', sigma, 
                                    '𝑧', z,
                                    '𝛾', gamma,
                                    'k_under', k,
                                    'A_lower', lower_A,
                                    'A_upper', upper_A,
                                    'tcons_skill', diff_skill,
                                    'tcons_unskill', diff_unskill
                                )
                                break
                            else:
                                continue

# merge all the lists into a DataFrame

params = {
    'x': res_x,
    'b': res_b,
    'gamma': res_gamma,
    'sigma': res_sigma,
    'z': res_z,
    'epsilon': res_epsilon,
    'k': res_k,
    'lower_A': res_A_lower,
    'upper_A': res_A_upper,
    'tcons_skill': res_tcons_skill,
    'tcons_unskill': res_tcons_unskill
}

# Creating DataFrame
df = pd.DataFrame(params)
df