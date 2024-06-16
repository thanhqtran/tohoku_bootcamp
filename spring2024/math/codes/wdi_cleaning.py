#!/usr/bin/env python
# coding: utf-8

# # CLEANING DATA DOWNLOADED FROM WDI

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# insert data location
data_loc = 'wdi_data_ch1.csv'

# import data
data_raw = pd.read_csv(data_loc)
# convert data from index 0 to 1303 to dataframe
df = pd.DataFrame(data_raw, index=range(0, 1085))
# extract all columns names
columns = df.columns


# In[3]:


# numeric columns as the last 10 columns
numeric_cols = df.columns[-10:]
df[numeric_cols] = df[numeric_cols].apply(
    pd.to_numeric, errors='coerce')  # coerce errors to NaN


# In[4]:


# create a new empty column
df['average'] = df[numeric_cols].mean(axis=1)


# In[5]:


# A function to extract data from the dataframe
def extract_data(series_name, data_frame):
    filtered_df = data_frame[data_frame['Series Name'] == series_name]
    filtered_values = filtered_df[['Country Code', 'average']]
    return filtered_values.reset_index(drop=True)


# In[6]:


# extract Series Name
Names = df['Series Name'].unique()


# In[7]:


# extract individual data 
fertlity_values = extract_data(Names[0], df)
infant_mortality_values = extract_data(Names[1], df)
edu_values = extract_data(Names[2], df)
gni_values = extract_data(Names[3], df)
gdp_values = extract_data(Names[4], df)


# In[8]:


# merge all the 5 dataframes by country code
merged1 = pd.merge(fertlity_values, infant_mortality_values, on='Country Code')
merged2 = pd.merge(merged1, edu_values, on='Country Code')
# rename
merged2.columns = ['Country Code', 'fertility',
                   'infant_mort', 'edu']
merged3 = pd.merge(merged2, gni_values, on='Country Code')
merged4 = pd.merge(merged3, gdp_values, on='Country Code')
# rename
merged4.columns = ['country', 'fertility','infant_mort', 'edu', 'gni', 'gdp']


# In[17]:


# drop all NaN values
merged4.dropna(inplace=True)

# make a new dataset
data_est = merged4.copy()
# calculate net_fertility and total_edu
data_est['net_fertility'] = data_est['fertility'] / 2 * (1  - data_est['infant_mort']/1000 )
data_est['total_edu'] = data_est['edu']/100 * data_est['gni']
data_est['log_gdp'] = np.log(data_est['gdp'])


# In[19]:


# example plot with linear regression

""" sns.lmplot(x='log_gdp', y='net_fertility',
           data=data_est, line_kws={'color': 'red'})
plt.title('Net Fertility vs Log GDP')
plt.xlabel('Log GDP')
plt.ylabel('Net Fertility')
plt.show() """


# # CAUTION
# The above code examples can help you plot figures for the Project. From this point onward, it mainly does some calibration for chapter 1.

# In[20]:


""" plt.plot(data_est['gni'], data_est['fertility'], 'o')
plt.title('GNI per capita vs Fertility')
plt.show()


# In[21]:


plt.plot(data_est['gni'], data_est['total_edu'], 'o', color='orange')
plt.title('GNI per capita vs Education expenses')
plt.show() """


# In[22]:


data = data_est[['country', 'fertility', 'gni', 'total_edu']]
# rename columns
data.columns = ['country', 'n', 'y', 'e+theta']


# # CALIBRATION

# In[23]:


# estimate parameters phi, theta, eta, gamma using MLE
# data is the dataframe data_est
# equations that use the parameters are v_, e_, n_
# y is gdp, n is fertility, e is education, v is productivity


# define the MLE function and print estimated results with estimates, standard errors, and p-values
from scipy.optimize import minimize


# In[121]:


def n_hat_(phi, theta, eta, gamma, y, n):
    return (1-eta) * gamma * (y / (1 - phi * n)) / ((1+gamma) * (phi*(y / (1 - phi * n)) - theta))

def e_hat_(phi, theta, eta, gamma, y, n):
    return (eta * gamma * (y / (1 - phi * n)) - theta) / (1-eta)

# using the data of n = data['n'] and y = data['y'] to estimate the parameters phi, theta, eta, gamma using MLE method
n_real = data['n']
y_real = data['y']
e_theta_real = data['e+theta']

