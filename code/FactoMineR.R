rm(list = ls())
install.packages("explor")
install.packages("FactoMineR")
library(FactoMineR)
library(explor)

data("decathlon")
pca<-PCA(decathlon[,1:12])

explor(pca)
data(hobbies)
mca<-MCA(hobbies[1:1000,c(1:8)])
explor(mca)


decathlon[,1:12]

pca$eig

eigen(cor(decathlon[,1:12]))$values