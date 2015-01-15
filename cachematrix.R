## makeCacheMatrix receives is a container function.
## It receives a matrix as its argument and provides functions for 
## setting or getting the original matrix and its inverse 
## Variable m_inv stores the computed inverse 
## 
## As stated in the assignment, we assume that the input is inversible.
## We do not validate if it is a square matrix

makeCacheMatrix <- function(x = matrix()) {
    
    ## m_inv stores the inverse. 
    ## It is initialized to NULL (See function cacheSolve)
    m_inv<-NULL
    
    ## set and get are "methods" for giving access to the original matrix
    ## operator <<- in the set function addresses the x variable (the matrix) in 
    ## the parent environment
    
    set<-function(y)
    {
        x<<-y
        
        m_inv<<-NULL
    }
    
    get <-function() x
    
    ## setm_inv and getm_inv are "methods" for giving access to the inverse
    ## The inverse is stored in variable m_inv in the environment where we are being defined
    setm_inv <-function(solve) m_inv<<-solve
    
    getm_inv <- function() m_inv
    
    ## This list is the "vector" that gives access to the methods defined above
    ## Since this is the last statement of the function, makeCacheMatrix actually returns these 
    ## elements, that is, access to the local set, get, setm_inv and getm_inv functions
    
    list(set=set, get=get, setm_inv = setm_inv, getm_inv = getm_inv)
    
}


## Return a matrix that is the inverse of 'x'
## if it is invoked for the first time, the inverse is computed with the solve function in R
## and the result is stored in m_inv (of the makeCacheMatrix container)
## Subsecuent calls to this function will return the stored value without spending resources
## computing it again

cacheSolve <- function(x, ...) {
        
    # We are retreiving the value in the container 
    # m_inv is our "local" variable
    m_inv <-x$getm_inv()
    
    if(!is.null(m_inv)){
        message("getting cached data")
        return(m_inv)
    }
    # If we are here, this is the first time we have been invoked. Let us compute the inverse
    data <-x$get()
    m_inv <-solve(data,...)
    x$setm_inv(m_inv)
    m_inv
}

