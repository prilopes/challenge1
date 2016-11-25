# challenge1

## Outline:
- Function `rankCloseness` returns a vector with ranking values for vertices in a graph. The vertices are the names for each element of the vector;
- `rankCloseness` calls function `closeness`, which evaluates closeness value for each vertex in the graph, as shown [here](https://en.wikipedia.org/wiki/Centrality#Closeness_centrality);
- Calculating closeness requires the distance *from-to* all vertices, a distance matrix, provided by function `distances`;
- Function `distances` calls `shortestPath` to evaluate the path between two vertices;

    > **NOTE:** The distance matrix returned is NOT symmetric, because it is assumed that parameter is a **directed** graph.

- The `shortestPath` function considers that the graph is **directed** and performs an informed search algorithm to find the shortest path between two vertices.

***

## Building and Running:
- The code is `R`; 
- File `rankCloseness.R` must be sourced so `rankCloseness` function is available;
- `rankCloseness` takes a `data.frame` object as parameter, where each row represents an edge for the graph.

***
    `source("rankCloseness.R")`
    
    `myGraph <- read.table("myEdgesFile")`
    
    `rankCloseness(myGraph)`
***

> An example run code is also provided in file `rankEdgesFile.R`.
