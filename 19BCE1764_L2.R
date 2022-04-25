#arima model
rm(list=ls())
#install.packages('forecast')
#install.packages('tseries')
library(forecast)
library(tseries)
setwd("D:/sem 6 docs/eda/19BCE1764_SHREYANSH_DOKANIA")
#data<-read.csv('Palmoil.csv')
#data
#View(data)

class(Palmoil) #type of data (here it is data.frame)
#frequency is 4 because each year data is 4 (ex 1990 year has 4 data)
#and so on
timeser=ts(Palmoil$Dollar,start=1,end=128,frequency=4)
class(timeser) #now this is ts type data i.e. what we need (time series)
plot(timeser) #this is more or less seasonal type of data
#need stationary data
#this is decay type data
acf(timeser) #data values should be between two blue lines shown
pacf(timeser) #sudden drop (more or less data is bw blue lines)
#confirmation test for stationarity level of the ts data
adf.test(timeser) # p<0.05 (95% confidence level) -> good stationarity

anal = auto.arima(timeser,ic="aic",trace=TRUE)
# aic - Akaike information criteria
#trace(checks all the possible p,d,q values and tries to fit with the best)
#if trace=false , it wont show what all values the arima function is trying

anal
#data was already stationary so d value is 0 here
acf(ts(anal$residuals)) #almost no residuals
#almost all data points lie in the range
#prediction -> forecasting
fcast = forecast(anal,level=c(95),h=10*4) #c(95) confidence level
#h=10*4 -> 128-138
fcast
plot(fcast)







