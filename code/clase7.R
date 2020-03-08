toupper("hola")
abc<-letters[1:10]
toupper(abc)

tolower("HOLA")
tolower("Juan")

substr("hola como estan",1,3)
substr("hola como estan",3,7)

nchar("hola")
nchar("         ")

gsub("a","x","hola como estas")
grepl("ho","hola")

grepl("a",c("hola","como"))
grepl("o",c("hola","como"))
grepl("ho",c("hola","como"))

library(stringi)
library(dplyr)
set.seed(999)
x<-rpois(100,60)
set.seed(999)
y<-runif(100)
bd<-data.frame(x,y)
bd
bd$xs<-scale(bd$x)
bd$ys<-scale(bd$y)
head(bd)
summary(bd)
apply(bd, 2, sd)
cov(bd)
cor(bd)

setwd("C:\\Users\\ALVARO\\Documents\\data\\eh")
library(foreign)
eh18<-read.spss("EH2018_Persona.sav",to.data.frame = T,use.value.labels = F)
par(mfrow=c(2,2))
plot(density(eh18$ylab,na.rm=T))
plot(density(log(eh18$ylab),na.rm=T))
plot(density(scale(eh18$ylab),na.rm=T))

par(mfrow=c(2,2))
hist(eh18$ylab)
hist(log(eh18$ylab))
hist(scale(eh18$ylab))

eh18$ylablog<-log(eh18$ylab)



lm(ylab~aestudio,data=eh18)
lm(ylablog~aestudio,data=eh18)

summary(lm(ylab~aestudio,data=eh18))
summary(lm(ylablog~aestudio,data=eh18))

summary(lm(ylablog~factor(aestudio),data=eh18))
summary(lm(ylab~factor(aestudio),data=eh18))
eh18$rural<-eh18$area==2

mean(eh18$rural)

#Ejercicios sobre la EH18
#1 Obtener la matriz de covarianza y correleacion de las variables
# ylab edad aestudio yhog yper
names(eh18)[6]<-"edad"
vaux<-c("ylab", "edad", "aestudio", "yhog", "yper")
pos<-complete.cases(eh18[,vaux])
table(pos)
cov(eh18[pos,vaux])
cor(eh18[pos,vaux])
#2 Obtener la matriz de covarianza y correleacion de las variables
# ylab edad aestudio yhog yper y sus estandarizadas
k<-0
for(i in vaux){
  eh18[,460+k]<-scale(eh18[,i])
  k<-k+1
}

k<-0
for(i in vaux){
  eh18[,465+k]<-log(eh18[,i])
  k<-k+1
}

names(eh18)[460:464]<-paste0(vaux,"_s")
names(eh18)[465:469]<-paste0(vaux,"_l")
names(eh18)
#3 Obtener la matriz de covarianza y correleacion de las variables
# ylab edad aestudio yhog yper, sus estandarizadas y sus logaritmos

#4 Crear una variable que identifique el quintil de ingreso laboral 
# de las personas 
#Tarea * 1pt (LUNES)

#5 Crear una variables que identifique a las personas cuyo ingreso
# del hogar laboral percapita (yhogpc) sea inferior a la linea 
#de pobreza moderada (z)
#tarea 

airquality





















