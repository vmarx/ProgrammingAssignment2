## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function( m = matrix() ) {
  
## Initialize inverse property
  i <- NULL
  
## set the matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
## get the matrix
  get <- function() {
## Return the matrix
    m
  }
  
## set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
## get the inverse of the matrix
  getInverse <- function() {
## Return the inverse property
    i
  }
  
## Return list of methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

##This function computes the inverse of the special "matrix"
##returned by makeCacheMatrix above. If the inverse has already
##been calculated (and the matrix has not changed), then
##cacheSolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  
## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
## Only returninverse if already set
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
## Get matrix from object
  data <- x$get()
  
## Calculateinverse using matrix multiplication
  m <- solve(data) %*% data
  
## Set inverse to object
  x$setInverse(m)
  
## Return matrix
  m
}