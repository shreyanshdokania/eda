setwd("/media/shreyansh/HDD/d/sem 6 docs/eda/19BCE1764_SHREYANSH_DOKANIA")
x<-1:5
y<-c(3,5,7,9,11)
data_set<-data.frame(x,y)
data_set
View(data_set)
str(data_set)
names(data_set)
plot(x,y) #scatter plot
#lm for linear regression, y is dependent variable ,x is independent
lr_result<-lm(y~x)
lr_result
#b0(beta_not) is y-coefficient and b1 is x-coefficient
#y=b0+b1*x
#lr_result is linear regression model
summary(lr_result)
#draw mean line in the plot
abline(lr_result,col="blue")
x=data.frame(x=6:8)
res<-predict(lr_result,x)
res
x=data.frame(x=c(6,7,8))
res1<-predict(lr_result,x)
res1
summary(res)


x<-c(200,500,700,1000)
y<-c(0.25,0.5,0.8,1.5)
newdata<-data.frame(x,y)
newdata
View(newdata)
str(newdata)
names(newdata)
plot(x,y) 
newres<-lm(y~x)
newres
summary(newres)
abline(newres,col="magenta")
x=data.frame(x=1200)
newtempres1<-predict(newres,x)
newtempres1
x=data.frame(x=c(1200))
newtempres2<-predict(newres,x)
newtempres2
summary(newtempres1)

