require(foreach)
source('shortestPath.R')

rankCloseness <- function(gr){
  
  rankCloseness <- rank(closeness(gr)) 
  
  return(rankCloseness[order(rankCloseness)])
}

closeness <- function(gr){
  
  allVertices <- unique(c(gr$V1, gr$V2))
  n <- length(allVertices)
  
  Md <- distances(gr)

  farness <- apply(Md, 2, sum)
  
  closeness <- 1/farness ## as in https://en.wikipedia.org/wiki/Centrality#Closeness_centrality
  
  return(closeness)
}

distances <- function(gr){
  
  allVertices <- unique(c(gr$V1, gr$V2))
  n <- length(allVertices)
  
  Md <- matrix(nrow = n, ncol = n)
  
  for(i in 1:n)
    for(j in 1:n)
      Md[i,j] <- shortestPath(gr, i, j)
  
  rownames(Md) <- allVertices
  colnames(Md) <- allVertices
  
  return(Md)
}