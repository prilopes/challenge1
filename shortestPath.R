## finds shortest path between 2 vertices in graph gr
shortestPath <- function(gr, v1, v2){
  
  ## Are v1 and v2 in gr?
  if(areValidVertices(gr,v1,v2)){
    return(getShortestPath(gr, v1, v2))
  }
  else {
    return(-1)
  }
}

areValidVertices <- function(gr, v1, v2){
  
  allVertices <- unique(c(gr$V1, gr$V2))
    
  return(all(c(v1,v2) %in% allVertices))
}

getShortestPath <- function(gr, v1, v2){
  
  open <- data.frame(V = v1, G = 0)
  closed <- data.frame()
  
  while(nrow(open) > 0){
    current <- open[1,]
    open <- open[-1,]
    
    if(current$V == v2){
      return(current$G)
    }
    else {
      adjVertices <- getAdjacents(gr, current$V)
      
      newVertices <- setdiff(adjVertices, c(open$V, closed$V)) ## never b4 seen
      adjInOpen <- setdiff(adjVertices, open$V) ## seen but not visited
      adjInClosed <- setdiff(adjVertices, closed$V) ## seen, visited, but maybe this is a shorter path?
      
      g <- current$G + 1
      
      opened <- subAdjacent(open, adjInOpen, g)
      open <- open[!(open$V %in% opened),]
      
      reopened <- subAdjacent(closed, adjInClosed, g)
      closed <- closed[!(closed$V %in% reopened),]
      
      newV <- c(newVertices, opened, reopened)
      newG <- rep(g, times = length(newV))
      
      open <- data.frame(V = c(open$V, newV), G = c(open$G, newG))
      open <- open[order(open$G),]
      
      closed <- data.frame(V = c(closed$V, current$V), G = c(closed$G, current$G))
    }
  }
  
  return(-1)
}

getAdjacents <- function(gr, v){
 
  return(gr[gr$V1 == v, 'V2'])
}

subAdjacent <- function(generated, adjacents, g){
  
  if(length(adjacents) == 0)
    v <- numeric(0)
  else{
    generated <- generated[generated$V %in% adjacents,]
    v <- generated[generated$G > g,'V']
  }
  
  return(v)
}