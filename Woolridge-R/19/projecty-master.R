########################################################################
# Bachelor Thesis Mr. Z
# "Best Practice in Using R Scripts"
#
# R Script "master"
# Date of this version: 2016-02-08
########################################################################

# Some preparations:
setwd(~/bscthesis/r)
rm(list = ls())

# Call R scripts
source("data.R"        ,echo=TRUE,max=1000) # Data import and cleaning
source("descriptives.R",echo=TRUE,max=1000) # Descriptive statistics
source("estimation.R"  ,echo=TRUE,max=1000) # Estimation of model 
source("results.R"     ,echo=TRUE,max=1000) # Tables and Figures
