rm(list=ls())
setwd("D:/sem 6 docs/eda/19BCE1764_SHREYANSH_DOKANIA")

library(forecast)
library(tseries)

data <- read.csv('Tractor-Sales.csv')
data
#View(data)

class(data)
data=ts(data$Number.of.Tractor.Sold,start=c(2003,1),frequency=12)
class(data)

plot(data,xlab='Years',ylab='Tractor Sales')
#not stationary -> so differencing and visualising
plot(diff(data),ylab='Differenced Tractor Sales')
#got constant mean, but not variance, so use log function

logfunc = log10(data)
plot(logfunc,ylab='Log of Tractor Sales')

#again not stationary, so do differencing again
df<-diff(logfunc)
plot(df,ylab='Differenced Log Tractor Sales')

#mean and variance constant, now check stationary using 
#augmented dickey fuller test
adf.test(df)
#p is less than 0.05 , so stationary

#multiple graphs in a single row , 1 row 2 graphs
par(mfrow=c(1,2))  

acf(ts(df),main='ACF Tractor Sales') #main is title of the graph
pacf(ts(df),main='PACF Tractor Sales')

arimafit = auto.arima(df,ic="aic",trace=TRUE)
summary(arimafit)

fc = forecast(arimafir,level=c(95),h=3*12) #h=3*12, 12 freq,3 (next 3 years)
plot(fc)
summary(fc)

data<-read.csv('F:/ID3-Split-Calculator-master/data.csv')
View(data)
