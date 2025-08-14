setwd('/home/rsuseno/HLAExtractor') 

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


# Initialization variables ------------------------------------------------
rawFastqDirectory <- '/home/rsuseno/KKJH20/zamvil_samples/'  # can be set to raw sequence or extractedFastq directory
fastqPattern <- 'fastq' # use '_KIR_' to find already extracted files, otherwise use 'fastq' or whatever fits your data
threads <- 10
resultsDirectory <- '/home/rsuseno/HLAExtractor/Results/KKJH20_Zamvil' # Set the master results directory (all pipeline output will be recorded here)
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

