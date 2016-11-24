library(testthat)

source('shortestPath.R')
source('closeness.R')

test_dir(paste(getwd(),'tests', sep = "/"), reporter = 'Summary')