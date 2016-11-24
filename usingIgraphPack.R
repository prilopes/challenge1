## Just testing with package igraph

library(igraph)

edgesIGraph <- read.graph("edges.dat")

dfCloseness <- data.frame(Vertex = as.vector(V(edgesIGraph))-1, Closeness = closeness(edgesIGraph))

rankCloseness <- rank(dfCloseness[,2])

dfCloseness <- cbind(dfCloseness, rank = rankCloseness)

dfCloseness <- dfCloseness[order(dfCloseness[,'rank']),]

dfCloseness