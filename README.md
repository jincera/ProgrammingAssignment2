### Programming Assignment 2

This is my submission to Programming Assignment 2 of the R Programming course (Coursera/John Hopkins).
It is based on the template provided by the instructors for caching the mean of a Vector.

As of now, the code is not safe in the sense that it does not validate any input.

### Execution

This code shows how are the functions invoked:

<!-- -->

> x <- matrix(c(1, 3, 2, 4), 2, 2)
> x
        [,1] [,2]
[1,]    1    2
[2,]    3    4
> 
>x1<-makeCache(x)
>
>x2<-cacheSolve(x1)
>
>x2
    [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5
> 
>x2<-cacheSolve(x1)
getting cached data
>



