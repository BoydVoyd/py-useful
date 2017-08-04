setwd("~/projects/book/test/R/")
d = data.frame(a= c(3,4,5), b=c(12,43,54))
d
write.table(d, file="tst0.txt", row.names=FALSE)
d2 = read.table(file="tst0.txt", header=TRUE)
d2
