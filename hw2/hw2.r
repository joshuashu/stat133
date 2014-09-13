# Homework #2
# DUE Thursday Sep 18 at 11:59 p.m.

# In this assignment you will manipulate a data frame, by taking subsets and 
# creating new variables, with the goal of creating a plot.

# You will work with two datasets that have been presented in class,
#  - family.rda a dataset on the height and weight of 14 members of a family 
#  - SFHousing.rda, housing data that have been made available by the San
#    Francisco Chronicle.


# PART 1.  Family Data
# The datafile family.rda is in your hw2 folder.  Use the load() command to
# load the data into R/RStudio.

# load( your code here )



# In the following exercises try to write your code to be as general as possible
# so that it could still work if the family had 27 members in it or if the 
# variables were in a different order in the data frame.

# Q1.
# The NHANES survey used different cut-off values for men and women when classifying
# them as over weight.  Suppose that a man is classified as obese if his bmi exceeds 26
# and a woman is classified as obese if her bmi exceed 25.

# Write a logical expression to create a logical vector, called OW_NHANES, that is TRUE if 
# a member of family is obese and FALSE otherwise (you need to consider makes and females
# separately).

# OW_NHANES <- your code here


# Q2. 
# Here is an alternative way to create the same vector that introduces 
# some useful functions and ideas

# We will begin by creating a numeric vector called OW_limit that is 26 for each male in
# the family and 25 for each female in the family.

# To do this, first create a vector of length 2 called OWval whose first element 
# is 26 and second element is 25.

# OWval <- your code here


# Create the OW_limit vector by subsetting OWval by position, where the 
# positions are the numeric values in the gender variable 
# (i.e. use as.numeric() to coerce the factor vector storing gender to a
# numeric vector)

# OW_limit <- your code here


# Finally, us OW_limit and bmi to create the desired logical vector, called OW_NHANES2
# which, like OW_NHANES, is TRUE if a member of family is obese and FALSE otherwise

# OW_NHANES2 <- your code here


# Q3.
# Use the vector OW_limit and each person's height to find the weight 
# that they would have if their bmi was right at the limit (26 for men and 
# 25 for women).   Call this weight OW_weight

# To do this, you need to know the formula for BMI,
# bmi = (weight/2.2) / (2.54/100 * height)^2
# and use it to write weight as a function of bmi and height.

# Now calculate OW_weight 
# OW_weight <- your code here


# Make a plot of actual weight against the weight at which they would
# be overweight using the plot function.
# use the abline() function to include a red identity line.

# plot( your code here )
# abline( your code here )


#PART 2.  San Framcisco Housing Data
# The datafile SFHousing.rda is in your hw2 folder.
# These data contain information about sales in the
# San Francisco Bay Area, including the date of sale, sale price, square
# footage and location of each house sold from April 2003 to May 2006.
# Use the load() command to load the data into R/RStudio.

# load( your code here )


# Q4. (not graded)
# Use the following functions to examine the dataset
# objects(), class(), dim(), head(), names(), summary().

# How many cities are in the dataset, store the answer in the variable
# n.cities.

# n.cities <- your code here


# How many house sales are included in the dataset?  Store the answer in
# the variable n.housesale.

# n.housesale <- your code here


# How many of these house sales were in Berkeley?
# n.housesale.Berk <- sum(housing$city=="Berkeley")

# Create a vector with the names of all variables in housing.

# all.housing.variable <- your code here




# Q5.
# We will work the houses in Albany, Berkeley, Piedmont, and Emeryville only.
# Subset the data frame so that we have only houses in these cities
# and keep only the variables city, zip, price, br, bsqft, and year
# Call this new data frame BerkArea. This data frame should have 4059 observations
# and 6 variables.

# Create two vectors, one with the names of the cities we want to keep,
# one with the names of the variables we want to use.

# local.cities <- your code here

# some.housing.variables <- your code here

# Create the smaller data frame
# BerkArea <- your code here


# Q6.
# We are interested in making plots of price and size of house, but before we do this
# we will further subset the data frame to remove the unusually large values.
# Use the quantile function to determine the 99th percentile of price and bsqft
# and eliminate all of those houses that are above either of these 99th percentiles
# Call this new data frame BerkArea, as well. It should have 3999 oobservations.

# BerkArea <- your code here

# Q7.
# Create a new vector that is called pricePsqft by dividing the sale price by the square footage
# Add this new variable to the data frame.

# BerkArea$pricePsqft <- your code here

#  Q8.
# Create a vector called br5 that is the number of bedrooms in the house, except
# if this number is greater than 5, it is set to 5.  That is, if a house has 5 or more
# bedrooms then br5 will be 5. Otherwise it will be the number of bedrooms.

# br5 <- your code here



# Q 9.
# Use the rainbow function to create a vector of 5 colors, call this vector rCols.
# When you call this function, set the alpha argument to 0.25 (we will describe what this does later)

# rCols <- your code here


# Create a vector called brCols of 4059 colors where each element's
# color corresponds to the number of bedrooms in the br5.
# For example, if the element in br5 is 3  then the color will be the third color in rCols.

# brCols <- your code here


######
# We are now ready to make a plot!
# Try out the following code
# (examine each part of the command and use the help for plot() and for par() to find out what it does)

plot(pricePsqft ~ bsqft,
     data = BerkArea, 
     main = "Housing prices in the Berkeley Area",
     xlab = "Size of house (square ft)",
     ylab = "Price per square foot",
     col = brCols, pch = 19, cex = 0.5)

# Look at the help for legend(), examine what this function adds to the plot.
legend(legend = 1:5, fill = rCols, "topright")

## Food for thought (not graded):
## Examine the plot.  What interesting feature do you see that you didn't know before making this plot? 

# Now plot the price per square foot as a function of the year it was built (the variable year
# in the dataframe).  Color the observations by number of bedrooms just as before.
# Make sure that the axes are labelled correctly.

# plot( your code here )
# legend( your code here )

## Food for thought (not graded):
## Examine the plot.  Do you see any interesting features.

