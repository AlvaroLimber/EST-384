rm(list=ls())
setwd("/Users/alvarolimber/Documents/GitHub/EST-384/data")
dir()
load("eh18.Rdata")
names(eh18p)

table(eh18p$s04f_35a)
table(eh18p$s04f_35b)
table(eh18p$s04f_35c)


str(eh18p$s04f_35a)

aux<-levels(eh18p$s04f_35a) 
aux[1]


(eh18p$s04f_35b==aux[1])*1
eh18p$s04f_35c==aux[1]

table(is.na(eh18p$s04f_35a))
table(is.na(eh18p$s04f_35b))
table(is.na(eh18p$s04f_35c))


x1<-(eh18p$s04f_35a==aux[1])*1
x1[is.na(x1)]<-0 

x2<-(eh18p$s04f_35b==aux[1])*1
x2[is.na(x2)]<-0 

x3<-(eh18p$s04f_35c==aux[1])*1
x3[is.na(x3)]<-0 

eh18p$atraco<-(x1==1 | x2==1 | x3==1)

prop.table(table(eh18p$atraco))*100

eh18p$s02a_03
library(dplyr)

eh18p %>% filter(s02a_03>=15) %>% select(atraco) %>% table() %>% prop.table() *100

prop.table(table(eh18p[eh18p$s02a_03>=15,"atraco"]))*100

eh18p$atraco[eh18p$s02a_03<15]<-NA

library(survey)
dm18p<-svydesign(ids=~upm,weights = ~factor,strata = ~estrato,data = eh18p)
t1<-svymean(~atraco*1,design=dm18p,na.rm=T)

table(eh18p$s02a_03[is.na(eh18p$s04f_35a)])
prop.table(table(eh18p$area))

prop.table(svytable(~area, design=dm18p))
confint(t1) 
cv(t1)
