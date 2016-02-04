require('cec')
attach(faithful)
cec<-cec(matrix(waiting),2)
print(cec)
cec$probability
#cec.plot.energy(cec)
hist(faithful$waiting, prob=TRUE,main = "Histogram of Time between Old Faithful eruptions", xlab = "Minutes",ylim = c(0,0.05)); 
for(i in c(1:2)){
  curve( cec$probability[i] * dnorm(x,mean=cec$centers[i],sd=sqrt(cec$covariances[[i]][1])), add=T,col=i+1)  
}
