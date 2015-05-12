#!/usr/bin/Rscript --vanilla --slave --no-site-file

################################################################################################
# WRAPPER FOR tablemerge_script.R (TABLE MERGE)                                                #
#                                                                                              #
# Author: Melanie PETERA                                                                       #
# User: Galaxy                                                                                 #
# Original data: used with tablemerge_script.R                                                 #
# Starting date: 11-05-2015                                                                    #
# V-1: Firt version of wrapper                                                                 #
#                                                                                              #
#                                                                                              #
# Input files: dataMatrix ; Metadata file                                                      #
# Output files: dataMatrix ; Metadata file                                                     #
#                                                                                              #
################################################################################################


library(batch) #necessary for parseCommandArgs function
args = parseCommandArgs(evaluate=FALSE) #interpretation of arguments given in command line as an R list of objects

source_local <- function(...){
	argv <- commandArgs(trailingOnly = FALSE)
	base_dir <- dirname(substring(argv[grep("--file=", argv)], 8))
	for(i in 1:length(list(...))){source(paste(base_dir, list(...)[[i]], sep="/"))}
}
#Import the different functions
source_local("tablemerge_script.R","RcheckLibrary.R","miniTools.R")


if(length(args) < 4){ stop("NOT enough argument !!!") }


tab.merge(args$dataMatrix_in, args$Metadata_in, args$metatype, args$combined_out)


#delete the parameters to avoid the passage to the next tool in .RData image
rm(args)
