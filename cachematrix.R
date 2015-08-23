## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function produces several small functions 
# that assign functions to the global environment.
# They will "feed" the next function to determine
# how to recover the data for the solve function

makeCacheMatrix <- function(x = matrix()) {

# m is the "go-to" variable, where the info lives
# set is a function to assign input to the global environment
		m <- NULL
		set <- function(y) {
		    x <<- y
		    m <<- NULL

		    }
# get passes a name through
# setsolve passes the name of the function (in this case, solve) through
# getsolve passes the name of the global variable
		get <- function()x
		setsolve <- function(solve)m <<- solve
		getsolve <- function()m
		list(set=set,get=get,
			setsolve=setsolve,
			getsolve=getsolve)
    
}


## Write a short comment describing this function
# This function takes as its input the special output as
# makeCacheMatrix.  If the matrix has been inverted before,
# then that value is returned.
# otherwise, the inverse is obtained.
# The best way to determine this is to run the cacheSolve function
# the second time on the same data set.  You will get the 
# message that the cached inverse is retrieved.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# Look at the value of getsolve
# If it is not null, print an informative message, return value of m
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
