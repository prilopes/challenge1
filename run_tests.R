library(testthat)

source('shortestPath.R')
source('rankCloseness.R')

test_dir(paste(getwd(),'tests', sep = "/"), reporter = 'Summary')