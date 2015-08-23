## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function produces several small functions 
# that assign functions to the global environment.
# They will "feed" the next function to determine
# how to recover the data for the solve function

makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
		set <- function(y) {
		    x <<- y
		    m <<- NULL
		    }
		get <- function()x
		setsolve <- function(solve)m <<- solve
		getsolve <- function()m
		list(set=set,get=get,
			setsolve=setsolve,
			getsolve=getsolve)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getsolve()
	if(!is.null(m)) {
			message("Retrieving Cached Matrix")
			return(m)
			}
        data <- x$get()
	m <- solve(data,...)
	x$setsolve(m)
	m
}
