rm(list=ls())
bd<-as.data.frame(USArrests)
bd
#obtener la descomposicion espectral
de<-eigen(cor(bd))
L<-de$vectors
delta<-diag(de$values)
delta
L

L%*%delta%*%t(L)
cov(bd)
cor(bd)
L[,1:2]%*%delta[1:2,1:2]%*%t(L[,1:2])
L[,1:3]%*%delta[1:3,1:3]%*%t(L[,1:3])

prop.table(de$values)
cumsum(prop.table(de$values))
L%*%t(L)
#Componentes como un indicador
#indicador de crimen
crcov<-eigen(cov(bd[,c(1,2,4)]))
crcor<-eigen(cor(bd[,c(1,2,4)]))

prop.table(crcov$values)
prop.table(crcor$values)

crcov$vectors[,1]
bd$icr<-as.matrix(bd[,c(1,2,4)])%*%crcor$vectors[,1]
head(bd)

View(bd[order(bd$icr),])
plot(bd$Rape,bd$icr)


