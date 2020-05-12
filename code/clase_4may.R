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
#Ho: independencia  Ha: ~independencia
#p-valor=pr(Ho)
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
#Coordenadas principales de filas: $F=D_r^{-1/2} U D_{\alpha}$
FF<-diag(rr^(-0.5))%*% u %*%Da
#paso 4
#Coordenadas principales de filas: $G=D_c^{-1/2} V D_{\alpha}$
GG<-diag(cc^(-0.5))%*% v %*%Da
########################################
cumsum(svd(S)$d)/sum(svd(S)$d)
#grafico 1
plot(FF[,1],FF[,2],type="n",xlim=c(-1,1))
text(FF[,1],FF[,2],labels = row.names(t1),cex=0.7)
text(GG[,1],GG[,2],labels = colnames(t1),col="red",cex=0.7)

#grafico 2
wr<-margin.table(prop.table(t1),1)
wc<-margin.table(prop.table(t1),2)
plot(FF[,1],FF[,2],type="n",xlim=c(-1,1))
text(FF[,1],FF[,2],labels = row.names(t1),cex=0.4+wr)
text(GG[,1],GG[,2],labels = colnames(t1),col="red",cex=0.4+wc)
library(ca)
plot(ca(t1))
# Análisis de correspondencia múltiple (3 variables o más cualitativas)

### Ejercicio 
Explorar la libraria explor y FactoMineR y usar la endsa:
  
  * Elegir variables cuantitativas y generar el dashboard para el análisis de componentes principales
  * Elegir 2 variables cualitativas y generar el dashboard para el análisis de correspondencia simple
  * Elegir 4 variables cualitativas y generar el dashboard para el análisis de correspondencia múltiple










