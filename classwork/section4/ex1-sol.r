load('ex1-data.rda')

# 1) Create a list of length 5 where each element in the list is a vector of length
# 100. Each vector should contain draws from a normal distributions with means
# given by <mean.vec> and sd=1.
mean.vec <- c(-20, -10, 0, 10, 20)
normal.sims <- lapply(mean.vec, function(mu) rnorm(100, mu, 1))
#normal.sims <- your code here


# 2) Calculate the 90th percentile for each column of <data.matrix>. Do the same
# for each row.
col.90 <- apply(data.matrix, 2, function(col) quantile(col, 0.9))
row.90 <- apply(data.matrix, 1, function(row) quantile(row, 0.9))
#col.90 <- your code here
#row.90 <- your code here


# 3) Find the maximum and minimum values in each column of <data.matrix>. Store
# these as th variable <min.max.col>. This object should be matrix that has 2
# rows and the same number of columns as <data.matrix>. Do the same for each
# column.
min.max.col <- apply(data.matrix, 2, range)
min.max.row <- apply(data.matrix, 1, range)
#min.max.col <- your code here
#min.max.row <- your code here


# 4) Consider the dataset <iris> that comes built into R. Calculate the average
# petal length by species.
avg.petal.lengths <- by(iris$Petal.Length, iris$Species, mean) # best way

# round about way
avg.petal.length <- sapply(levels(iris$Species), function(s)
       mean(iris$Petal.Length[iris$Species==s]))


# 5) Create the variable <new.data.matrix>. This variable should be the same as
# <data.matrix> but have the maximum and minimum observations in each  column
# removed. Note: <new.data.matrix> should be a 98 x 10 matrix.
new.data.matrix <- apply(data.matrix, 2, function(col) col[-c(which.min(col),
                                                           which.max(col))])
#new.data.matrix <- your code here


# 6) Implement the function toFarenheit. Your function should take the following
# arguments:
#
# <temp.celcius>: a vector giving temperatures in degrees celcius
#
# Your function should return the temperature in degrees farenheit for each
# observation in <temp.celcius>. Note that the conversion is given by the
# formula:
#                F = (9/5)C + 32                                       
toFarenheit <- function(temp.celcius) {

    # your code here
    far <- (9/5) * temp.celcius + 32
    return(far)
}


# 7) The list <temp.data> contains temperature readings in degrees celcius taken
# every hourfor each of 31 days. Convert this list to degrees farenheit. Please
# return your result in the form of a list.
temp.data.far <- lapply(temp.data, toFarenheit)


# 8) Implement the function listItemLengths. Your function should take the
# following arguments:
#
# <data>: a list whose elements are vectors of various length
#
# Your function should return the length of each element contained in <data>.
listItemLengths <- function(data) {

    # your code here
    lens <- sapply(data, length)
    return(lens)
}

# 8b) Check your function by calling it on <temp.data>. It should return 24 for
# each observation.
listItemLengths(temp.data)


# 9) Implement the function outlierRange. Your function should take the
# following arguments:
#
# <data>: a matrix or data frame.
# <margin>: a vector giving the indices over which the function will be applied
#   over (i.e 1 = rows, 2 = cols)
#
# Your function should return the range of values that are not considered
# outliers for each element along <margin> (this will be a matrix with 2 rows
# and number of columns determined by the margin). For the purposes of this
# function , we will define an outlier as more than 1.5*IQR from the median.
outlierRange <- function(data, margin) {

    # your code here
    ran <- apply(data, MARGIN=margin, function(m) {
        min.ran <- median(m) - 1.5*IQR(m)
        max.ran <- median(m) + 1.5*IQR(m)
        return(c(min.ran, max.ran))
    })
    return(ran)
}

# 9b) Check your function by calling it on <data.matrix> and setting margin=2.
outlierRange(data.matrix, 2)
