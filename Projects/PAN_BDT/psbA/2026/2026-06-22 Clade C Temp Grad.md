
| SampleNum | MonthYear | colony | Tubelabel_species           | Health_Status | Extracted | Raw_ng_ul | Extraction_physical_location | Condition |
| --------- | --------- | ------ | --------------------------- | ------------- | --------- | --------- | ---------------------------- | --------- |
| sample 1  | 072024    | 1_11   | 072024_PAN_BDT_T1_1026_MCAV | Healthy       | 4_17_2026 | 25.8      | UML_PENGUIN_B2               | CLP       |
| sample 2  | 072024    | 1_17   | 072024_PAN_BDT_T1_1020_MCAV | Healthy       | 4_17_2026 | 19.1      | UML_PENGUIN_B2               | Healthy   |
# 6/22/2026 Gel Image 

## Temperature Gradient Details 
used NEB's annealing temp calculator (https://tmcalculator.neb.com/#!/main)

Primer Concentration (nM): 10000

Primer 1 (forward):
27 nt  
44% GC  
Tm: 72°C

Primer 2 (reverse):
28 nt
36% GC
Tm: 65°C

Anneal at: 66 °C 

note: Tm difference is greater than the recommended limit of 5 °C

decided to anneal up 5° from primer 1 temperature and 5° below primer 2 temperature

 # Protocol
 ## I. PCR 
### PCR Preparation 
- thaw reagents & samples 
- UV & label PCR tubes (1 tube per sample)
- check that molecular water is aliquoted 
- include negative control (water) in calculations  
### Create master mix for each sample
copy and paste calculation table here: 

| Reagent         | Amount per 1 rxn (uL) | MasterMix Amount (uL) + 10% |
|-----------------|-----------------------|-----------------------------|
| Buffer          | 2.5                   | 49.5                        |
| dNTP (10mM)     | 0.5                   | 9.9                         |
| F Primer (10uM) | 1                     | 19.8                        |
| R Primer (10uM) | 1                     | 19.8                        |
| DNA             | 2                     | 39.6                        |
| Polymerase      | 0.125                 | 2.475                       |
| Water           | 17.75                 | 351.45                      |
| Albumin         | 0.125                 | 2.475                       |
| Total           | 25                    | 495                         |


1. Add Buffer, dNTP, and Primers vortex to Eppendorf tube. Vortex Briefly  
	*(DO NOT vortex polymerase or albumin)*
2. Add water, pipette up and down to mix.
3. Add polymerase and albumin, pipette mixture up and down to mix
	*albumin is viscous so pipet slowly*
4. Pipette 24µL of master mix into each replicate tube
	*always mix master mix by pipetting up and down before filling each tube*
5. Pipette 1µL of DNA into each tube
6. briefly centrifuge pcr tubes before thermal cycler
7. run thermocycler program: *35 cycles takes ~ 2 hours 21 minutes* 
    1. 95°C for 30 seconds
    2. 95°C for 30 seconds
    3. 45-68°C for 1 minute *(53.6°C optimal for clade D/B primers)*
    4. 68°C for 1.5 minute _repeat 2-4 for 35 cycles
    5. 68°C for 5 minutes
    6. 8°C for Forever

# **ALL POST-PCR DONE IN OTHER ROOM (aka the rest of this protocol)**

## II. Gel electrophoresis 
