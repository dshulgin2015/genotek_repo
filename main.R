#adding required libraries

library(bigmemory)
library(biganalytics)
library(bigpca)
library(gbm)
library(randomForest)

#reading train and test data from the source
train <- read.big.matrix(file.path("Learning_sample.txt"), type="integer", sep = " ")
test <- read.big.matrix(file.path("Test_sample.txt"), type="integer", sep = " ")

#transpose big matrices
train <- big.t(train,verbose=TRUE)
test <- big.t(test,verbose=TRUE)

#using clustering to understang, what classes is provided by the source data
cl <- bigkmeans(train, centers = 2, iter.max = 10, nstart = 1, dist = "euclid")

#getting clases vector
classes <- cl$cluster

#using train matrix and classes vector to train random forest 
rs <- randomForest(x = train[,],y = classes)

#visualizing random forest variables by importance
varImpPlot(rs)

#getting desicion forest structure
getTree(rs)


#getting predictions on a test sample
predictions <- predict(rs, test[,])

#I got big bias in test prediction results, that's might be because of i didn't specify random forest to serve this 
# data only as cathegorial. 


 