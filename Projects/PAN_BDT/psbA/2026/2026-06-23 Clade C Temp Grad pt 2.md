
| Sample_Row | MonthYear | colony | Tubelabel_species           | Health_Status | Extracted | Raw_ng_ul | Extraction_physical_location | Condition |
| ---------- | --------- | ------ | --------------------------- | ------------- | --------- | --------- | ---------------------------- | --------- |
| Top        | 072024    | 1_11   | 072024_PAN_BDT_T1_1026_MCAV | Healthy       | 4_17_2026 | 25.8      | UML_PENGUIN_B2               | CLP       |
| Bottom     | 072024    | 1_17   | 072024_PAN_BDT_T1_1020_MCAV | Healthy       | 4_17_2026 | 19.1      | UML_PENGUIN_B2               | Healthy   |
# 6/24/2026 Gel Image 
![](2026_06_24_Gel.png)
Note: by comparing the temp yesterday also [2026-06-22 Clade C Temp Grad](2026-06-22%20Clade%20C%20Temp%20Grad.md) I think 61  °C is the optimal temp
### Temp Key from Thermocycler
Note: realized after I meant to do 63-53 but did my math in my head wrong oops (sorry)

A: 63 °C
B: 61.4 °C
C: 59 °C
D: 55.5 °C
E: 50.8 °C
F: 47.5 °C
G: 44.8 °C
H: 43 °C

note that tubes in storage are numbered 1-16 not 1A-2H

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
| Buffer          | 2.5                   | 44                          |
| dNTP (10mM)     | 0.5                   | 8.8                         |
| F Primer (10uM) | 1                     | 17.6                        |
| R Primer (10uM) | 1                     | 17.6                        |
| DNA             | 2                     | 35.2                        |
| Polymerase      | 0.125                 | 2.2                         |
| Water           | 17.75                 | 312.4                       |
| Albumin         | 0.125                 | 2.2                         |
| Total           | 25                    | 440                         |


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
