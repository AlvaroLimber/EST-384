rm(list=ls())
aux<-read.table("clipboard",header = T)
aux
##API DE google trends
install.packages("gtrendsR")
library(gtrendsR)
bd<-gtrends("Bolivia")
str(bd)

plot(bd[[1]]$date,bd[[1]]$hits,type = "l")

bd2<-gtrends(c("Bolivia","Chile"))
View(bd2[[1]])

std<-data.frame(name=c("ana","juan","carla"),math=c(86,43,80),stat=c(90,75,82))
std
library(tidyr)
gather(std,materia,nota,math:stat)#reshape

library(readxl)
setwd("C:\\Users\\ALVARO\\Documents\\data\\otro")
tit<-read_excel("C070311.xls",col_names = F)
aux2<-read_excel("salud.xls",col_names = T)
names(aux2)[2:18]<-paste0("v_",2001:2017)
names(aux2)

aux3<-gather(aux2,year,valor,v_2001:v_2017)
aux3
separate(aux3,year,c("aux","year"),sep = "_") 

library(lubridate)
ymd("20151021")
ymd("2015/11/30")
myd("11.2012.3")
dmy_hms("2/12/2013 14:05:01")
class(mdy("120112"))
class("120112")


