# HLAExtractor

Step 1: Get HLAExtractor code from Github (only need to run once)
```
git clone https://github.com/Hollenbach-lab/HLAExtractor.git
```

Step 2: Pull Singularity container (only need to run once)
```
singularity pull ping.sif library://rsuseno/rsuseno/ping:latest
```

Step 3: Open a `screen` session
```
screen -S yourScreenName
```

Step 4: Run the R script through Singularity
```
singularity exec ping.sif Rscript HLA_extract_run.R
    --fqDirectory <fastq_location>
    --resultsDirectory <output_location>
    --fastqPattern <fastq_pattern> 
    --threads <number_of_threads>
```

Step 5: Detach from `screen` session by pressing control+A+D

Step 6: Check the status of your run by reconnecting to your `screen` session
```
screen -r yourScreenName
```

Step 7: 

If your run has finished, it should say 

`PING2_extractor is complete. Extracted reads are deposited in ...` 

Then you can just type `exit` on the terminal, press enter, and you're good to go.

If your run is still going, do Step 5 again to leave the code running. 

