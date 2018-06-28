dfs <- read.table("~/code/beast_and_friends/pitchfork/validation/DirectSimulation/simulate_10taxon_alpha1_serial.log", header=T)
df <- read.table("~/code/beast_and_friends/pitchfork/validation/OperatorTests/SubtreeSlide_10taxon_alpha1_serial.log", header=T)

# Remove 10% for burnin
N <- dim(df)[1]
df <- df[-(1:ceiling(0.1*N)),]

# Tree age/length plot

maxLength <- max(quantile(df$tree.treeLength, probs=0.99),
                 quantile(dfs$tree.treeLength, probs=0.99),
                 quantile(df$tree.height, probs=0.99),
                 quantile(dfs$tree.height, probs=0.99))

maxDensity <- max(density(dfs$tree.height)$y,
                  density(df$tree.height)$y,
                  density(dfs$tree.treeLength)$y,
                  density(df$tree.treeLength)$y)

png("prior_sampling_heights.png", width=800, height=800, pointsize=30)
plot(density(df$tree.height), 'l', col='red', lwd=8, lty=2,
     xlim=c(0,maxLength), ylim=c(0,maxDensity),
     xlab="Statistic", ylab="Density",
     main="")
lines(density(dfs$tree.height), col='blue', lwd=8, lty=2)
lines(density(df$tree.treeLength), col='red', lwd=8)
lines(density(dfs$tree.treeLength), col='blue', lwd=8)
legend("topright", inset=0.05, cex=0.8,
       c("MCMC", "Direct simulation","Tree length", "Tree height"),
       lty=c(1,1,1,2), lwd=4, col=c("red","blue","black","black"))
dev.off()

# Polytomy count plot

maxCount <- max(df$PolytomyCount, dfs$PolytomyCount)+1
h <- hist(df$PolytomyCount, plot=F,
          breaks=seq(-0.5,maxCount+0.5,by=1))
hs <- hist(dfs$PolytomyCount, plot=F,
           breaks=seq(-0.5,maxCount+0.5,by=1))

png("prior_sampling_polytomies.png", width=800, height=800, pointsize=30)
plot(h$mids, h$density, 'o', col='red', lwd=8,
     xlab="Polytomy Count",
     ylab="Posterior probability")
lines(hs$mids, hs$density, 'o', col='blue', lwd=8)

legend("topright", inset=0.04, cex=0.8,
       c("MCMC", "Direct simulation"), lty=1, pch=1, lwd=4,
       col=c("red","blue"))
dev.off()
