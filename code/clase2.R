rm(list = ls())
library(readxl)
setwd("C:\\Users\\ALVARO\\Box\\UMSA\\2019\\anomalias")
bd<-read_excel("computo.xlsx")
head(bd)
bdp<-bd[bd$Elección=="Presidente y Vicepresidente",]
bdp<-bdp[bdp$País=="Bolivia",]
#patron en los municipios, cc
head(bdp)
tapply(bdp$CC, bdp$Municipio, sum)
bdmun<-aggregate(bdp[,c("Votos Válidos","CC","MAS - IPSP")]
                 ,by=list(bdp$Departamento,bdp$Municipio),sum)
bdmun$pcc<-bdmun$CC/bdmun$`Votos Válidos`
bdmun$pmas<-bdmun$`MAS - IPSP`/bdmun$`Votos Válidos`
plot(bdmun$pcc,bdmun$pmas)
head(bdmun)
hist(bdmun$pcc)
names(bdmun)<-c("dep","mun","vv","cc","pcc")
bdmun[bdmun$pcc<0.02,"mun"]
bdmun[bdmun$pcc>0.6,"mun"]
#fraude - Ley Benford (segundo digito) Tarea




