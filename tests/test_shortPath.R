gr <- read.table(file.path("..", "testEdges.dat"))
gen <- data.frame(V = c(1,2,3,4,5,6,7), G = c(1,2,3,4,2,3,2))
adjacents <- c(2,3,4)

## Test for areValidVertices(gr, v1, v2)
expect_that(areValidVertices(gr, v1 = 1, v2 = 5), is_true())

expect_that(areValidVertices(gr, v1 = 1, v2 = 7), is_false())

expect_that(areValidVertices(gr, v1 = 0, v2 = 4), is_false())

expect_that(areValidVertices(gr, v1 = 0, v2 = 7), is_false())

## Test for getAdjacents(gr, v)
expect_that(getAdjacents(gr, v = 1), equals(c(2, 3, 4)))

expect_that(getAdjacents(gr, v = 3), equals(c(4, 5)))

## Test for subAdjacent(gen, adjacents, g)
expect_that(subAdjacent(gen, adjacents, g = 2), equals(c(3, 4)))

expect_that(subAdjacent(gen, adjacents, g = 3), equals(c(4)))

expect_that(subAdjacent(gen, adjacents, g = 4), equals(numeric(0)))


## Test for shortestPath(gr, v1, v2)
expect_that(shortestPath(gr, v1 = 0, v2 = 4), equals(-1))

expect_that(shortestPath(gr, v1 = 1, v2 = 5), equals(2))

expect_that(shortestPath(gr, v1 = 5, v2 = 3), equals(2))