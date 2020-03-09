################################
#Taller Componentes Principales (PCA)
#Objetivo: Aplicar el PCA
################################
#PASOS
################################
#1. Seleccione una base de datos de interés del repositorio
#2. Seleccione las variables para el PCA (Según la motivación)
#3. Calcule el PCA
#4. Identifique el número de CPs que explican hasta el 90% de la varianza
#5. Identique las variables correlacionadas con la cantidad de 
#componentes fuera del 90% del paso anterior
#6. Calcule nuevamente el componente principal eliminando las variables rebundantes
#7. Determine la cantidad de componentes principales a retener ()
#8. Defina un indicador a partir de estos
#9. Modele un modelo lineal empleando los CPs retenidos.
#10. Existe algún valor atípico en la base de datos
#11. Comente los resultados

load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/oct20.RData?raw=true"))
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/endsa.RData?raw=true"))
load(url("https://github.com/AlvaroLimber/EST-384/blob/master/data/nna16.RData?raw=true"))
