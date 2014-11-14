#### Midterm in Statistics 133 Lecture 1 Fall 2014
#### Tuesday October 21st 2014
#### Good Luck!

#### Note:  Please use the EXACT variable names provided in the instructions.
####        The variable name is provided within double square brackets, e.g. [[ x ]]
####        The square brackets are simply there as a visual aide, so that you can quickly find it.
  
#### Note:  Remember to save your work during the test
####        Keep a terminal window open and do a [git add .] early
####        Then do [git commit -m "message"] and [git push] at the end, and preferably once or twice during the exam.

########################################### FIRST PART
#### We will start with a few small tasks.

## In one R command, create a variable [[ x ]] which is a vector and has
## all the even numbers between 2 and 20, in increasing order.
x <- seq(2, 20, by=2)


## In one R command, create a variable [[ y ]] which is a vector and has
## all the odd numbers between -1 and -19, in decreasing order
y <- seq(-1, -19, by=-2)


## In one R command, create a variable [[ z ]] which is a vector and has
## the numbers 1 through 5, each repeated 4 times, in order (so 1 1 1 1 2 2 2 2 etc.)
z <- rep(1:5, each=4)


## In one R command, create a variable [[ m ]] that is a 3-by-4 matrix and has
## the entries 10, 20, through 120, where the numbers are entered row by row
## (so the first row is [ 10 20 30 40 ]).
m <- matrix(seq(10, 120, by=10), nrow=3, byrow=T)


## Create a variable [[ n ]] that is a data frame of dimension 10 x 3
## where the first column is the numbers 1-10, the second column the letters a-j and the
## third column has T/F, T if the number in column 1 is even, F if the number in column 1 is odd.
## Then add the column names :  num, lett, even
n <- data.frame(num=1:10, lett=letters[1:10], even=1:10%%2==0)

## Create a variable [[ p ]] that is a list and whose elements are x, y, z and m from above.
p <- list(x, y, z, m)

## Create a variable [[ nmat ]] that is a matrix of size 100 x 100 and whose
## elements are drawn from a Normal distribution with mean 6 and sd 2
## Do not remove the set.seed command
set.seed(42)
nmat <- matrix(rnorm(100^2, 6, 2), nrow=100)

########################################### SECOND PART

## Load in the rainfall data, the file is in the same directory as this test.
## You should get two objects, rain and day.
load("rainfallCO.rda")

## Extract the type of the variable rain and store in [[ type.rain ]]
type.rain <- class(rain)


## Extract the names of the elements in rain and store in  [[ name.stations ]]
name.stations <- names(rain)


## In one R command create the variable [[ n.obs ]] , a vector which stores the number
## of observations at EACH of the stations in rain
n.obs <- sapply(rain, length)


## In one R command create the variable [[ max.rain ]] which stores the maximum
## rainfall for each weather station.
max.rain <- sapply(rain, max)


## Plot a boxplot that shows the distribution of rainfall at each station
## (hint: there should be 5 "boxes" in the boxplot)
boxplot(rain)


## Make a scatterplot that shows the rainfall at station 1 in year 2000.
## Precipitation should go on the y-axis and day on the x-axis
## Make new labels for the x- and y-axis.
## Hint: the date information is stored in the object day.
yr.2000 <- floor(day[[1]]) == 2000
rainfall.subset <- rain[[1]][yr.2000]
day.subset <- day[[1]][yr.2000]
plot(day.subset, rainfall.subset, xlab='day', ylab='rainfall')


########################################### THIRD PART
#### Load in the infant data
load("KaiserBabies.rda")

## Let us do a linear regression of birth weight (bwt) as a function of the length
## of the pregnancy
## make sure to keep this line:
fit <- lm(bwt ~ gestation, data=infants)

## The object fit is a list and in it you will find the coefficients of the regression
## Do a scatterplot of birthweight (on y-axis) vs. gestation (on x-axis)
## Add to the plot the line estimated in fit (hint: find the coefficients)
## Plot the line in red and put your own x- and y-axis labels on the plot.
plot(bwt ~ gestation, data=infants, xlab='gestation', ylab='bwt')
abline(a=fit$coef[1], b=fit$coef[2], col='red')

## Plot a histogram of the fathers' heights (varible dht in the data frame).
hist(infants$dht)


## Create a table which tallies the education level of mothers (varible ed in the data frame)
## against the education level of the fathers (variable ded in the data frame).
## Store the table in the variable [[ ed.table ]]
ed.table <- table(infants$ed, infants$ded)


########################################### FOURTH PART
## Write a function that takes as input a vector x and returns a standardized vector
## (i.e. x after subtracting the mean and dividing with the sd)

standardize <- function(x){

    return((x-mean(x, na.rm=T))/sd(x, na.rm=T))
}
