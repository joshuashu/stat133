#########################################
#####      Matrices and Arrays      #####
#########################################

## Statistics 133, Fall 2014
## The first part of this was covered in class Thu 9/18, second part Tue 9/23

# Matrices and Arrays are : Rectangular collection of elements
# the primitive elements have to be homogeneous (e.g., all numeric or all character)
# Dimensions are two, three, or more

# Create a matrix m
m = matrix(1:6, nrow = 2)

# Look at m
m

# What happens if you set the byrow parameter?
m = matrix(1:6, nrow = 2, byrow = TRUE)

# Look at m again
m

# Assign names to the columns and rows of m
rownames(m) = letters[1:2]
colnames(m) = letters[1:3]
m

# Use dim(), nrow() and ncol() to check the size of m
dim(m)
nrow(m)
ncol(m)

# The function t() returns the transpose
t(m)

# Subset using various methods, compare the output to the printout of m above
m[-1, 2]
m["a", ]
# subset with a logical vector, examine what happens
S1 <- c(TRUE, TRUE, FALSE)
m[, S1]
# Pull out only the first row of m
m[1, ]

#### Aside: by default the result of subsetting is coerced to a vector if possible, rather than a matrix with a single row or column. To override, use drop = FALSE.

# Pull out the first row of m and check what its class is
class(m[1,])

# The following command also pulls out the first row of m, but perserves the class
m[1, , drop=FALSE]

# The class is still matrix
class(m[1, , drop = FALSE])

#### Aside: Matrices and arrays are actually stored as vectors with shape information so our discussions of “vectorized” calculations hold for matrices as well.
mm = matrix(1:6, ncol = 2, byrow = TRUE)

# Look at mm
mm

# What is the 4th element?
mm[4]

# What is the length of mm?  Note comment above.
length(mm)

# What does this do?  (look also at the result of mm+17)
(mm + 17)[1, ]

##### Arrays
# Arrays are matrices in higher dimensions

x <-  array(1:30, c(4, 3, 2))

# Look at x
x

# Before running these commands look at x and predict which elements will be returned
x[1:2, 3, 2]
x[,2,1]
x[3:4,c(3,1),1]








