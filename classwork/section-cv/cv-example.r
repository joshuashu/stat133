# Implement the function makeFolds. Your function should take the following
# arguments
#   <obs.data>: a matrix or data frame of data where rows correspond to observations
#   <n.folds>: the total number of folds to break the data into
# your function should return
#   <fold.data>: the matrix or data frame given by <obs.data> with an added
#     column of numeric values giving the fold for each observation. The values in
#     this vector should be between 1 and <n.folds>. The number of observations in
#     each fold should be equal except possibly the last fold which may contain
#     fewer observations if n.obs is not a multiple of n.folds. For example:
#     with 2-folds and 5 observations, the folds should be sampled without
#     replacement from  c(1, 1, 1, 2, 2)                                        
makeFolds <- function(obs.data, n.folds) {

    # your code here

    set.seed(47)
    fold.data <- cbind(obs.data, fold=sample(fold, n.obs))
    return(fold.data)
}


load('cv-example.rda')
# Consider the data frame <ex.data> of 100 observations, each with 5 predictors
# (Xi for i=1,...,5)
# and 1 response. Suppose that we want to determine the best predictors to
# include in our model. Implement the function cv that takes the following
# arguments
#   <obs.data>: a matrix or data frame of data where rows correspond to
#   observations
#   <n.folds>: the total number of folds to break the data into
#   <predictors>: numeric indicating the predictors to include in the model
#   (eg. 1 for X1)
#
# your function should return
#   <avg.error> the mean squared error for predictions on the left out sample,
#   averaged over each fold.
cv <- function(obs.data, n.folds, predictors) {

    fold.data <- makeFolds(obs.data, n.folds)
    pred.string <- paste(sprintf('X%d', predictors), collapse='+')
    form.string <- paste('Y', pred.string, sep='~')
    form <- as.formula(form.string)

    # given the formula specified by <form>, run a <n.folds>-fold cross
    # validation to estimate the prediction error when the variables specified
    # by <predictors> are used to fit a linear model

    return(mses)
}
    
cv.errors <- sapply(1:5, function(p) cv(ex.data, 10, 1:p))    
