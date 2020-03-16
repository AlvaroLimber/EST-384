################################
#Taller Componentes Principales (PCA)
#Objetivo: Aplicar el PCA
################################
#PASOS
################################
#1. Seleccione una base de datos de interés del repositorio 
#(E1=ENDSA,E2=COMPUTO,E3=ENDSA,E4=NNA)
#2. Seleccione las variables para el PCA (Según la motivación + literatura) 
#E1=("")
#E2=("CARACTERIZAR ARGENTINA")
#E3=("CUANTIS")
#E4=("CARACTERIZAR")
#2A TRANFORMAR (opcional) (E4)
#2B LIMPIEZA (E3,E4)
install.packages("varhandle")
library(varhandle)
aux<-to.dummy(computo$País,"pp")
head(aux)
computo<-cbind(computo,aux)
#3. Calcule el PCA
#4. Identifique el número de CPs que explican hasta el 90% de la varianza
#5. Identique las variables correlacionadas con la cantidad de 
#componentes fuera del 90% del paso anterior (E2)
#6. Calcule nuevamente el componente principal eliminando las variables rebundantes
#7. Determine la cantidad de componentes principales a retener ()
#8. Defina un indicador a partir de estos
#9. Modele un modelo lineal empleando los CPs retenidos.
#10. Existe algún valor atípico en la base de datos
#11. Comente los resultados

load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/oct20.RData?raw=true"))
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/endsa.RData?raw=true"))
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/nna16.RData?raw=true"))

names(endsa)
aa<-attributes(endsa)
str(aa)
aa$var.labels

table(endsa$ae01)





