library(RUnit)
errMsg = function(err) print(paste("ERROR:", err))
load('hw4-tests.rda')

# Implement the function "truncate", a function that trims a given vector by
# removing the upper and lower specified quantiles. Your function should take
# the following arguments:
#
# <input.vector>: the numeric vector to be truncated
# <trim>: a numeric value between 0 and 0.5 that specifies the upper and lower
# quantiles of <input.vector> that should be removed.
#
# Your function should return the following value:
#
# <truncated.vector>: the remaining values of input.vector after removing the
# upper and lower quantiles

truncate <- function(input.vector, trim) {

        stopifnot(0<=trim & trim<=0.5)

            # your code here
            quant.cutoff <- quantile(input.vector, c(trim, 1-trim))
            truncated.vector <- input.vector[input.vector>=min(quant.cutoff) &                                            
                                             input.vector<=max(quant.cutoff)]
            return(truncated.vector)
    }

tryCatch(checkEquals(4:7, truncate(1:10, trim=0.25)), error=function(err)
                  errMsg(err))

tryCatch(checkIdentical(integer(0), truncate(1:10, trim=0.5)),
                  error=function(err) errMsg(err))


# Suppose that you are given some dataset where all variables are
# numeric. Further, assume that you consider a given variable for some
# observation to be an outlier if it is more than 1.5 IQRs from that variable's
# median value. Implement the function "outlierCutoff" that determines the
# min and max value that is not considered an outlier for each variable. your
# function should take the following arguments:
#
# <data>: a data frame consisting of only numeric variables
#
# Your function should return the following:
#
# <outlier.cutoffs>: a 2xnumber.variables matrix giving the lower and upper
# bound for non-outlier values. The first row should be the lower bound and the
# second the upper bound

outlierCutoff <- function(data) {
        # your code here

    outlier.cutoffs <- sapply(data, function(var) {
        var.iqr <- IQR(var)
        cutoff.min <- median(var) - 1.5 * var.iqr
        cutoff.max <- median(var) + 1.5 * var.iqr
        return(c(cutoff.min, cutoff.max))
    })

    return(outlier.cutoffs)
}

tryCatch(checkIdentical(outlier.cutoff.t, outlierCutoff(ex1.test)),
                  error=function(err) errMsg(err))


# Again, suppose that you are given some dataset where all variables are numeric
# Further, assume that you are interested in removing outliers as defined in the
# previous part
# Implement a function "removeOutliers" that
# 1) caclulates the number of variables for each observation in the dataset that
# are considered outliers
# 2) removes any observation with more than some specified fraction of its
# variables as outliers. Your function should take the following arguments:
#
# <data>: a data frame where each variable is numeric
# <max.outlier.rate>: a numeric between 0 and 1 specifying the maximum allowable
# fraction of outliers (#outlier.variables / #variables)
#
# Your function should return the follwing:
#

# <subset.data>: a data frame with numeric variables where observations with
# unacceptably high rates of outliers (i.e. greater than <max.outliers>) have
# been removed.

removeOutliers <- function(data, max.outlier.rate) {

        stopifnot(max.outlier.rate>=0 & max.outlier.rate<=1)

        # your code here
        
        outlier.cutoffs <- outlierCutoff(data)
        high.outliers <- apply(data, 1, function(row) row > outlier.cutoffs[2,])
        low.outliers <- apply(data, 1, function(row) row < outlier.cutoffs[1,])
        outliers <- t(high.outliers + low.outliers)
        num.outliers <- rowSums(outliers)
        removed.idcs <- num.outliers/ncol(data) > max.outlier.rate
        return(data[!removed.idcs, ])
}


tryCatch(checkIdentical(remove.outlier.t, removeOutliers(ex1.test, 0.25)),
                  error=function(err) errMsg(err))



# Implement the function "simpleNormSim". This function should generate several
# simulations of samples from a specified normal distribution. The number of
# variables sampled should be constant across simulations. The variables in
# each simulation should have equal variance but may have different means. Your
# function should take the following arguments:
#
# <sim.size>: a numeric constant indicating the number of samples in each
#   simulations.
# <means>: a numeric vector indicating the mean for each each simulation.
# <var>: a numeric constant indicating the variance of the random
#   variables in each simulation.
#
# Your function should return:
#
# <simulation>: a **list** that has the same length as <means>. The jth entry of
#   this list should be a sample of <sim.size> random normal variables with
#   variance given by <var> and mean given by the jth entry of <means>.

simpleNormSim <- function(means, sim.size=50, var=1) {

        # your code here
        simulation <- lapply(means, rnorm, n=sim.size, sd=sqrt(var))
        return(simulation)
}

set.seed(47)
tryCatch(checkIdentical(simple.norm.sim.t, simpleNormSim(c(25, 50, 75))),
                  error=function(err) errMsg(err))


# Suppose you are given a data frame where all but one of the variables are
# numeric. The final variable (though not necessarily final in position) is a
# factor associated with different levels of your observations. Implement the
# function "meanByLevel" that returns the mean value for each of the numeric
# variables by the levels given from the factor variable. Your function should
# take the following arguments:
#
# <data>: a data frame where all but one of the variables are numeric. The final
#   variable is a factor giving the different levels of the observations. **The
#   factor variable is not necessarily the final variable in position.**
#
# Your function should return:
#
# <level.means>: the means of each of the variables broken down by each of the
#   levels (this should be a num.factors x num.numeric.variables matrix).

meanByLevel <- function(data) {

        # your code here
        factor.variable <- sapply(data, function(var) class(var)=='factor')
        level.means <- sapply(data[, !factor.variable], function(var)
                              by(var, data[,factor.variable], mean))
        return(level.means)
}

tryCatch(checkIdentical(mean.by.level.t, meanByLevel(iris)), error=function(err)
                  errMsg(err))


# Suppose you are given a data frame with the same structure as in the previous
# part of the question. You are interested in identifying the difference between
# the overall average for a given variable and the factor level average for that
# variable. You want this difference to be standardized by the overall standard
# deviation for that variable. Implement the function "stdLevelDiff" that does
# this for each of the numeric variables in your data frame. Your function
# should take the following arguments:
#
# <data>: a data frame where all but one of the variables are numeric. The final
#   variable is a factor giving the different levels of the observations. **The
#   factor variable is not necessarily the final variable in position**
#
# Your function should return:
#
# <level.diff> the difference between mean by factor level and overal
#   mean for each variable divided by the overall standard deviation for each
#   variable. This should be a num.factors x num.numeric.variables matrix.
#   NOTE: you may need to use R's transpose function to make sure that the
#   dimensions of your return value are correct.

stdLevelDiff <- function(data) {

        # your code here
        factor.variable <- sapply(data, function(var) class(var)=='factor')
        level.means <- meanByLevel(data)
        overall.means <- sapply(data[, !factor.variable], mean)
        overall.sd <- sapply(data[, !factor.variable], sd)
        level.diff <- apply(level.means, 1, function(level)
                            (level - overall.means) / overall.sd)
        return(t(level.diff))
}

tryCatch(checkIdentical(std.level.diff.t, abs(stdLevelDiff(iris))),
                  error=function(err) errMsg(err))
