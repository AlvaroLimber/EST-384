# exploracion de los datos
rm(list=ls())
library(ggplot2)
load(url("https://github.com/AlvaroLimber/EST-384/raw/master/data/eh18.Rdata"))
## Visualización de de datos

* una variable
* dos 
* multiples variables

### Una variable

#### cualtitativa
#donde vivia hace 5 años
t1<-prop.table(table(eh18p$s03a_01a))*100
barplot(t1,main="Donde vivia hace 5 años")

ggplot(eh18p,aes(x=s03a_01a))+
  geom_bar()+ggtitle("Donde vivia hace 5 años")+
  facet_wrap(~area)
ggplot(eh18p,aes(x=s03a_01a))+
  geom_bar()+ggtitle("Donde vivia hace 5 años")+
  facet_wrap(~depto)

#### cuantitativa

hist(eh18p$ylab)
boxplot(eh18p$ylab)
boxplot(log(eh18p$ylab))

#cuanti cuali
boxplot(log(eh18p$ylab)~eh18p$area)
boxplot(log(eh18p$ylab)~eh18p$s02a_02)

ggplot(eh18p,aes(x=ylab))+geom_boxplot()+
  facet_wrap(~depto)

ggplot(eh18p,aes(x=ylab))+geom_histogram()+
  facet_wrap(~depto)

ggplot(eh18p,aes(x=s02a_03))+geom_histogram()+
  facet_wrap(~area)

ggplot(eh18p,aes(x=depto,y=ylab))+geom_boxplot()

ggplot(eh18p,aes(x=depto,y=ylab))+
  geom_boxplot()+facet_wrap(~area)

# cuanti vs cuanti

plot(eh18p$tothrs,eh18p$ylab)
cor(eh18p$tothrs,eh18p$ylab,use =  "complete.obs")
plot(eh18p[,c("ylab","tothrs","aestudio")])
pairs(eh18p[,c("ylab","tothrs","aestudio")])
library(GGally)#gráficos de pares

ggpairs(eh18p,columns = c("ylab","tothrs","aestudio"))

# cuanti cuali

ggpairs(eh18p,columns = c("tothrs","aestudio","area","s02a_02"))

# multivariantes
s<-sample(1:dim(eh18p)[1],200)
i<-match(c("s02a_03","aestudio","ylab","tothrs"),names(eh18p))

ggparcoord(eh18p[s,],columns = i,groupColumn = "area")

ggparcoord(eh18p[s,],columns = i[1:2])
ggparcoord(eh18p[s,],columns = i)

library(TeachingDemos)
faces(na.omit(eh18p[s,i]))

eh18p[5092,i]

