library(CEC)
M = mouseset(n=7000)
plot(M, asp=1, pch = 16)

cec<-cec(M, 10, type="spherical", param=10, card.min ="10%",nstart=10,)
plot(cec, model = T, asp=1, pch = 20)

cec<-cec(M, 10, type="all", card.min ="10%",nstart=100,centers.init="random")
plot(cec, asp=1, pch = 20)

cl<-kmeans(M, centers=3, nstart = 10)
plot(M, col = cl$cluster, asp=1, pch = 16)


cl<-kmeans(M, centers=10, nstart = 10)
plot(M, col = cl$cluster, asp=1, pch = 16)

library(mclust)
mod1 = Mclust(M, G=1:10, modelName='VII')
plot(mod1, asp=1, pch = 16, what = c("classification"))

mod2 = Mclust(M, G=3, modelName='VII')
plot(mod2, asp=1, pch = 16, what = c("classification"))
