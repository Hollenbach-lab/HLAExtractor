# setwd('/home/rsuseno/HLAExtractor') 

# ---- DEPENDENCIES ----
' if any dependencies are missing, install with
install.packages("plotly",dependencies = T)
'
library(data.table)
library(stringr)
library(methods)
library(pryr)
library(plotly)
library(R.utils)
library(gtools)
library(argparser)


# ARGPARSER setup
p <- arg_parser("Run HLAExtractor")
p <- add_argument(p, "--fqDirectory", help='The path to the directory holding your fastq dataThe path to the directory holding your fastq data')
p <- add_argument(p, "--fastqPattern", help='A string that is shared across all of your fastq file names (used to find fq files and match pairs), this is usually fq or fastq', default = 'fastq')
p <- add_argument(p, "--threads", help='Number of threads to use during bowtie2 alignments', default = 4)
p <- add_argument(p, "--resultsDirectory", help='The path to your desired output directory')
argv <- parse_args(p)

# Initialization variables ------------------------------------------------
rawFastqDirectory <- argv$fqDirectory  # can be set to raw sequence or extractedFastq directory
fastqPattern <- argv$fastqPattern # use '_KIR_' to find already extracted files, otherwise use 'fastq' or whatever fits your data
threads <- argv$threads
resultsDirectory <- argv$resultsDirectory # Set the master results directory (all pipeline output will be recorded here)
shortNameDelim <- '' # can set a delimiter to shorten sample ID's (ID will be characters before delim)
minDP <- 10

source('Resources/general_functions.R') # do not change
source('Resources/extractor_functions.R') # do not change


# Preparation -------------------------------------------------------------
# Build up a list of sample objects
sampleList <- general.paired_sample_objects(rawFastqDirectory, fastqPattern, resultsDirectory, shortNameDelim) # no need to change


# PING2 extractor ---------------------------------------------------------
cat('\n\n----- Moving to HLA extraction -----')
# Define the extracted fastq directory
extractedFastqDirectory <- file.path(resultsDirectory,'extractedFastq')
# Run PING2 extractor
sampleList <- extractor.run(sampleList,threads,extractedFastqDirectory,forceRun=T) # set forceRun=T if you want to force alignments

