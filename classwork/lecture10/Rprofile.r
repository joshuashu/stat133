## The functions below all perform the same function, with different methods.
## They take as input a data frame x and remove any rows with NA values.

## We use Rprof() to profile the functions and check how fast each function
## performs the task.  Since each run is very fast we time 10 runs each time
## using the replicate() function.


funAgg = function(x) {
# initialize res 
 res = NULL
 n = nrow(x)

 for (i in 1:n) {
    if (!any(is.na(x[i,]))) res = rbind(res, x[i,])
 }
 res
}


funLoop = function(x) {
# Initialize res with x
 res = x
 n = nrow(x)
 k = 1

 for (i in 1:n) {
    if (!any(is.na(x[i,]))) {
       res[k, ] = x[i,]
       k = k + 1
    }
 }
 res[1:(k-1), ]
}

funApply = function(x) {
 drop = apply(is.na(x), 1, any)
 x[!drop, ]
}


funOmit = function(x) {
# The or operation is very fast, it is replacing 
  # the any function
# Also note that it doesn't require having another 
  #data frame as big as x

 drop = FALSE
 n = ncol(x)
 for (i in 1:n)
   drop = drop | is.na(x[, i])
 x[!drop, ]
}

xx = matrix(rnorm(20000), 1000, 20)
xx[xx>2] = NA
xx = as.data.frame(xx)


Rprof("exampleAgg.out")
y = replicate(10, funAgg(xx))
Rprof(NULL)


Rprof("exampleLoop.out")
y = replicate(10, funLoop(xx))
Rprof(NULL)


Rprof("exampleApply.out")
y = replicate(10, funApply(xx))
Rprof(NULL)


Rprof("exampleOmit.out")
y = replicate(10, funOmit(xx))
Rprof(NULL)

summaryRprof("exampleAgg.out")
summaryRprof("exampleLoop.out")
summaryRprof("exampleApply.out")
summaryRprof("exampleOmit.out")
