## Some examples from the slides

x <- c(1,3,5,7,9)
y <- rep(2, 3)
z <- 17

lookAt <- function(x){
    y <- 3
    print(x)
    print(y)
    print(z)
}

lookAt(x=c(0,0))

x
y
z

## Scope.  pi is a defined constant, you can overwrite it (not recommended)
help(pi)
pi <- 3
pi
rm(pi)
pi


## Cathcing errors

## The function stop
showstop <- function(x){
   if(any(x<0)) stop("x must be >=0")
   return("ok")
}


showstop(1)
showstop(c(-1,1))

## The function stopifnot
showstopifnot <- function(x){
   stopifnot(x >= 0, x%%2==1)
   return("ok")
}

showstopifnot(1)
showstopifnot(c(-1,1))
showstopifnot(c(1,2))

ratio.warn <- function(x, y){
   if(any(y==0))
   warning("Dividing by zero")
   return(x/y)
}


ratio.warn(x=1, y=c(1,0))
ratio.warn(x=1:3, y=1:2)

ratio.try <- function(x, y){
   z <- try(x/y, silent=TRUE)
   if(inherits(z, "try-error"))
      stop("Error in division x/y")
   return(z)
}

ratio.try(x=1, y=c(1,0))

ratio.try(x=1, y="r")

##############
p <- 0.3
sample(1:0, size=1, prob=c(p, 1-p))

myRNG <- function(total, p=0.5){
# Simulate number of tosses to get 10 heads

   x <- 0
   steps <- 0
   max.iter <- 1000

   while(x <- total){
      z <- x+sample(1:0, size=1, prob=c(p, 1-p))
      steps <- steps + 1
      if(steps >= max.iter){
         warning("Maximum iteration reached")
	 break
      }
   } 

   return(steps)
}

