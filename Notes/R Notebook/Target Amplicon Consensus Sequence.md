notes to self:  
	pariwise alignment models:
		**local**: finds the single best matching region anywhere in the two sequences.
		**global**: tries to align the entire forward sequence to the entire reverse complement sequence from start to finish
		**overlap**: tries to match the end of one read with the start of the other, assuming one read overlaps the other at the end.

```r 
library(Biostrings)
library(pwalign)

#paste in raw sequences 

raw_seq_700F <-""
raw_seq_700R <- ""
raw_seq_1500F <-""
raw_seq_1500R <- ""

#700 bp band: 

#clean sequences
clean_seq_700F <- toupper(gsub("[^ACGTN]", "" , raw_seq_700F))
clean_seq_700R <- toupper(gsub("[^ACGTN]", "" , raw_seq_700R))

#reverse complement
rev_comp_700R <- as.character(reverseComplement(DNAString(clean_seq_700R)))

#note for self: overlap alignment keeps tails in the alignment; the consensus
#code is what converts that alignment into a single sequence I can BLAST

#alignment
align_700 <- pairwiseAlignment(
  DNAString(clean_seq_700F),
  DNAString(rev_comp_700R),
  type = "overlap")    #the end of one read is the beginning of the second read


#aligned strings (same length, include gaps)
align700F <- as.character(pattern(align_700))
align700R <- as.character(subject(align_700))

# build consensus to include tails
final_seq_700 <- paste0(
  mapply(function(f, r) {
    if (f == "-") r        #if forward has no base pick reverse 
    else if (r == "-") f   #if reverse has no base pick forward
    else if (f == r) f     #if forward equal reverse pick forward
    else "N"               #if forward doesn't match reverse put "N" 
  },
  #turning each read into vector to compare base by base 
  strsplit(align700F, "")[[1]],   
  strsplit(align700R, "")[[1]]),
  collapse = "")   #collasping vector back into character string

#remove gaps
final_seq_700 <- gsub("-", "", final_seq_700) #removing "-" placeholders from alignment

#printing in console
cat(final_seq_700,"\n")

#count checks
nchar(clean_seq_700F)
nchar(clean_seq_700R)
nchar(final_seq_700)

#results show that almost the entire forward read overlaps the reverse read
#and the reverse read has only small unique tails


#1500 bp band: 

#clean sequences
clean_seq_1500F <- toupper(gsub("[^ACGTN]", "" , raw_seq_1500F))
clean_seq_1500R <- toupper(gsub("[^ACGTN]", "" , raw_seq_1500R))

#reverse complement
rev_comp_1500R <- as.character(reverseComplement(DNAString(clean_seq_1500R)))

#note for self: overlap alignment keeps tails in the alignment; the consensus
#code is what converts that alignment into a single sequence I can BLAST

#alignment
align_1500 <- pairwiseAlignment(
  DNAString(clean_seq_1500F),
  DNAString(rev_comp_1500R),
  type = "overlap")    #the end of one read is the beginning of the second read

#aligned strings (same length, include gaps)
align1500F <- as.character(pattern(align_1500))
align1500R <- as.character(subject(align_1500))

# build consensus to include tails
final_seq_1500 <- paste0(
  mapply(function(f, r) {
    if (f == "-") r        #if forward has no base pick reverse 
    else if (r == "-") f   #if reverse has no base pick forward
    else if (f == r) f     #if forward equal reverse pick forward
    else "N"               #if forward doesn't match reverse put "N" 
  },
  strsplit(align1500F, "")[[1]],    #turning each read into vector to compare base by base 
  strsplit(align1500R, "")[[1]]),
  collapse = "")   #collasping vector back into character string

#remove gaps
final_seq_1500 <- gsub("-", "", final_seq_1500) #removing "-" placeholders from alignment

#count checks
nchar(clean_seq_1500F)
nchar(clean_seq_1500R)
nchar(final_seq_1500)

#overlap is literally 1 bp its not worth it to make a consensus so I am just going 
#to concatenate the forward and reverse reads together 



#concatenate forward + reverse complement
#adding few "N"s in the middle to represent uncertain region
merged_seq_1500 <- paste0(clean_seq_1500F, "NNN", rev_comp_1500R)

#printing in console 
cat(merged_seq_1500,"\n")

#checking length
nchar(clean_seq_1500F)
nchar(clean_seq_1500R)
nchar(merged_seq_1500)



#percent identity test between 700 and 1500 

#pairwise alignment (global makes sense to compare entire sequences)
align_test <- pairwiseAlignment(final_seq_700, merged_seq_1500, type = "local")

#percent identity
percent_identity <- pid(align_test)   #gives % of matching bases
cat(percent_identity, "%\n")

#checking length of the alignment (note: includes gaps if any)
nchar(pattern(align_test))
cat(nchar(subject(align_test)), "\n")

# 1500 and 700 are largely the same?? wondering if it is because its the same gene  
# region so the gene sequence was just conserved between clades 


```

