followed this tutorial: https://benjjneb.github.io/dada2/tutorial.html

```R 
library(dada2)

path <- setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\PAN\\sequences")
list.files(path)

#separating forward and reverse fastq filenames 
fnFs <- sort(list.files(path, pattern="_F.fastq", full.names = TRUE))
fnRs <- sort(list.files(path, pattern="_R.fastq", full.names = TRUE))

#extract sample names
sample.names <- sub("_F.fastq$", "", basename(fnFs)) 
#basement removes directory and keeps file name since ffns is the full file path
#sub(pattern, replacement, x) --> so removes _F.fastq from name 

#calculating errors 
errF <- learnErrors(fnFs, multithread=TRUE)
errR <- learnErrors(fnRs, multithread=TRUE)

#plotting errors 
plotErrors(errF, nominalQ=TRUE)

#turning in dada class objects 
dadaFs <- dada(fnFs, err=errF, multithread=TRUE)
dadaRs <- dada(fnRs, err=errR, multithread=TRUE)

#checking Dada class object 
dadaFs[[1]]

#merge pair reads 
mergers <- mergePairs(dadaFs, fnFs, dadaRs, fnRs, verbose=TRUE, maxMismatch = 10)

#check merge df from first sample 
head(mergers[[1]])

#if want to see all merges: 
list(mergers)

```


