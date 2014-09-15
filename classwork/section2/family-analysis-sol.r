# Please use the family.csv dataset to answer the following questions. Write
# your code so that it works for an arbitrary dataset of the same format as
# family.csv 

# load in the data and save it as a data frame called family.
# family <- your code here
family <- read.csv('family.csv')


# Use the summary function to examine the dataset.
# your code here
summary(family)


# How many family members are there in the dataset?
# n.family <- your code here
n.family <- nrow(family)


# How many males? How many females?
# n.males <- your code here
# n.females <- your code here
n.males <- sum(family$fgender == 'm')
n.females <- n.family - n.males


# What are the female names? The male names?
# f.names <- your code here
# m.names <- your code here
f.names <- family$fnames[family$fgender == 'f']
m.names <- family$fnames[family$fgender == 'm']

# What is the average age of individuals whose age is recorded?
# avg.age <- your code here
avg.age <- mean(family$fage, na.rm=T)


# What is the average age of individuals who are not named Tom, Ann, or Joe?
# avg.age.subset <- your code here
not.them <- !family$fnames %in% c('Tom', 'Ann', 'Joe')
mean(family$fage[not.them], na.rm=T)


# Create the vector fratio that gives the height to weight ratio for each family
# member. Add this vector to the data frame <family>
# fratio <- your code here
# family <- your code here
fratio <- family$height / family$weight
family <- cbind(family, fratio)


# How many individuals are taller than the average height of the family? How
# many are shorter?
# n.tall <- your code here
# n.short <- your code here
n.tall <- sum(family$fheight > mean(family$fheight))
n.short <- sum(family$fheight <= mean(family$fheight))


# How many individuals are more than 1 sd above the average height?
# n.really.tall <- your code here
cutoff <- mean(family$fheight) + sd(family$fheight)
n.really.tall <- sum(family$fheight > cutoff)


