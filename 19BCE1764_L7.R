library(factoextra)
library(cluster)

data <- autos_K_Means
data <- na.omit(data)

View(data)

data<-data[,sapply(data,is.numeric)]
temp<-data
head(data)
data <- scale(data)
head(data)

fviz_nbclust(data,pam,method="wss")
gap_stat <- clusGap(data,FUN=pam,K.max=10,B=50)

fviz_gap_stat(gap_stat)

set.seed(1)
kmed<-pam(data,k=6)

kmed

fviz_cluster(kmed,data=data)

final_data <- cbind(temp,cluster=kmed$cluster)
head(final_data)










