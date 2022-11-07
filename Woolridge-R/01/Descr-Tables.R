# load data set

data(affairs, package='wooldridge')

# Generate "Factors" to attach labels
haskids <- factor(affairs$kids,labels=c("no","yes"))
mlab <- c("very unhappy","unhappy","average","happy", "very happy")
marriage <- factor(affairs$ratemarr, labels=mlab)

# Frequencies for having kids:
table(haskids)
# Marriage ratings (share):
prop.table(table(marriage))

# Contigency table: counts (display & store in var.)
(countstab <- table(marriage,haskids))

# Share within "marriage" (i.e. within a row):
prop.table(countstab, margin=1)
# Share within "haskids"  (i.e. within a column):
prop.table(countstab, margin=2)
