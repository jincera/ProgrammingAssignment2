## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    m_inv<-NULL
    
    set<-function(y)
    {
        x<<-y
        
        m_inv<<-NULL
    }
    
    get <-function() x
    
    setm_inv <-function(solve) m_inv<<-solve
    
    getm_inv <- function() m_inv
    
    list(set=set, get=get, setm_inv = setm_inv, getm_inv = getm_inv)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m_inv <-x$getm_inv()
    
    if(!is.null(m_inv)){
        message("getting cached data")
        return(m_inv)
    }
    data <-x$get()
    m_inv <-solve(data,...)
    x$setm_inv(m_inv)
    m_inv
}

