require(foreach)
source('shortestPath.R')

closeness <- function(gr){
  
  allVertices <- unique(c(gr$V1, gr$V2))
  n <- length(allVertices)
  
  Md <- as.matrix(foreach(v1 = allVertices, .combine = 'rbind') %:%
                    foreach(v2 = allVertices, .combine = 'cbind') %do%
                      shortestPath(gr, v1, v2))

  farness <- apply(Md, 2, sum)
  
  closeness <- n/farness
  
  return(closeness)
}