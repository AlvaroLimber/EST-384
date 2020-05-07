rm(list=ls())
library(dplyr)
load(url("https://github.com/AlvaroLimber/EST-384/raw/master/data/endsa.RData"))
ll<-attributes(endsa)
ll$var.labels
t1<-endsa %>% filter(year==2008) %>% select(7,14) %>% table()
t1<-t1[1:4,]
t1
#paso 0, verificar si existe relación a nivel de variables
#test chi-cuadrado
chisq.test(t1)
addmargins(t1,c(1,2))
ff<-margin.table(t1,1)
cc<-margin.table(t1,2)
n<-sum(ff)
ee<-(ff%*%t(cc))/n
ee
Ho: independencia  Ha: ~independencia
p-valor=pr(Ho)
#paso 1
N<-t1
P<-N/n
addmargins(P,c(1,2))
rr<-margin.table(P,1)
cc<-margin.table(P,2)
Dr<-diag(rr)
Dc<-diag(cc)
S<-diag(rr^(-0.5)) %*% (P-rr %*%t (cc))%*%diag(cc^(-0.5))
S
#paso2
u<-svd(S)$u
v<-svd(S)$v
Da<-diag(svd(S)$d)
u # filas
v # columnas
Da # inercia = varianza
#paso 3

#paso 4

########################################
library(ca)
plot(ca(N))


