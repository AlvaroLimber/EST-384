#1. Preparación 
#2. Modelado (Exploracion, PCA, AC) #
#3  Clustering 
#4. Regresion
#5. Mineria de texto
#6. Clasificación

#MODELADO 

## Exploracion de los datos

* Resumen de estadísticas de los datos 
* Visualización de los datos

### Resumen de los datos

* Cuál es el valor más común?
* Cuán variable o dispersa es la información?
* Existen valores extraños (outliers) o inesperados en la base de datos (perdidos)
* Los datos siguen alguna distribución 

load(url("https://github.com/AlvaroLimber/EST-384/raw/master/data/eh18.Rdata"))

at<-attributes(eh18p)
at$variable.labels[1:20]
# media
mean(eh18p$s02a_03)
# mediana
median(eh18p$s02a_03)

library(DMwR2)

centralValue(eh18p$s02a_02)
centralValue(eh18p$s02a_03)

# exploracion por grupos
library(dplyr) # %>%
mean(eh18p$s02a_03)

eh18p %>% select(s02a_02) %>% table()
table(eh18p$s02a_02)

t1<-eh18p %>% group_by(depto,area) %>% 
  summarise(media=mean(s02a_03),mediana=median(s02a_03),N=n(),
            min_ylab=min(ylab,na.rm = T),max_ylab=max(ylab,na.rm = T))

eh18p %>% group_by(depto,area) %>% 
  summarise(sd(s02a_03),IQR(s02a_03))
quantile(eh18p$s02a_03)

# exploración a fondo
library(Hmisc)

describe(eh18p[,3:7])
describe(eh18p[,"ylab"])

# Visualización de los datos

* Una de una variable
* De dos variables 
* Multiples variables

barplot(table(eh18p$s03a_01a))
library(ggplot2)

ggplot(eh18p,aes(x=s03a_01a))+geom_bar()+ggtitle("Dónde vivia hace 5 años")



library(GGally)
ggpairs(eh18p,columns = c("ylab","tothrs","s02a_03","area"))











