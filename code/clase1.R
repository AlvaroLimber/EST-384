rm(list=ls())
install.packages("readxl")
library(readxl)
library(dplyr)
setwd("C:\\Users\\ALVARO\\Box\\UMSA\\2019\\anomalias")
bd<-read_excel("computo.xlsx")
head(bd)
View(bdp)
table(bd$Elección)

bdp<-bd[bd$Elección=="Presidente y Vicepresidente",]

table(bd$Elección)

for(i in 1:26){
  print(i)
  print(table(is.na(bdp[,i])))
}
bdp2<-bdp[bdp$País=="Bolivia",]
View(bdp2)



