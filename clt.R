library(dplyr)
library(ggplot2)

# Random "exponential" with rate 0.2 (mean 1/0.2 = 5)
rexp(1 , rate = 0.2)

# "sample of size n#
n <- 100
rexp(n, rate = 0.2)

# Simulate repeated sampling of size n. Let's use k "replications". The number
# of replications doesn't effect the underlying process - only the accuracy with
# which we can evaluate the results.

n <- 10
k <- 1000
r_exp_data <- replicate(k, rexp(n, rate = 0.2))

# apply function sweeps across columns getting mean of each column
sample_means <- data.frame(x_bar = apply(r_exp_data, 2, mean))

# histogram
# sample_means %>% 
#   ggplot(aes(x = x_bar)) + geom_histogram()

# normal quantile plot
sample_means %>% 
  ggplot(aes(samples = x_bar)) + stat_qq()
