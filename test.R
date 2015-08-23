# TEST CASE
#
# The matrix
#      [,1] [,2] [,3]
# [1,]    1    3    3
# [2,]    1    4    3
# [3,]    1    3    4
#
# has the inverse
#      [,1] [,2] [,3]
# [1,]    7   -3   -3
# [2,]   -1    1    0
# [3,]   -1    0    1


# Create the matrix:
A <- matrix(c(1,1,1,3,4,3,3,3,4), 3, 3)
A
#      [,1] [,2] [,3]
# [1,]    1    3    3
# [2,]    1    4    3
# [3,]    1    3    4

# Store matrix in cached matrix object
source("cachematrix.R")
cachedA <- makeCacheMatrix() # currently empty
cachedA$get()
#      [,1]
# [1,]   NA

cachedA$set(A) # store the matrix A in the cachedA container
cachedA$get()
#      [,1] [,2] [,3]
# [1,]    1    3    3
# [2,]    1    4    3
# [3,]    1    3    4

# Or, can create object & store matrix at the same time:
remove(cachedA)
cachedA <- makeCacheMatrix(A)
cachedA$get()
#      [,1] [,2] [,3]
# [1,]    1    3    3
# [2,]    1    4    3
# [3,]    1    3    4

# Inverse should be NULL since it hasn't been calculated yet:
cachedA$getInverse()
# NULL

# Now calculate the inverse of matrix A:
cacheSolve(cachedA)
#      [,1] [,2] [,3]
# [1,]    7   -3   -3
# [2,]   -1    1    0
# [3,]   -1    0    1

# Check whether the inverse matrix has been stored:
cachedA$getInverse()
#      [,1] [,2] [,3]
# [1,]    7   -3   -3
# [2,]   -1    1    0
# [3,]   -1    0    1

# Everything worked the way it was supposed to for this test case!