g <- data.frame(V1 = c(1,1,1,2,3,3), V2 = c(2,3,4,3,4,5))

## Test for areValidVertices(g, v1, v2)
expect_that(areValidVertices(g, v1 = 1, v2 = 5), is_true())

expect_that(areValidVertices(g, v1 = 1, v2 = 7), is_false())

expect_that(areValidVertices(g, v1 = 0, v2 = 4), is_false())

expect_that(areValidVertices(g, v1 = 0, v2 = 7), is_false())

## Test for getAdjacents(g, v)
expect_that(getAdjacents(g, v = 1), equals(c(2, 3, 4)))

expect_that(getAdjacents(g, v = 3), equals(c(4, 5)))

## Test for shortestPath(g, v1, v2)
expect_that(shortestPath(g, v1 = 0, v2 = 4), equals(-1))


#expect_that(shortestPath(g, v1 = 1, v2 = 5), equals())