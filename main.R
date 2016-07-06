setwd("/home/user/genotek_repo/")
library(bigmemory)
library(biganalytics)
library(bigpca)
library(gbm)
library(randomForest)
train <- read.big.matrix(file.path("Learning_sample.txt"), type="integer", sep = " ")
test <- read.big.matrix(file.path("Test_sample.txt"), type="integer", sep = " ")

train <- big.t(train,verbose=TRUE)
test <- big.t(test,verbose=TRUE)


cl <- bigkmeans(train, centers = 2, iter.max = 10, nstart = 1, dist = "euclid")

classes <- cl$cluster

#colnames(train) <- paste("V",1:260121,sep = "")

rs <- randomForest(x = train[,],y = classes)


#library(FactoMineR)
#cah.test <- HCPC(x, graph=FALSE, nb.clust=-1)

 