library(testthat)

debugSource('shortestPath.R')

test_dir(paste(getwd(),'tests', sep = "/"), reporter = 'Summary')