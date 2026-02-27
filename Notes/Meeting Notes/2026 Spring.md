
# 2/27/2026 w/ Sarah & Caroline 
## Smearing vs. Quality Score 
- Both graphs looked like no relationship HOWEVER the correlation test showed a different story: 
PCR smear: 
- 






# 2/13/2026 w/ Sarah & Caroline 
## Next Steps 
- create a sample tracker datasheet by using code to combine sample 
	- things to include: 
		- tube label 
		- health status 
		- date extracted 
		- raw conc.
		- extraction physical location 
		- date_psba 
		- colony 
		- date sequenced 
- pick out coral to extract (one can I use current primers on)
     - figure out code to make sample tracker 
- quantify smearing on a scale- both pcr and clean gel 
- create plot and correlation test of smearing vs. quality score 
- consider setting up jupyter notebook 
- create repo for project 

## Picking Coral Species for Extraction 
current plan: 

| Species | total | non_healthy | healthy | percent_unhealthy |
| :------ | ----: | ----------: | ------: | ----------------: |
| CNAT    |    71 |          35 |      36 |              49.3 |
| PSTR    |    51 |          25 |      26 |              49.0 |
| SSID    |    63 |          26 |      37 |              41.3 |
| MCAV    |    67 |          21 |      46 |              31.3 |
| ORBI    |    57 |          10 |      47 |              17.5 |
| PAST    |    39 |           5 |      34 |              12.8 |
| MMEA    |    24 |           1 |      23 |               4.2 |

| Species | n_transects |
| :------ | ----------: |
| CNAT    |           4 |
| MCAV    |           4 |
| MMEA    |           2 |
| ORBI    |           4 |
| PAST    |           3 |
| PSTR    |           2 |
| SSID    |           4 |

looking at both % unhealthy and which corals are in all 4 transects leaves us with 4 species 
- CNAT, MCAV, ORBI, SSID
- might do PSTR just becuase up there in the % unhealthy chart 

| Species |   n |
| :------ | --: |
| CNAT    |  74 |
| MCAV    |  69 |
| ORBI    |  58 |
| PSTR    |  62 |
| SSID    |  65 |

| Species | total | non_healthy | healthy | percent_unhealthy |
| :------ | ----: | ----------: | ------: | ----------------: |
| CNAT    |   125 |          40 |      85 |              32.0 |
| PSTR    |    92 |          28 |      64 |              30.4 |
| SSID    |   111 |          27 |      84 |              24.3 |
| MCAV    |   118 |          22 |      96 |              18.6 |
| ORBI    |   100 |           9 |      91 |               9.0 |
|         |       |             |         |                   |

### My findigs based on papers

| Species | Finding 1 | Paper 1             | Notes                       | Finding 2 | Paper 2                | Notes                          | Finding 3 | Paper 3             | Notes                                                      |
| ------- | --------- | ------------------- | --------------------------- | --------- | ---------------------- | ------------------------------ | --------- | ------------------- | ---------------------------------------------------------- |
| MCAV    | Clade C   | Cunning et al. 2024 | Virgin Islands              | Clade C   | Eckert et al. 2020     | Belize                         | Clade C   | Sturm et al. 2020   | Cuba                                                       |
| SSID    | Clade C   | Cunning et al. 2024 | Virgin Islands              | Clade C   | Locatelli & Baums 2025 | Curaçao                        | Clade C   | Davies et al. 2018  | Belize                                                     |
| ORBI    | Clade C   | Cunning et al. 2024 | Virgin Islands; ORBI & OFAV | Clade B   | Kemp et al. 2015; OFAV | Belize; multisample majority B | Clade B/C | Kennedy et al. 2016 | OANN; Clade B in BEL but closer to PAN appearign 50/50 B/C |
| PSTR    | Clade B   | Cunnign et al. 2024 | Virgin Islands              | Clade B   | Lewis et al. 2018      | all over Caribbean             |           |                     |                                                            |
note: having a hard time finding another PSTR paper 
# 2/6/2026 w/ Sarah & Caroline 
## Next Steps 
- create excel sheet with sample information 
- create project repo 
- look at relationship between streaking & quality
- try aligning all the sequences on Blast 
## WDHOF questions 
- no conflict of interest right 

- Taxable Income:  Not applicable: no funds will be directly paid to me? correct? 
## Honors Fellowship Presentation 
our posters at the symposium can work for the presentation, Julian will just swing by 
- prob really helpful for Brandon lowkey 
wanted to ask if that is good with you or if you want us to practice presenting (if so what days would work best for you so you can attend and I can coordinate with Tristin and Brandon) 
### Latest Sequencing Results 
**sample 1:** 92022_PAN_BDT_T1_2_CNAT - have not trimmed yet
**sample 2:** 92022_PAN_BDT_T1_3_CNAT - one read (forgot primer on forward)
**sample 3:** 92022_PAN_BDT_T2_48_CNAT- have not trimmed yet 
**sample 4:** 102023_PAN_BDT_T3_308_CNAT - did not merge 
**sample 5:** 102023_PAN_BDT_T3_310_CNAT - symbiodinium
**sample 6:** 072024_PAN_BDT_T1_592_CNAT - symbiodinium
**sample 7:** 072024_PAN_BDT_T3_692_CNAT - did not merge 
**sample 8:**  072024_PAN_BDT_T1_598_CNAT - symbiodinium
**sample 9:** 072024_PAN_BDT_T3_693_CNAT - did not merge 
#### summary 
- 2 left to trim
- 3 did not merge; 6 did 
- all 6 came back symbiodinium
- prob should try aligning them all to each other maybe? 
#### Notes 
I feel like these quality scores are pretty low compared to my other sequences to the point where the chromatogram was really difficult to interpret 
- usually in the 30-40 range 
- only 6/18 samples 30 of above 
- most samples in 10-20 rnage 
- noticeable decrease in legibility of chromatogram
I wonder if the 700 bp is the band but the 1500 is the band plus non specfic since all my samples are really unclear after ~500/600 bp that is why they keep coming back as non specific 
### Alignment between old 1500 (first batch) and good quality 1500 bp (sample 4) 
- came back as 97% identical despite being two different samples (T3_38 & T3_8) 

# 1/30/2026 w/ Sarah & Caroline 
## To do 
- compare percent idenitity between old and new sequences 
- its2 maybe same results 
- accept WDHOF award 
- send thank you email to WDHOF 
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