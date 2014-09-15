##################################
#####  Lecture 5 - Graphics  #####
##################################


##################################
##### Kaiser Infant Data

load("KaiserBabies.rda")

## Start by looking at the data

objects()

head(infants)

is.matrix(infants)

is.data.frame(infants)

names(infants)

dim(infants)

infants$bwt
infants[ ,"bwt"]

##### Lets plot the birthweights

hist(infants$bwt)
help(hist)

## Please look at the help function to determine what each of the arguments to hist() do.  Compare the previous 
## histogram with the one you get using:

hist(infants$bwt, freq=FALSE, xlab="Birth Weight (oz)", main="Male Babies, Oakland Kaiser 1960")
 
## The function rug() adds tick marks to an *existing* plot
rug(infants$bwt)

plot(density(infants$bwt))

plot(density(infants$bwt), xlab="Birth Weight (oz)", main="Male Babies, Oakland Kaiser 1960")

plot(density(infants$bwt, bw=1))

boxplot(infants$bwt, xlab="Birth Weight (oz)")

## Notice how the same parameter (xlab, main, etc. can be set in all plotting functions)

##### Look at parity (number of siblings)

table(infants$parity)
barplot(table(infants$parity))

plot(table(infants$parity), type="h", lwd=4, ylab="Proportion", col="darkgrey")


##################################
##### College Students

load("videogame.rda")

objects()
names()
dim(video)
head(video)

table(video$grade)

table(video$grade, video$sex)
pie(table(video$grade))
dotchart(table(video$grade), pch=19)
mosaicplot(table(video$sex, video$grade), main="Stat 2 Survey")

##################################
##### San Francisco Housing Data

load("SFHousing.rda")

someCities = c("Albany", "Berkeley”, "El Cerrito", "Emeryville", "Piedmont", "Richmond", "Lafayette", "Walnut Creek", "Kensington","Alameda","Orinda”,"Moraga")

shousing <- housing[housing$city %in% someCities & housing$price < 2000000,]
dim(shousing)
head(shousing)

boxplot(shousing$price ~ shousing$city, las=2)

ppsf <- shousing$price/shousing$bsqft
plot(ppsf ~ shousing$bsqft)

plot(ppsf ~ shousing$bsqft, pch=19, cex=0.2, subset=shousing$city=="Berkeley", main="Berkeley", xlab="Area (ft^2)",ylab = "Price/ft^2"))

##################################
##### Chips
chips = read.table("http://www.stat.berkeley.edu/users/nolan/data/chip04.txt", header = TRUE)

class(chips)

names(chips)

dim(chips)

plot(chips$Date, chips$Transistors, type ="l", lwd = 3, col ="green",log ="y")
