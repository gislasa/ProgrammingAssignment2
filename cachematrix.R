## THESE FUNCTIONS ALLOW USER TO STORE, CHANGE, AND RETRIEVE MATRIX AND INVERSE OF MATRIX

## THIS CREATES LIST OF FUNCTIONS TO SET VALUE OF MATRIX, GET VALUE OF MATRIX, SET INVERSE, GET INVERSE
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## THIS PULLS CACHED INVERSE, OR CREATES AND CACHES INVERSE

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
## Return a matrix that is the inverse of 'ds'

## SAMPLE EXAMPLE ##
## ds <- matrix(rnorm(16), nrow = 4, ncol = 4)
## b<- makeCacheMatrix(ds)
## b$get()
## cacheSolve(b)