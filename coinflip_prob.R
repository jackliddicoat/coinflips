library(mosaic)

# proportion of flips that are heads at each flip for 200 flips
coins <- do(200) * rflip(1)
head(coins)
for (i in 1:200) {
  coins$proportion[i] = with(coins, sum(heads[1:i])) / with(coins, sum(n[1:i]))
}
n1 = seq(1, 200, 1)
plot(proportion ~ n1, data = coins,
     type = "l", 
     ylab = "P(heads)", ylim = c(0,1),
     xlab = "N flips",
     col = "blue3", lwd = 3,
     main = "Proportion of Flips that are Heads by Roll")


# proportion of flips that are heads at each flip for 200 flips, 1000 times
coin_sim = function(n, k) {
  coins = do(n) * rflip(k)
  for (i in 1:n) {
    coins$proportion[i] = with(coins, sum(heads[1:i])) / with(coins, sum(n[1:i]))
  }
  coins$proportion
}

rep = replicate(n = 1000, expr = coin_sim(200, 1))
mean = apply(rep, 1, mean)
quant = apply(rep, 1, function(x) quantile(x, c(0.1, 0.9)))

plot(mean, type="l", ylim = c(0, 1),
     ylab = "P(heads)", xlab = "N flips",
     col = "blue3", lwd = 3,
     main = "Outcomes by Quantile for 200 Flips")
lines(quant[1,], col = "blue3", lty = 2)
lines(quant[2,], col = "blue3", lty = 2)
legend("topright", lty = c(2,1,2), col = "blue3",
       legend = c("90th", "Mean", "10th"), lwd = c(1,3,1))
       
       


