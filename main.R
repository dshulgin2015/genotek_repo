setwd("/home/user/genotek/")
library(bigmemory)
library(biganalytics)
library(bigpca)
w <- read.big.matrix(file.path("Learning_sample.txt"), type="integer", sep = " ")
w <- big.t(w,verbose=TRUE)

cl <- bigkmeans(w, centers = 2, iter.max = 10, nstart = 1, dist = "cosine")

#library(FactoMineR)
#cah.test <- HCPC(x, graph=FALSE, nb.clust=-1)

 