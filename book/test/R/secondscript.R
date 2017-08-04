x1 = rnorm(100)
x2 = rnorm(100)
x3 = rnorm(100)

t = data.frame(a=x1, b=(x1+x2), c=(x1+x2+x3))


plot(t$a, type="l", ylim=range(t), lwd=3, col=rgb(1,0,0,0.9))
lines(t$b, type="s", lwd=2, col=rgb(0.3,0.4,0.3,0.9))
points(t$c, pch=20, cex=4, col=rgb(0,0,1,0.3))
      
plot(t)
sd(t$a)

L=list(one=1, two=c(1,2), five=seq(0,1, length=5))

plot(rnorm(100), type="l", col="purple")

hist(rnorm(100))
