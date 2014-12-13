library(RUnit)
errMsg <- function(err) print(err)

# Load some data
load("ex3.rda")

# You first task is to implement some helper functions, which you will later use
# for "cleaning" df (i.e., you will remove rows of df using these functions).

# Implement the too.many.na function
# 
# Takes the following arguments:
#   df: a numeric dataframe
#   threshold: a number between 0 and 1
#   axis: 1 or 2 (i.e., rows or columns)
#
# Returns an unnamed numeric vector containing the indices of the rows (if
# 'axis' is 1) or columns (if 'axis' is 2) whose proportion of NA values is
# strictly greater than the 'threshold'.

too.many.na = function(df, threshold, axis) {
    # your code here

}


testdf1 = data.frame(1:4, c(NA,1,2,3))
tryCatch(checkEquals(1, too.many.na(testdf1, 0, 1)),
         error=function(err) errMsg(err))

tryCatch(checkEquals(2, too.many.na(testdf1, 0, 2)),
         error=function(err) errMsg(err))

tryCatch(checkEquals(0, length(too.many.na(testdf1, 0.6, 1))),
         error=function(err) errMsg(err))

# Implement the outlier.cutoff function
# 
# Takes the following arguments:
#   x: a numeric vector
#   rm.na: TRUE or FALSE, if true, any ‘NA’ and ‘NaN’'s are removed
#          from ‘x’ before the quantiles are computed.
#
# Returns a numeric vector containing two elements. The first element is the
# lower cutoff. The second element is the upper cutoff.  The lower and upper
# cutoffs are defined as follows:
#    lower cutoff = Q1 - 2.5*IQR
#    upper cutoff = Q3 + 2.5*IQR
# where
#    Q1 is the first quartile or the 25th percentile
#    Q3 is the third quartile or the 75th percentile
#    IQR is the difference Q3 - Q1

outlier.cutoff = function(x, rm.na){
    # your code here

}


set.seed(42)
x = c(100, rnorm(100))
cuts = c(-3.829464, 3.899827)

tryCatch(checkEquals(cuts, unname(outlier.cutoff(x, FALSE)), tolerance=1e-6),
         error=function(err) errMsg(err))

x = c(x, NA)
tryCatch(checkException(outlier.cutoff(x, FALSE), silent=TRUE),
         error=function(err) pass)

tryCatch(checkEquals(cuts, unname(outlier.cutoff(x, TRUE)), tolerance=1e-6),
         error=function(err) errMsg(err))



# Implement the remove.outliers function
#
# Takes the following arguments:
#   df: a numeric dataframe
#   cuts: a matrix giving the outlier cutoffs for each column of <df>. The
#     dimensions of this variable should be 2 x num cols of df.
#
# Returns a subset of df with all the rows containing elements outside
# the cutoffs in <cuts> removed (i.e., remove rows with elements which
# are strictly greater than any  upper bound or strictly less than
# any lower bound)

remove.outliers = function(df, cuts) {

}  

# Create a vector na.indices. This is a vector containing the rows of df with
# any NAs.

# na.indices = your code here


# Create a dataframe df.no.nas. This should be a subset of df with all rows
# containing any NAs removed.

# df.no.nas = your code here


# Create a matrix cuts. Each column of cuts should be the result of calling
# outlier.cutoff on the corresponding column of df.no.nas. You can set rm.na to
# TRUE or FALSE since df.no.nas shouldn't have any NAs.

# cuts = your code here


# Create a dataframe df.clean. This is a subset of df with all rows containing
# any NAs removed as well as any rows with elements outside the cutoffs
# specified by cuts removed.

# df.clean = your code here




