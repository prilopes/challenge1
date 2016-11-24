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
  
  open <- data.frame(V = v1, G = 0)
  closed <- data.frame()
  
  while(nrow(open) > 0){
    current <- open[1,]
    open <- open[-1,]
    
    if(current$V == v2){
      return(current$G)
    }
    else {
      adjVertices <- getAdjacents(g, current$V)
      newVertices <- setdiff(adjVertices, c(toVist$V, closed$V)) ## never b4 seen
      adjInOpen <- setdiff(adjVertices, toVist$V) ## seen but not visited
      adjInClosed <- setdiff(adjVertices, closed$V) ## seen, visited, but maybe this is a shorter path?
      
      open <- update(open, adjInOpen)
      updatedPassed <- 
      
      newV <- c(open$V, newVertices)
      newG <- c(open$G, rep(current$G + 1, times = length(newVertices)))
      
      open <- data.frame(V = newV, G = newG)
      
    }
  }
}

getAdjacents <- function(g, v){
  return(g[g$V1 == v, 'V2'])
}

getNewVertices <- function(adj, created){
  
  areNew <- sapply(adj, function(x) !is.element(x, created))
  
  return(adj[areNew])
}