#repopilación -> Almacenamiento (Almacen De datos)
# Data warehouse
#Importación y exploración
rm(list=ls())
#censos
setwd("C:\\Users\\ALVARO\\Documents\\data\\census")
cs<-read.csv2("cs92v1.csv")
names(cs)
View(cs)
summary(cs)
str(cs)
install.packages("dplyr")
library(dplyr)
library(help=dplyr)
#en R
third(second(first(arg)))
plot(as.data.frame(matrix(rnorm(10),2,5)))
third() %>%  second() %>%   first()
# en dlpyr
cs %>% select(ipro,urba) %>% table() %>% 
  prop.table(margin = 1)*100 

prop.table(table(cs[,c("ipro","urba")]),2)*100

up<-cs %>% filter(urba==1 & v14==1) 

up2<-cs[cs$urba==1 & cs$v14==1,]

#laboratorio1
#crear un indice de calidad de la vivienda (0=mala, 1=buena)
#1 = propia & pared (todo - adobe sin rev, caña, otros) 
# & techo (calamina, tejas) & piso (- tierra)
cs<-cs %>% mutate(cv=(v14==1 & (v03!=2 & v03!=6 & v03!=7) & 
        (v04==1 | v04==2) & v05!=5))
prop.table(table(cs$cv))
cs %>% select(cv) %>%  table()
cs %>% filter(cv==T) %>% select(v03, v04, v05,v14) %>% head()
#encuestas
setwd("C:\\Users\\ALVARO\\Documents\\data\\eh")
dir()
library(foreign)
eh18<-read.spss("EH2018_Persona.sav",to.data.frame = T,use.value.labels = F)
prop.table(table(eh18$p0))
prop.table(table(eh18$pext0))
install.packages("survey")
library(help=survey)
names(eh18)
sd1<-svydesign(~upm+folio,strata = ~estrato,weights = ~factor,data=eh18)
prop.table(svytable(~pext0,design=sd1))
#registros










