# 1/9/2026 w/ Sarah & Caroline 
## Things I did 
- filled out IDP for Spring 
- fixed code somewhat- I just started fresh again but I feel like I understand my code better now that I had more time to sit and do it without the stress of classes
### Caleb's Papers 
3 where psbA was used 
##### 2023: 
*Formal recognition of host-generalist species of dinoflagellate (Cladocopium, Symbiodiniaceae) mutualistic with Indo-Pacific reef corals* https://doi.org/10.1111/jpy.13340 
- used ITS2 DGGE profiling to idenitfy symbionts then used psbA for fine scale resolution within clades 
##### 2024: 
*The diversity, distribution, and temporal stability of coral ‘zooxanthellae’ on a pacific reef: from the scale of individual colonies to across the host community* https://doi.org/10.1007/s00338-024-02503-x  
- also used DGGE and ITS2 to id symbionts; used psbA to verify individual phenotypes

*Climate adaptive loci revealed by seascape genomics correlate with phenotypic variation in heat tolerance of the coral Acropora millepora* https://doi.org/10.1038/s41598-024-67971-1 
- ITS2 used for broad phylogenetic application; used psbA to assess relatedness among linages 
	- used symportal for ITS2
	- used ASVs from psbA then ran them through NCBI Nucleotide database 
#### Next Steps
- already drafted an email to Caleb regarding what the best course of action is to take if I want to just used psbA and not ITS2
- 
 ### consensus sequences 
 700 bp consensus (281 bp)
 - used biostrings pairwise alignment following overlap model (end of first read is beginning of second read); forward read entire lined up with reverse with a couple of unique bases to make a tail on reverse 
 - top matches are symbiodinium and cladocopium
1500 merge 
- also used pairwise alignment; global, local, and overlap had very low overlap regions (10 to single digits), decided to simply concatenate the forward and reverse read with a couple of "NNN" between to represent unknown region  
- top matches are symbiodinium and cladocopium (same hits as 700 bp)
#### Thoughts
I think it is strange how individually the 1500 reads top hits were cladocopium w/ 100% identity and now its symbiodinium when combined; do you think there is just more symbiodinium reference in BLAST? 

## questions for sarah when I get back:
- for goldwater I need to specify which area I would like my reviewer to be from (Life Sciences areas of specialization), what one is best? -- go to website and show her the list 
- talk about what projects I should include 
	- does health status assessments counts? 
	- photoquadrants? 
	- obviously my current big project is the main one 