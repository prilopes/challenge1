source("rankCloseness.R")

edges <- read.table("edges.dat")

ranking <- rankCloseness(edges)

write.table(ranking,"rankedEdges.dat")