rm(list=ls())
setwd("D:/sem 6 docs/eda/19BCE1764_SHREYANSH_DOKANIA")

data<-read.csv('admission.csv')
str(data)
View(data)
head(data)
summary(data)
hist(data$admit,col="blue")
data$admit <- as.factor(data$admit)
summary(data)

#classification and regression training
library(caret)
train_ind = createDataPartition(data$admit,p=0.80,list=F)
#0.80-> 80% data for training , rest for testing
train_ds = data[train_ind,]
test_ds = data[-train_ind,]
#general linear model for logistic regression
mymodel = glm(admit~.,data=train_ds,family="binomial")
# . -> all of train_ds
summary(mymodel)

pred_train = predict(mymodel,train_ds,type="response")
pred_train

#create confusion matrix
pred_train = ifelse(pred_train>0.5,1,0)
tab1 <- table(Predicted=pred_train,Actual=train_ds$admit)
tab1

1-sum(diag(tab1))/sum(tab1) #Misclassification error
pred_test <- predict(mymodel,test_ds,type="response")
pred_test
pred_test <- ifelse(pred_test>0.5,1,0)
tab2 <- table(Predicted=pred_test,Actual=test_ds$admit)
tab2
1-sum(diag(tab2))/sum(tab2)





