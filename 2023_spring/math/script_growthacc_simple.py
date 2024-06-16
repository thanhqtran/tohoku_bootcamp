#!/usr/bin/env python
# coding: utf-8

# In[53]:


import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd


# Growth Accounting
# 
# Cobb-Douglas Production Function (Hicks Neutral)

# In[72]:


# import data
url = 'https://raw.githubusercontent.com/thanhqtran/dataset/main/pwt/pwt10_raw.csv'
pwt_data = pd.read_csv(url)
# convert to dataframe
df = pd.DataFrame(pwt_data)
df_raw = df[df['countrycode'] == 'USA']
# we need capital stock, labor, output, and labsh (labor share)
df_raw = df_raw[['year', 'rgdpna', 'emp', 'rnna', 'labsh']]
dfna = df_raw.dropna()
dfna = dfna.reset_index(drop=True)
# extract every 10 years starting from 1954
n = 10
dfna_n = dfna.iloc[::n, :]
dfna_n = dfna_n.reset_index(drop=True)
dfna_n
# growth accounting
## take the log of the variables
dfna_n['log_rgdpna'] = np.log(dfna_n['rgdpna'])
dfna_n['log_emp'] = np.log(dfna_n['emp'])
dfna_n['log_rnna'] = np.log(dfna_n['rnna'])
## calculate the aggregate growth rate of the variables
dfna_n['gr_rgdpna'] = (dfna_n['log_rgdpna'].diff())*100
dfna_n['gr_emp'] = (dfna_n['log_emp'].diff())*100
dfna_n['gr_rnna'] = (dfna_n['log_rnna'].diff())*100
## calculate the average growth rate of the variables 
dfna_n['avg_gr_rgdpna'] = dfna_n['gr_rgdpna']/n
dfna_n['avg_gr_emp'] = dfna_n['gr_emp']/n
dfna_n['avg_gr_rnna'] = dfna_n['gr_rnna']/n
## calculate the contribution of each variable to the growth rate of output
dfna_n['contribution_kna'] = dfna_n['avg_gr_rnna']*(1-dfna_n['labsh'])
dfna_n['contribution_emp'] = dfna_n['avg_gr_emp']*(dfna_n['labsh'])
dfna_n['contribution_tfp'] = dfna_n['avg_gr_rgdpna'] -dfna_n['contribution_kna'] - dfna_n['contribution_emp']
dfna_n
## calculate contribution weight 
dfna_n['weight_kna'] = dfna_n['contribution_kna']/dfna_n['avg_gr_rgdpna']
dfna_n['weight_emp'] = dfna_n['contribution_emp']/dfna_n['avg_gr_rgdpna']
dfna_n['weight_tfp'] = dfna_n['contribution_tfp']/dfna_n['avg_gr_rgdpna']
dfna_n