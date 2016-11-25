source("rankCloseness.R")

edges <- read.table("testEdges.dat")

write.table(rankCloseness(edges),"rankedEdges.dat")