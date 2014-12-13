library(RUnit)
errMsg <- function(err) print(err)

# Implement the num.factors function
# 
# Takes the following arguments:
#   d: a dataframe
#
# Returns the number of factor vectors in the dataframe.

num.factors = function(d) {
    return(sum(sapply(d, is.factor)))
}


first = data.frame(x=rnorm(10), y=as.factor(1:10))
tryCatch(checkEquals(1, num.factors(first)),
         error=function(err) errMsg(err))

second = data.frame(x=as.factor(1:2), y=as.factor(c(T,F)))
tryCatch(checkEquals(2, num.factors(second)),
         error=function(err) errMsg(err))

# Implement the num.factors2 function
# 
# Takes the following arguments:
#   l: a list of dataframes
#
# Returns the total number of factor vectors in all of the dataframes in the
# list.

num.factors2 = function(l) {
    return(sum(sapply(l, num.factors)))
}


list1 = list(first, second)
tryCatch(checkEquals(3, num.factors2(list1)),
         error=function(err) errMsg(err))

third = data.frame(z=as.factor(c("f1", "f2")))
list2 =  list(first, second, third)
tryCatch(checkEquals(4, num.factors2(list2)),
         error=function(err) errMsg(err))


# Implement the sum.or.product function
# 
# Takes the following arguments:
#   x: a numeric vector
#   y: a numeric vector
#
# Returns a numerical vector whose entries are given by
#
# x+y if every element of x is greater than the corresponding element of y,
# x*y otherwise

sum.or.product = function(x, y=10) {
    if (all(x>y)) return(x+y)
    return(x*y)
}


x=1:10
y=x
tryCatch(checkEquals(x*y, sum.or.product(x,y)),
         error=function(err) errMsg(err))

x=2*y
tryCatch(checkEquals(x+y, sum.or.product(x,y)),
         error=function(err) errMsg(err))


# Implement the odd function
# 
# Takes the following arguments:
#   x: a numeric vector
#   flip: TRUE/FALSE 
#
# Returns a logical vector where
#  if flip is FALSE, then each element is
#     TRUE when the number is odd
#     FALSE when the number is even
#  if flip is TRUE, then each element is
#     TRUE when the number is even
#     FALSE when the number is odd

odd = function(x, flip=FALSE) {
    if (flip) x = x+1
    return(as.logical(x %% 2))
}


xs = c(rep(1,5),rep(2,5))
os = c(rep(TRUE,5),rep(FALSE,5))
tryCatch(checkEquals(os, odd(xs)),
         error=function(err) errMsg(err))

tryCatch(checkEquals(!os, odd(xs, flip=TRUE)),
         error=function(err) errMsg(err))


# Implement the sum.adm function
#
# Takes the following arguments:
#   x: a numeric vector
#   na.rm: TRUE/FALSE 
#
# Returns the sum of the absolute deviations from the median for the input
# vector x.  If na.rm is TRUE, the function removes all the NAs from the
# computation of the return value.

sum.adm = function(x, na.rm=FALSE){
    if (na.rm) x = x[!is.na(x)]
    return(sum(abs(x-median(x))))
}


x = 1:3
tryCatch(checkEquals(2, sum.adm(x)),
         error=function(err) errMsg(err))

x = c(x,NA)
tryCatch(checkTrue(is.na(sum.adm(x))),
         error=function(err) errMsg(err))

tryCatch(checkEquals(2, sum.adm(x, na.rm=TRUE)),
         error=function(err) errMsg(err))

