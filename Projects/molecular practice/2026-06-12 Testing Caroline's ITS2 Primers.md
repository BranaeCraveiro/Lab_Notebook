 Sanity check: Dr. Lee noted that maybe the issue is that I am bad at PCR's so I am doing 3 samples with Caroline's primers to see if I get the same results that Caroline does

| Tubelabel_species          | Health_Status | Extracted | Raw_ng_ul | Extraction_physical_location | MonthYear | colony | Caroline_ITS2 |
| -------------------------- | ------------- | --------- | --------- | ---------------------------- | --------- | ------ | ------------- |
| 072024_PAN_BDT_T2_612_CNAT | CLP           | 7_7_2025  | 28.8      | UML_PENGUIN_B1               | 072024    | 2_39   | x             |
| 102023_PAN_BDT_T1_90_CNAT  | CLP           | 7_7_2025  | 29        | UML_PENGUIN_B1               | 102023    | 1_26   | x             |
| 102023_PAN_BDT_T3_335_CNAT | CLP           | 7_7_2025  | 71.8      | UML_PENGUIN_B1               | 102023    | 3_75   | x             |

# 6/12/2026 Gel
![[2026_06_12_Gel.png]] 
# ITS2 part 1 Protocol
**NOTE**: adapted from: [SOP_MDE_Metabarcoding Standard Genetic Methods (November2021).pdf](https://github.com/SERCCoastalDisease/Protocols/blob/main/SOP_MDE_Metabarcoding%20Standard%20Genetic%20Methods%20(November2021).pdf)

**NOTE**: all calculations can be done here: https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=909202954#gid=909202954

last updated Jun 9, 2026 CCD
#### I. PCR
- **Repeat 3x for all samples that are to be included in the metabarcode library**
- *always include water (negative control - indication of no contamination) and very dilute positive controls (1-5ng of DNA) in every experiment*
- **Mix the following agents via vortex:** Buffer, MgCl2, primers
- **DO NOT vortex:** BSA or Hot Start Polymerase
	-  Polymerase should *never* be left at room temperature - **stays in freezer or in freezer box**
- use aliquoted reagents (limits contamination)
- **all PCR prep is done in the biosafety cabinet in the lab***

copy & paste table off of mm_calculations, note which primer you are using each day (0N,1N...)

| Reagent         | Amount per 1 rxn (uL) | MasterMix Amount (uL) + 5% | Triplicate (uL) + 5% |
| --------------- | --------------------- | -------------------------- | -------------------- |
| Buffer          | 5                     | 15.75                      | 47.25                |
| dNTP (10mM)     | 0.5                   | 1.575                      | 4.725                |
| F Primer (10uM) | 1                     | 3.15                       | 9.45                 |
| R Primer (10uM) | 1                     | 3.15                       | 9.45                 |
| DNA             | 1                     | 3.15                       | 9.45                 |
| Polymerase      | 0.25                  | 0.7875                     | 2.3625               |
| Water           | 16                    | 50.4                       | 151.2                |
| Albumin         | 0.25                  | 0.7875                     | 2.3625               |
| Total           | 25                    | 78.75                      | 236.25               |
1. Create master mix for each sample
	1. after adding Buffer, dNTP, and Primers vortex master mix
	2. Pipette up and down to mix after adding polymerase and albumin, DO NOT vortex 
2. Pipette 24uL of master mix into each replicate tube (3 replicates per sample)
3. Pipette 1uL of DNA into each replicate tube
	1. use new pipette tip for each replicate
4. briefly centrifuge pcr tubes before thermocycler
5. run thermocycler program:
	1. 98 for 30 sec
	2. **98 for 10 sec**
	3. **69 for 30 sec**
	4. **72 for 20 sec** 
	*repeat 2-4 for 28 cycles (# of cycles varies depending on input)*
	5. 72 for 2 min
	6. 8 for Forever
	

### **ALL POST-PCR DONE IN OTHER ROOM (aka the rest of this protocol)**

#### II. Gel electrophoresis
- **always use standard DNA ladder on every row of gel**, can dilute ladder to 1:5 in order to see relatively brighter bands

- TBE Buffer 'Recipe' https://github.com/jgmcdonough/GW-lab-notebook/blob/main/Protocols/TBE%20Buffer%20Protocol.md

**Making and setting up a gel:**
1. mix agar and clean TBE buffer to generate a 1.5% agarose gel that will be large enough for the gel mold
2. calculating gel density:
	- % = weight (g) / volume (mL)
3. melt mixture (on hot plate with stir bar or microwave) until mixture has big bubbles and there's no floaters
	-  **add GelRed to gel once cool** (if you don't, you won't see your bands!!)
	- do not pour into gel rig until flask is cool to touch
4. Add gel comb for number of samples you need
	- pour gel into the middle of mold and wait for even dispersion
	- enough gel to see that the wells are in it, not too thick
5. let gel cool - wells will break if not cooled down enough
	- 20 mins to be safe
	- during this time set up for loading gel (step 6)
6. Sample Prep
	- cut enough parafilm for all samples + ladders
	- pipette up 20uL of loading dye and place 1-2ul dots of loading dye on the parafilm for each well
7. **turn rig so DNA will move towards the positive electrode** run towards red!
8. load 2-3uL of DNA ladder (can make 1:5 dilution with molecular water) at beginning or end (or both if large rig) of the gel, and on each row
9. load 1uL PCR product 
10. put cover on and turn on electric current - **run 110 volts for ~35 mins**
	- check to make sure bands aren't running off the gel
	- time length depends on the size of gel 30-50 mins 
11. turn off electric current *then* remove lid
12. take picture of gel and save in lab notebook
	- *do not look at the blue-green light directly*
	- place box with an amber pane over gel imager and take photo parallel to gel. 
	- editing: crop to be centered, ensure photo is in focus
13. Some gels may require longer run time to get more separation in bands 
14. you may reuse gels up to 3 times, if so break the gel up into a glass container that can be covered and store at 2-8 °C
