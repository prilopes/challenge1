require(foreach)
source('shortestPath.R')

rankCloseness <- function(gr){
  
  rankCloseness <- rank(closeness(gr)) 
  
  return(rankCloseness[order(rankCloseness)])
}

closeness <- function(gr){
  
  allVertices <- unique(c(gr$V1, gr$V2))
  n <- length(allVertices)
  
  Md <- as.matrix(foreach(v1 = allVertices, .combine = 'rbind') %:%
                    foreach(v2 = allVertices, .combine = 'cbind') %do%
                      shortestPath(gr, v1, v2))

  rownames(Md) <- allVertices
  colnames(Md) <- allVertices
    
  farness <- apply(Md, 2, sum)
  
  closeness <- 1/farness ## as in https://en.wikipedia.org/wiki/Centrality#Closeness_centrality
  
  return(closeness)
}