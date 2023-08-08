import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# load data
data = pd.read_csv('https://raw.githubusercontent.com/thanhqtran/tohoku_bootcamp/main/student_list.csv')

# convert 'year' column to datetime format yyyy/mm/dd
data['year'] = pd.to_datetime(data['year'], format='%Y/%m/%d')

df = pd.DataFrame(data)
seasons = ['Spring','Summer']


# group data by year
df2 = df.groupby('year').sum()

# create new season column, if month is 3, then the season is Spring, else Summer
df2['season'] = np.where(df2.index.month == 3, 'Spring', 'Summer')
df2['season_year'] = df2['season'] + ' ' + df2.index.year.astype(str)

# use latex font
plt.rc('text', usetex=True)
plt.rc('font', family='serif')
# use font size 18
plt.rcParams.update({'font.size': 13})
# plot bar chart
df2.plot.bar()

# legend above the plot horizontal
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc='lower left', ncol=3)

# label x-ticks with season_year
plt.xticks(np.arange(len(df2.index)), df2['season_year'], rotation=0)
plt.ylabel('Number of students')

# save png
plt.savefig('no_of_stu.png', dpi=300, bbox_inches='tight', pad_inches=0.1)
