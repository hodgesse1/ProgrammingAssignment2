Here is a little demonstration of how the functions work:

> source("cachematrix.R")
> # Produce a symmetric matrix
> s <- matrix((1:10000+rnorm(10000)),100)
> s[lower.tri(s)] <- t(s)[lower.tri(s)]
> za <- makeCacheMatrix(s)
> # Calculate the initial inverse
> rr <- cacheSolve(za)
> # Now re-run on the za set
> rs <- cacheSolve(za)
Retrieving Cached Matrix
