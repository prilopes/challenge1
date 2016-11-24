## finds shortest path between 2 vertices in graph g
shortestPath <- function(g, v1, v2){
  
  ## Are v1 and v2 in g?
  if(areValidVertices(g,v1,v2)){
    return(0)
  }
  else {
    return(-1)
  }
}

areValidVertices <- function(g, v1, v2){
  
  v1IsValid <- (nrow(g[g$V1 == v1,]) > 0)
  v2IsValid <- (nrow(g[g$V2 == v2,]) > 0)
    
  return(v1IsValid && v2IsValid)
}