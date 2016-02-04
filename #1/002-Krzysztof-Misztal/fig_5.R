install.packages(CEC)
library(CEC)
data(Tset)
cec<-cec(Tset, 10, type="spherical" , param=10, card.min ="7%",nstart=100)
plot(cec,xlim=c(0,1),ylim=c(0,1),asp=1)

data(Tset)
cec<-cec(Tset, 10, type="fixedr" , param=0.01, card.min ="7%",nstart=100)
plot(cec,xlim=c(0,1),ylim=c(0,1),asp=1)

data(Tset)
cec<-cec(Tset, 10, type="diagonal" , card.min ="7%",nstart=100)
plot(cec,xlim=c(0,1),ylim=c(0,1),asp=1)

data(Tset)
cec<-cec(Tset, 10, type="covariance", param=matrix(c(0.04,0,0,0.01),2) , card.min ="7%",nstart=100)
plot(cec,xlim=c(0,1),ylim=c(0,1),asp=1)

data(Tset)
cec<-cec(Tset, 10, type="eigenvalues" , param=c(0.01,0.001), card.min ="7%",nstart=100)
plot(cec,xlim=c(0,1),ylim=c(0,1),asp=1)


