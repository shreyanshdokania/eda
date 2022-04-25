rm(list=ls())
#k means clustering 

#install.packages("factoextra")
library(factoextra)
#install.packages("cluster")
library(cluster)


data <- USArrests
head(data)
data = na.omit(data)

data = scale(data)
head(da)

#determine optimal number of clusters
#wss -> within sum of squares
fviz_nbclust(data,kmeans,method="wss")

set.seed(1)

km <- kmeans(data,centers=4,nstart=25)
km

fviz_cluster(km,data=data)

final_data <- cbind(USArrests,cluster=km$cluster)
head(final_data)