# write the likelihood function
def likelihood(params, n, y, e_theta):
    phi, theta, eta, gamma = params
    n_hat = n_hat_(phi, theta, eta, gamma, y_real, n_real)
    e_hat = e_hat_(phi, theta, eta, gamma, y_real, n_real) 
    log_likelihood = np.log(n_hat) + np.log(e_hat) + np.log(e_theta)
    return -np.sum(log_likelihood)


# initial guess
theta_min = min(data['e+theta'])
theta_max = max(data['e+theta'])
params0 = np.array([0.039, 51.61, 0.572, 0.103])



# minimize the negative likelihood function
res = minimize(likelihood, params0, args=(n_real, y_real, e_theta_real), method='L-BFGS-B', bounds=((0, 1), (theta_min, theta_max), (0, 1), (0, 1)))

# print the estimated parameters
phi, theta, eta, gamma = res.x

""" print('phi:', phi)
print('theta:', theta)
print('eta:', eta)
print('gamma:', gamma) """


# In[122]:


# calculate the threshold
def w_threshold(theta, phi, eta):
    return theta / (phi * eta)

w_thres = w_threshold(theta, phi, eta)


# In[123]:


# calculate the estimated productivity
data2 = data.copy()
data2['w_hat'] = data2['y'] / (1 - phi * data2['n'])


# In[124]:


# if w_hat > w_thres, then data['n_hat'] = (1-eta)*gamma*w_hat / ((1+gamma)*(phi*w_hat - theta))
# if w_hat < w_thres, then data['n_hat'] = gamma/(phi*(1+gamma))
# if w_hat > w_thres, then data['e_hat'] = (eta*phi*w_hat - theta) / (1-eta)
# if w_hat < w_thres, then data['e_hat'] = 0

def n_hat2(phi, theta, eta, gamma, w, w_thres):
    if w > w_thres:
        return (1-eta)*gamma*w / ((1+gamma)*(phi*w - theta))
    else:
        return gamma / (phi*(1+gamma))

data2['n_hat'] = data2.apply(lambda x: n_hat2(phi, theta, eta, gamma, x['w_hat'], w_thres), axis=1)

def e_hat(phi, theta, eta, w, w_thres):
    if w > w_thres:
        return (eta*phi*w - theta) / (1-eta)
    else:
        return 0

data2['e_hat'] = data2.apply(lambda x: e_hat(phi, theta, eta, x['w_hat'], w_thres), axis=1)


# In[125]:


# sort data2 by w_hat
data2 = data2.sort_values(by='w_hat')


# In[126]:


w_min = min(data2['w_hat'])
w_max = max(data2['w_hat'])
w_vals = np.linspace(w_min, w_max, 300)
n_vals = [n_hat2(phi, theta, eta, gamma, w, w_thres) for w in w_vals]
e_vals = [e_hat(phi, theta, eta, w, w_thres) for w in w_vals]


# In[127]:


# measure fitness of the model, with n_hat as the predicted value and n as the true value

import statsmodels.api as sm

estimated_n = data2['n_hat']
true_n = data2['n']
estimated_e = data2['e_hat']
true_e = data2['e+theta']

# calculate standard error, R-squared, and t-statistic and p-value
# for n
Xn = sm.add_constant(estimated_n)
modeln = sm.OLS(true_n, Xn)
resultsn = modeln.fit()

# for e
Xe = sm.add_constant(estimated_e)
modele = sm.OLS(true_e, Xe)
resultse = modele.fit()

#print(results.summary())


# In[142]:


# plot
""" plt.plot(data2['w_hat'], data2['n'], 'o', alpha=0.5)
plt.plot(w_vals, n_vals, label='n_hat', linewidth=2)
plt.xlabel(r'v (international USD)', rotation=0, labelpad=15)
plt.ylabel(r'n (fertility per woman)', labelpad=15)
plt.legend(['data', 'model'], fontsize=10)

plt.show()


# In[144]:


# plot
# scatter plot of w and e+theta
plt.plot(data2['w_hat'], data2['e+theta'], 'o', alpha=0.5)
plt.plot(w_vals, e_vals, label='e_hat', linewidth=2)
plt.xlabel(r'v (international USD)', rotation=0, labelpad=15)
plt.ylabel(r'e (international USD)',labelpad=15)
plt.legend(['data', 'model'], loc='upper left', fontsize=10)
plt.show() """