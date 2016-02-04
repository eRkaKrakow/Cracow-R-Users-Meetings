library(CEC)
data <- as.matrix(read.table("input_1.txt"));
cec<-cec(data, 10,nstart=20)
plot(cec,asp=1)
cec.plot.cost.function(cec)
