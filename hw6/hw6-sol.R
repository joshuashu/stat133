bml.init <- function(r,c,p){
  matrix(sample(c(0,1,2), r*c, prob = c(1-p, p/2, p/2), replace = T), nrow = r)
}

move_east <- function(m) {
  if(ncol(m)==1) {
    return(m)
  }
  blocked <- m[, c(2:ncol(m), 1)]!=0
  red_cars <- m*(m==1)
  m*(m!=1) + red_cars*blocked + (red_cars*!blocked)[,c(ncol(m), 1:(ncol(m)-1))] 
}

move_north <- function(m) {
  if(nrow(m)==1) {
    return(m)
  }
  blocked <- m[c(nrow(m), 1:(nrow(m)-1)),]!=0
  blue_cars <- m*(m==2)
  m*(m!=2) + blue_cars*blocked + (blue_cars*!blocked)[c(2:nrow(m), 1), ] 
}

bml.step <- function(m){
  m.new <- move_north(move_east(m))
  return(list(m.new, !all(m==m.new)))
}