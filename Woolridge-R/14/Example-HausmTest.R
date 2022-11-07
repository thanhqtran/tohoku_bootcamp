# Note that the estimates "reg.fe" and "reg.re" are calculated in
# Example 14.4. The scripts have to be run first.

# Hausman test of RE vs. FE:
phtest(reg.fe, reg.re)
