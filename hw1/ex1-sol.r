# For this assignment, you will be required to create several variables. We have
# indicated the name that you should assign each variable, but have left the
# variable commented with the # character. Any commented code in your script
# will not be run, so you will need to uncomment each variable before submitting
# your assignment. The following is a simple example of what you will be
# required to do:

# Create the variable <two.plus.two>. This variable should give the sum of 2 and
# 2.
# two.plus.two <- your code here
two.plus.two <- 2 + 2

# You may leave the "# two.plus.two <- your code here" line in your file or
# delete it. Since the line is commented out, it will not be run as part of your
# script. DO NOT remove the # character without replacing "your code here" with
# the appropriate code. This will result in an invalid R file and your program
# will not run. You can test your code by navigating to your hw1 directory in
# terminal, opening R, and using the command: source('ex1.r'). After sourcing
# your file, any variables that you created should be visible by using the
# command: ls() or objects().
# Good Luck!

# Included in your hw1 directory, you will find the file "ex1-data.csv". Please
# load in this data and store it as a variable named <ex1.data>. Set the header
# argument to TRUE when reading in the csv.

# ex1.data <- your code here
ex1.data <- read.csv('ex1-data.csv', header=T)


# The data you just loaded is stored as a data frame object. Your data frame
# should have one column with the name "x". You can extract a column from a data
# frame using the $ operator: <data.frame>$<column.name>. In our case, there is
# only one column, and the command ex1.data$x will extract it. A column
# extracted from a data frame is a vector object. Many operations in R can be
# performed on vectors but not on data frames. Please extract the x vector from
# <ex1.data> and store this vector as a variable named <ex1.data.v>.

# ex1.data.v <- your code here
ex1.data.v <- ex1.data$x

# find the class of <ex1.data.v>. Store this as a variable with the name
# <data.class>

# data.class <- your code here
data.class <- class(ex1.data.v)

                    
# create the variable <n.ex1.data> that gives the number of observations in the
# vector <ex1.data.v>.

# n.ex1.data <- your code here
n.ex1.data <- length(ex1.data.v)


# calulate the mean of <ex1.data.v>. Store this as the variable
# <data.mean>. In addition, calculate the trimmed mean, setting the trim
# argument to 0.1. Store this as the variable <data.mean.trimmed>.

# data.mean <- your code here
data.mean <- mean(ex1.data.v)
data.mean.trimmed <- mean(ex1.data.v, trim=0.1)


# calculate the standard deviation of <ex1.data.v>. Store this as the variable
# <data.sd>.

# data.sd <- your code here
data.sd <- sd(ex1.data.v)


# find the minimum and maximum values of <ex1.data.v>. Store these as variables
# with names <min.ex1.data> and <max.ex1.data> respectively.

# min.ex1.data <- your code here
# max.ex1.data <- your code here
min.ex1.data <- min(ex1.data.v)
max.ex1.data <- max(ex1.data.v)


# use R's summary function to find the min, 1st quartile, median, mean, 3rd
# quartile, and max of <ex1.data.v>. Store this as the variable <data.summary>.

# data.summary <- your code here
data.summary <- summary(ex1.data.v)


# create the vector <ex1.data.double>. This should be a vector of each
# observation from <ex1.data.v> doubled.

# ex1.data.double <- your code here
ex1.data.double <- 2 * ex1.data.v


# calculate the sum of the observations in <ex1.data.v>. Store this as the
# variable <ex1.data.sum>.

# ex1.data.sum <- your code here
ex1.data.sum <- sum(ex1.data.v)


# create a new vector of standard normal variables with the same length as
# <ex1.data.v>. Store this as a variable with the name <random.data>. Calculate
# the correlation between <ex1.data.v> and <random.data>. Store this as a
# variable with the name <data.cor>

set.seed(47) # THIS LINE MUST COME BEFORE YOUR GENERATED DATA. DO NOT REMOVE IT.
# random.data <- your code here
# data.cor <- your code here
random.data <- rnorm(100)
data.cor <- cor(ex1.data.v, random.data)
