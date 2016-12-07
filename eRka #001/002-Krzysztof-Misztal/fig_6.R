library(CEC)
data <- as.matrix(read.table("input_2.txt"));
cec<-cec(data,7, type=c("fixedr","fixedr","eigen","eigen","eigenvalues","eigenvalues","eigenvalues"), param=list(350,350,c(9000.24,8.33),c(9000.24,8.33),c(9000.24,8.33),c(9000,8.33),c(9000.24,8.33)),nstart = 100)
plot(cec,asp=1)
