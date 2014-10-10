# create a coin with a Head and Tail
coin = c("T", "H")

# Flip the coin once
sample(coin, 1, replace = TRUE)


# Flip the coin 4 times
n = 4
tosses = sample(coin, n, replace = TRUE)
tosses


# How many Heads did we get?
sum(tosses == "H")

# What proportion of Heads did we get?
sum(tosses == "H")/length(tosses)


# It might be easier to track using 0 for tails and 1 for heads
coin = 0:1
tosses = sample(coin, n, replace = TRUE)
tosses


sum(tosses)/n


# What about estimating the distribution of the proportion or
# number of heads in 4 tosses?
# We could conduct an experiment where we run our 4-toss process
# many many times and see empirically what proportion of the times
# did we get 0, 1, 2, 3, or 4 heads

# We calculated the probability of each outcome already
probFraqH <- c(1,4,6,4,1)/16
names(probFraqH) <- as.character(0:4)

# Three ways to do this:
# Try it with an sapply()
samplesA = sapply(1:1000, function(iter) {
                              tosses = sample(coin, n, replace = TRUE)
                              sum(tosses)/n
                          }
)

length(samplesA)

head(samplesA)

table(samplesA)

table(samplesA)/1000

#compare
probFraqH

# Notice that there was no reference to iter in the above code
# so we could use  the replicate function instead of sapply
samplesB = replicate(n = 1000,   sum(sample(coin, 4, replace = TRUE))/4  )

table(samplesB)/1000

# compare
probFraqH

# Lastly, a for loop
samplesC = numeric()
for (i in 1:1000){
  samplesC[i] = sum(sample(coin, 4, replace = TRUE))/4
}

table(samplesC)/1000

# compare
probFraqH

# Notice that each time we get slightly different answers.
# That's because we are working with a "random" process and
# each time we get slightly different answers.

# We can also use the computer to study the behavior of
# a chance process as the sample size increases.

# For example, how does the proportion of heads behave as
# the number of flips increases?

n = 2000
tosses = sample(coin, n, replace = TRUE)

# This creates the proportion of heads observed
# as a function of the number of tosses
cumProp = cumsum(tosses)/(1:n)

plot(x = 1:n, y = cumProp, type = "l", ylim = c(0.3, 0.7))
abline(h = 0.5, col = "grey")
points(x = 1:n, y = cumProp, type = "l")

coinToss = function(n, coin = 0:1,  addPoints = TRUE) {
  tosses = sample(coin, n, replace = TRUE)
  cumProp = cumsum(tosses)/(1:n)
  colT = rgb(190, 190, 190, 64, maxColorValue = 255)
  if (addPoints) {
    points(x = 1:n, y = cumProp, type = "l",
           col = colT)
  } else {
    plot(x = 1:n, y = cumProp, type = "l", 
     ylim = c(0.3, 0.7))
    abline(h = 0.5, col = "darkgrey")
  }
  return(cumProp[n])
}


n = 2000
coinToss(n = 2000, addPoints = FALSE)
x = replicate(100, coinToss(n = 2000, addPoints = TRUE))

simFlips = function(reps = 400, m = 100) {
  firstFinal = coinToss(m, addPoints = FALSE)
  finalVals = unlist(sapply(2:reps, function(x) 
    coinToss(m) ))
  return(c(firstFinal, finalVals))
}

simFlips2 = function(reps = 400, m = 100) {
  finalVals = numeric(length = reps)
  finalVals[1] = coinToss(m, addPoints = FALSE)
  for (i in 2:reps) {
    finalVals[i] = coinToss(m)
  }
  return(finalVals)
}

