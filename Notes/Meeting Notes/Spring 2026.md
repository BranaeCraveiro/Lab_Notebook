compare percent idenitity between old and new sequences 
its2 maybe same 
accept award 
send thank you email 

# 1/23/2026 w/ Sarah 
## Next Steps
- clean and seqeunce rest of bands from [2026-01-15](../../PAN_BDT/psbA/CNAT/2026-01-15.md) and if gel only shows one band sequence those samples 
- in the future use nanodrop instead of qubit for measuring concentration 
## Storing Raw Sequence Files 
- in the raw squences file in unity, create a sanger sequencing folder and add all three file types 
	- ask Caroline for help 
## Just something that made me feel better about my gels: 
cunning et al. 2024 found CNAT has the most variable dom symbiont type out of the ones they sampled (OANN, MCAV, OFAV, OFRA, PFUR, DLAB, CNAT, SSID, PSTR) at St. John, U.S. Virgin Islands) which maybe explains why my samples are all so funky 
## Food for thought 
- look into finding a primer that differientially perfers clade A 
- maybe extract a coral sample that is confirmed to be a certain clade in Panama and see if we get similar results with my primers 
# 1/16/2026 w/ Sarah & Caroline 
## To Do 
- finish Goldwater application 
- run PCR on fewer cycles
- sample 4 from [2026-01-15](../../PAN_BDT/psbA/CNAT/2026-01-15.md) band is clear enough to do a bead extraction on 
- read papers to figure out clade A primers 
## Things I did: 
- created a naming file loop!
- also followed a dada2 tutorial from their manual to create a pipeline to quickly merge pair my sequences when they come in super excited 
- now just trying to figure out PCR 
## Questions 
- What should I apply for to fund my summer labor? should I do KSC or maloney? 
	- Apply to both 
- I wonder if I should looking into if there is Clade A primers opposed to Clade D/B and if that will make my bands clear 
	- could be; read some papers to find Clade A primers 
- since I am trimming manually do I need to do trimming and filters like you would do for ngs?; nope trimming is my quality control step
# 1/9/2026 w/ Sarah & Caroline 

## To Do 
### PAN samples
- pick 10 samples and perform a pcr at 53.6 °C w/ 4 uL DNA load
- do bead cleanup then send out samples for sequencing
- mergepair forward and reverse reads then BLAST to see if we get similar results to previous seq ids. 
### Organizational 
- ask Caroline how she names/organizes sequence files on her local computer
- create loop to name downloads
## Updates: 
- filled out IDP for Spring 
- fixed code somewhat- I just started fresh again but I feel like I understand my code better now that I had more time to sit and do it without the stress of classes
- looked into Caleb's, Thornhill, and LaJeunesse psbA papers to find out anything else about symbiont identification w/ psbA
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
- already started drafting an email to Caleb regarding what the best course of action is to take if I want to just used psbA and not ITS2

 ### consensus sequences 
 - I re-blasted the orginal read and they all came back as symbiodinium
 ##### 700 bp consensus (281 bp)
 - used biostrings pairwise alignment following overlap model (end of first read is beginning of second read); forward read entire lined up with reverse with a couple of unique bases to make a tail on reverse 
 - top matches are symbiodinium and cladocopium
##### 1500 merge 
- my last consensus it came back as cladocopium as the top hits 
- but then I noticed the counts were kinda funny 
	- used pairwise alignment; global, local, and overlap had very low overlap regions (1-10 nucleotides), decided to simply concatenate the forward and reverse read with a couple of "NNN" between to represent unknown region  
- top matches are symbiodinium and cladocopium (same hits as 700 bp)
#### EXCITING NEWS 
- 700 bp consensus seq aligns inside the 1500 bp sequence w/ 95% identity 
	- the 700 consensus is 285 bp total -- they share ~260 bp at ~95% identity
I feel this is pretty good grounds to assume that they are the same sequence 
### Read symbiont diversity review paper (2023)
*Building consensus around the assessment and interpretation of Symbiodiniaceae diversity* https://doi.org/10.7717/peerj.15023  
this was in the zotero but I guess I never saw it until now lol
workshop w/ 61 scientists from 12 countries considered experts on symbionts 
#### Guidance for Community-Level Assessment of Symbiodiniaceae
- during the workshop it was noted that ITS2 is used the most but that is due to the fact the most experts were very familar with it opposed to other markers 
- "There is a lack of consensus regarding best practices for interpreting Symbiodiniaceae gene amplicon data to identify species, and for applying and interpreting community diversity metrics." - this quote just made me feel better about my struggle finding was to id symbionts 
- did not find anything to help with idenitfying psbA sequences
### MgCl PCR optimization 
https://www.neb.com/en-us/protocols/pcr-using-hot-start-taq-dna-polymerase-m0495
- optimize in 0.5 or 1.0 mM increments- do a gradient? 
	- the next question becomes do I go with higher dna load for 700 bp band or lower for 1500 bp band 
	- if specificity becomes an issue consider increase annealing temperature 
		- +0.5–1.0 mM Mg²⁺ --> increase annealing temp by **+1–2°C**
## Goldwater Questions:
- for goldwater I need to specify which area I would like my reviewer to be from (Life Sciences areas of specialization), what one is best? -- go to website and show her the list 
- talk about what projects I should include 
	- does health status assessments counts? 
	- photoquadrants? 
	- obviously my current big project is the main one 