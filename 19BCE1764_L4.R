rm(list=ls())
setwd("D:/sem 6 docs/eda/19BCE1764_SHREYANSH_DOKANIA")

data<-read.csv('onewayanova_machine.csv')
data
summary(data)
#since we are interested in the mean
#use box plot
boxplot(data,ylab="Diameter",xlab="Machines",col="green")
#significant difference between means 
# aov(y-x) -> we need y and x and not 5(multiple) cols
stacked_group<-stack(data)
stacked_group

names(stacked_group) <- c("Diameter","Machines")
stacked_group

anovares<- aov(Diameter~Machines,data=stacked_group)
anovares
summary(anovares)

#since ** is there in (Pr(>F)), it is statistically significant
#Tukey's honest significance test
#to determine if any group is having significance difference
tk <- TukeyHSD(anovares)
tk
#with the least value of p machine4 and 2 has most significant diff

plot(tk,col="blue")


rm(list=ls())
data<-read.csv("One way Anova_Football.csv")
data

summary(data)
boxplot(data,ylab="Strat",xlab="Teams")

stgrp<-stack(data)
stgrp

names(stgrp) <- c("Strat","Teams")
stgrp

anov<-aov(Strat~Teams,data=stgrp)
summary(anov)

tukhsd<-TukeyHSD(anov)
tukhsd

plot(tukhsd,col="blue")




