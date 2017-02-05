## Below are two functions that are used to create a
## special "matrix" object that can cache its inverse.

## The first function takes an invertible matrix and
## creates a list containing functions that:
## 1. set the matrix
## 2. get the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix
## The list is the input to the second function.
## '<<-' is used to assign a value to an object in an
## environment different from the current one.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}  


## The second function calculates the inverse of the
## "special" matrix created with the first function.
## However it checks first if the inverse has already
## been calculated. If so, it gets the inverse from
## the cache and skips computation. Otherwise it
## calculates the inverse of the matrix and sets it
## in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if (!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        mat.data <- x$get()
        i <- solve(mat.data, ...)
        x$setinverse(i)
        ## Return a matrix that is the inverse of 'x'
        i
}    
