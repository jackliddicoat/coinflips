library(mosaic)

for (i in 1:10) {
	coins = do(1000) * rflip(10)
	n = seq(1:1000)
	coins$prop = cumsum(coins$prop)
	for (i in 1:1000) {
		coins$prop[i] = coins$prop[i] / i
	}
	plot(coins$prop ~ n, type = "l", ylim = c(.2, .8),
	main = "Proportion of 10 coin flips that are heads, 1000 times")
	Sys.sleep(1)
}