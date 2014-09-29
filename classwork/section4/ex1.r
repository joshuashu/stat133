load('ex1-data.rda')

# 1) Create a list of length 5 where each element in the list is a vector of length
# 100. Each vector should contain draws from a normal distributions with means
# given by <mean.vec> and sd=1.

#normal.sims <- your code here


# 2) Calculate the 90th percentile for each column of <data.matrix>. Do the same
# for each row.

#col.90 <- your code here
#row.90 <- your code here


# 3) Find the maximum and minimum values in each column of <data.matrix>. Store
# these as th variable <min.max.col>. This object should be matrix that has 2
# rows and the same number of columns as <data.matrix>. Do the same for each
# column.

#min.max.col <- your code here
#min.max.row <- your code here


# 4) Consider the dataset <iris> that comes built into R. Calculate the average
# petal length by species.

# avg.petal.lengths

# 5) Create the variable <new.data.matrix>. This variable should be the same as
# <data.matrix> but have the maximum and minimum observations in each  column
# removed. Note: <new.data.matrix> should be a 98 x 10 matrix.

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

}


# 7) The list <temp.data> contains temperature readings in degrees celcius taken
# every hourfor each of 31 days. Convert this list to degrees farenheit. Please
# return your result in the form of a list and in the form of a matrix.

# temp.far.list <- your code here
# temp.far.matrix <- your code here

# 8) Implement the function listItemLengths. Your function should take the
# following arguments:
#
# <data>: a list whose elements are vectors of various length
#
# Your function should return the length of each element contained in <data>.
listItemLengths <- function(data) {

    # your code here

}

# 8b) Check your function by calling it on <temp.data>. It should return 24 for
# each observation.


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

}

# 9b) Check your function by calling it on <data.matrix> and setting margin=2.

