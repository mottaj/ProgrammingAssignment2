## Two functions:
##     makeCacheMatrix: creates a special "matrix" object that can
##                      cache its inverse.
##     cacheSolve: returns the inverse of a matrix; if this inverse
##                 has already been calculated and stored (cashed)
##                 then the cashed inverse is returned; if no
##                 inverse has been cashed yet, this function
##                 calculates the inverse from scratch and caches
##                 it for future use.



## This function makes a container that can store a matrix and its
## inverse. Returns a list of four functions:
##   set(y) - stores the matrix y in this container
##   get()  - returns the matrix that is currently stored
##   setInverse(inverse) - stores the inverse matrix
##   getInverse()        - returns the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    myMatrix  <- x
    myInverse <- NULL
    
    set <- function(y) {
        myMatrix  <<- y
        myInverse <<- NULL
    }
    
    get <- function() {
        myMatrix
    }
    
    setInverse <- function(inverse) {
        myInverse <<- inverse
    }
    
    getInverse <- function() {
        myInverse
    }
    
    list( set=set,
          get=get,
          setInverse=setInverse,
          getInverse=getInverse )
}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already
## been calculated (and the matrix has not changed), then the
## cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    inverseMatrix <- x$getInverse()
    
    if( !is.null(inverseMatrix) ) {
        message("getting cached data")
        return(inverseMatrix)
    }
    
    # Still here? Then there is no cached inverse matrix, so need
    # to calculate it and store it.
    origMatrix <- x$get()
    inverseMatrix <- solve(origMatrix)
    x$setInverse(inverseMatrix)
    
        ## Return a matrix that is the inverse of 'x'
    inverseMatrix
}
