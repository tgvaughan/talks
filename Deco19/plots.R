
png("density_alpha1.5.png", height=800,width=600,pointsize=20)
par(mar=c(5,5,1,1))
df <- read.table("density_alpha1.5.log", header=T)
plot(df$alpha, df$density, 'o', col='blue', lwd=2,
     xlab=expression(alpha),ylab="likelihood")
lines(c(1.5,1.5),c(-1000,0), lty=2, lwd=2, col='red')
dev.off()

png("density_alpha2.png", height=800,width=600,pointsize=20)
par(mar=c(5,5,1,1))
df <- read.table("density_alpha2.log", header=T)
plot(df$alpha, df$density, 'o', col='blue', lwd=2,
     xlab=expression(alpha), ylab="likelihood")
lines(c(1.95,1.95),c(-1000,0), lty=2, lwd=2, col='red')
dev.off()

png("density_alpha1.png", height=800,width=600,pointsize=20)
par(mar=c(5,5,1,1))
df <- read.table("density_alpha1.log", header=T)
plot(df$alpha, df$density, 'o', col='blue', lwd=2,
     xlab=expression(alpha), ylab="likelihood")
lines(c(1,1),c(-1000,0), lty=2, lwd=2, col='red')
dev.off()
