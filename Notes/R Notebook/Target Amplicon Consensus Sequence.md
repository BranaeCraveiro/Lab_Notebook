Both 700 bp & 1500 bp came back as symbiodinium
```r 
library(dada2)

setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\PAN\\sequences")

F700 <- "AT03901552_11.11.2025_T3_36_700bp_F.fastq"
R700 <- "AT03901551_11.11.2025_T3_36_700bp_R.fastq"

error_F700 <- learnErrors(F700)
error_R700 <- learnErrors(R700)

dada_700F <- dada(F700, error_F700)
dada_700R <- dada(R700, error_R700)

merge_700 <- mergePairs(dada_700F, F700 , dada_700R, R700, maxMismatch = 45)
list(merge_700)


F1500 <- "AT03901554_11.11.2025_T3_38_1500bp_F.fastq"
R1500 <- "AT03901553_11.11.2025_T3_38_1500bp_R.fastq"

error_F1500 <- learnErrors(F1500)
error_R1500 <- learnErrors(R1500)

dada_1500F <- dada(F1500, error_F1500)
dada_1500R <- dada(R1500, error_R1500)

merge_1500 <- mergePairs(dada_1500F, F1500 , dada_1500R, R1500, maxMismatch = 8)
list(merge_1500)

```
