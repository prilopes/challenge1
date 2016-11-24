## finds shortest path between 2 vertices in graph g
shortestPath <- function(g, v1, v2){
  
  ## Are v1 and v2 in g?
  if(areValidVertices(g,v1,v2)){
    return(getShortestPath(g, v1, v2))
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

getShortestPath <- function(g, v1, v2){
  
  toVisit <- data.frame(V = v1, G = 0)
  passed <- data.frame()
  
  while(nrow(toVisit) > 0){
    current <- toVisit[1,]
    toVisit <- toVist[-1,]
    
    if(current$V == v2){
      return(current$G)
    }
    else {
      adjVertices <- getAdjacents(g, current$V)
      newVisit <- data.frame(V = adjVertices, G = rep((current$G + 1), times = length(adjVertices)))
      
      
      
      toVisit <- data.frame(V = c(toVisit$V, newVisit$V), G = c(toVisit$G, newVisit$G))
    }
  }
}

getAdjacents <- function(g, v){
  return(g[g$V1 == v, 'V2'])
}