# HLAExtractor

Step 1: Pull Singularity container
```
singularity pull ping.sif library://rsuseno/rsuseno/ping:latest
```

Step 2: Edit the following lines in the HLA_extract_run.R file:
- The very first line, change the content inside `setwd()` to the absolute path pointing to the HLAExtractor folder
- Update `rawFastqDirectory` variable to the absolute path of the FASTQ you want to extract
- Update `resultsDirectory` variable to the absolute path of the extraction result

Step 3: Run the R script through Singularity
```
singularity exec --bind <your_fastq_location> Rscript HLA_extract_run.R
```
