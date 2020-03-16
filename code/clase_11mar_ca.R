rm(list=ls())
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/endsa.RData?raw=true"))
#analisis de correspondencia(cualitativas)
table(endsa$year)
bd08<-endsa[endsa$year==2008 & endsa$edad>20 & endsa$edad<40,]

names(bd08)
attributes(bd08)$var.labels
table(bd08$ant04)
table(bd08$ae01)
table(bd08$ant04,bd08$ae01)
tt<-table(bd08$ant04,bd08$ae01)
tt<-tt[,1:4]
tt<-tt[-11,]
tt
colnames(tt)<-c("sedu","pri","sec","sup")
chisq.test(tt)
library(ca)
plot(ca(tt))


