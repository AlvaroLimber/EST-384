################################
#Taller Componentes Principales (PCA)
#Objetivo: Aplicar el PCA
################################
#PASOS
################################
rm(list=ls())
#1. Seleccione una base de datos de interés del repositorio 
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/oct20.RData?raw=true"))
#2. Seleccione las variables para el PCA (Según la motivación) 
vv<-c(14:22,24,25)
#2A TRANFORMAR (opcional)

vval<-apply(computo[,vv],1,sum)
computo[1,vv]/vval[1]
aux<-computo[,vv]/vval
aux
#2B LIMPIEZA (E3,E4)
#3. Calcule el PCA
aux1<-na.omit(aux)
cp1<-eigen(cov(aux1))
cp2<-eigen(cor(aux1))
#4. Identifique el número de CPs que explican hasta el 90% de la varianza
cumsum(cp1$values)/sum(cp1$values) #3 99
cumsum(cp2$values)/sum(cp2$values) #3 90
#5. Identique las variables correlacionadas con la cantidad de 
#componentes fuera del 90% del paso anterior(E2)
cp11cov<-as.matrix(aux1)%*%cp1$vectors[,11] 
cp11cor<-as.matrix(aux1)%*%cp2$vectors[,11] 

cor(cbind(aux1,cp11cov,cp11cor))[1:11,12:13]
cor(cbind(aux1,cp10cov,cp10cor))[1:11,12:13]

cp11<-eigen(cov(aux1[,-2]))
cp21<-eigen(cor(aux1[,-2]))
cumsum(cp11$values)/sum(cp11$values) #3 99
cumsum(cp21$values)/sum(cp21$values) #3 90

cp10cov<-as.matrix(aux1[,-2])%*%cp11$vectors[,10] 
cp10cor<-as.matrix(aux1[,-2])%*%cp21$vectors[,10] 

cor(cbind(aux1[,-2],cp10cov,cp10cor))[1:10,11:12]

#6. Calcule nuevamente el componente principal eliminando las variables rebundantes
#7. Determine la cantidad de componentes principales a retener ()
cp1cov<-as.matrix(aux1[,-2])%*%cp11$vectors[,1] 
cp2cov<-as.matrix(aux1[,-2])%*%cp11$vectors[,2] 
plot(cp1cov,cp2cov)
#8. Defina un indicador a partir de estos
cor(cbind(aux1,cp1cov,cp2cov))[1:11,12:13]
bd<-cbind(aux1,cp1cov,cp2cov)
names(bd)[5]<-"MAS"
#9. Modele un modelo lineal empleando los CPs retenidos.
summary(lm(MAS~cp1cov,data=bd))
#10. Existe algún valor atípico en la base de datos
plot()
#11. Comente los resultados

load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/oct20.RData?raw=true"))
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/endsa.RData?raw=true"))
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/nna16.RData?raw=true"))

names(endsa)
aa<-attributes(endsa)
str(aa)
aa$var.labels

table(endsa$ae01)





