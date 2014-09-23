#######################################
#####            Apply            #####
#######################################

## Use the apply() family of functions to apply an operation
## to each element of a list, or to each vector in a data frame
## or to individual dimensions of a matrix
## We use these functions to avoid looping

# Functions:
# -- apply() for matrices
# -- sapply() and lapply() for lists and dataframes
# -- tapply() for "tables"

# lapply() and sapply() both apply a specified function to
# each element of a list.  lapply() returns a list,
# sapply() returns a vector when possible.

## Load the rain data from the lecture Thu sep 18

load("rainfallCO.rda")
class(rain)
length(rain)
names(rain)

class(day)
length(day)
names(day)

# The function mean() returns the mean of a vector
# Here we pass the function mean() as an argument to the apply function.

# Try both lapply() and sapply() - look at how the output differs.
# NB!  sapply() is a user friendly version of lapply() - you will 
#      typically be able to use sapply() but should know of both functions.
lapply(rain, mean)
sapply(rain, mean)

# If you need to pass arguments to the function mean() you include them in the call to lapply():
lapply(rain, mean, na.rm = TRUE, trim = 0.1)

# Study how to use the apply functions.
help(lapply)
args(lapply)

# tapply() is useful to apply a function to a subset of a vector

x <- 1:10
v <- sample(0:1, size=10, replace=TRUE)

# Look at x and v side-by-side (note the use of cbind())
cbind(x, v)

# Lets use tapply()
tapply(x, v, mean)
tapply(x, v, median)


# Some examples, study the output
sapply(rain, max)
sapply(rain, quantile, probs = 0.99)

# Check that the number of recordings at each station matches the number of days recorded at the corresponding station
# what does all() do?
all(  sapply(rain, length)  ==   sapply(day, length)  )

Year = lapply(day, floor) 
Uyear = lapply(Year, unique)
OpYear = sapply(Uyear, length)

# For any one station:
length(unique(floor(day[[1]])))
# Study the command above, what does it do?
# break it down into pieces 
# look at the values in day[[1]]
# what do you get in floor(day[[1]]) ?
# why take unique of that?  what do you have now?
# when you take length of this, what are you counting?

# Want to do this for every weather station, how can we use sapply()?
#sapply(day, length(unique(floor( ? ))) )

# We need to define a function that does our length(unique(floor(...))) calculation, and pass it to sapply()
sapply(day, function(x) length(unique(floor(x))))

# Another example with a function.
# Proportion of days it rained at each station
sapply(rain, function(x) sum(x > 0)/length(x) )

# apply() is used for matrices, the second argument (1 here) specifies whether to apply accross columns or rows.
# apply(x, margin, fun, ...)  : margin=1 : rows, margin=2 : columns.

x <- matrix(1:6, ncol=3)

# look at x
x

# try to predict what this will do before you run the command
apply(x, 1, sum)

# try a few more examples
apply(x, 2, min)



