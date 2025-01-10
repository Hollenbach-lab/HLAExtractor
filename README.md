# HLAExtractor

Step 1: Pull Singularity container
```
singularity pull ping.sif library://rsuseno/rsuseno/ping:latest
```

Step 2: Edit the variable `rawFastqDirectory` and `resultsDirectory` in the HLA_extract_run.R file accordingly

Step 3: Run the R script through Singularity
```
singularity exec --bind <your_fastq_location> Rscript HLA_extract_run.R
```
