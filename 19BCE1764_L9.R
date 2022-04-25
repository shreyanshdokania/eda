rm(list=ls())
#install.packages("factoextra")
#install.packages("cluster")
library(factoextra)
library(cluster)
#**************
#Load and preparing the data
#**************
df <- USArrests  
df <- na.omit(df)
head(df) 
df <- scale(df) # scaling to normalize the values >>>> x-xbar/SD
head(df)
#********************

# Hierachical clustering "complete linkage"
#********************
dist_mat <- dist(df, method = 'euclidean')
#dist_mat
hclust_complete <- hclust(dist_mat, method = 'complete')
plot(hclust_complete,cex=0.5, hang = -1) 
# hang = A negative value will cause the labels to hang down from 0.
# cex= font size 
cut<- cutree(hclust_complete, k = 3)
abline(h =4 , col = 'red')
rect.hclust(hclust_complete , k = 4, border = 2:5)


##########################################################


library(factoextra)
library(cluster)
#**************
#Load and preparing the data
#**************
df <- read.csv('seeds_K Means.csv')  
df <- na.omit(df)
head(df) 
df <- scale(df) # scaling to normalize the values >>>> x-xbar/SD
head(df)
#********************

# Hierachical clustering "complete linkage"
#********************
dist_mat <- dist(df, method = 'euclidean')
#dist_mat
hclust_complete <- hclust(dist_mat, method = 'complete')
plot(hclust_complete,cex=0.5, hang = -1) 
# hang = A negative value will cause the labels to hang down from 0.
# cex= font size 
cut<- cutree(hclust_complete, k = 4)
abline(h =4 , col = 'red')
rect.hclust(hclust_complete , k = 4, border = 2:5)




