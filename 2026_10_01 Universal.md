| PCR_Tube_Num | Tubelabel_species           | Health_Status | Raw_ng_ul |
| ------------ | --------------------------- | ------------- | --------- |
| 1            | 072024_PAN_BDT_T1_608_MCAV  | Healthy       | 6.42      |
| 2            | 072024_PAN_BDT_T2_609_MCAV  | CLP           | 92.8      |
| 3            | 072024_PAN_BDT_T3_697_MCAV  | Healthy       | 46.2      |
| 4            | 072024_PAN_BDT_T3_699_MCAV  | CLP           | 29.6      |
| 5            | 072024_PAN_BDT_T1_1026_MCAV | Healthy       | 25.8      |
| 6            | 072024_PAN_BDT_T3_711_MCAV  | CLP           | 8.04      |
| 7            | 92022_PAN_BDT_T2_27_MCAV    | Healthy       | 3.34      |
| 8            | 072024_PAN_BDT_T1_1020_MCAV | Healthy       | 19.1      |
| 9            | 072024_PAN_BDT_T3_709_MCAV  | Healthy       | 36.4      |
| 10           | 92022_PAN_BDT_T3_15_MCAV    | Healthy       | 7.7       |
| 11           | 92022_PAN_BDT_T3_10_MCAV    | Healthy       | 2.92      |
| 12           | 102023_PAN_BDT_T1_151_MCAV  | CLP           | 61.8      |
| 13           | 102023_PAN_BDT_T1_116_MCAV  | CLP           | 25        |
| 14           | 102023_PAN_BDT_T2_179_MCAV  | CLP           | 66.8      |
| 15           | 102023_PAN_BDT_T3_290_MCAV  | CLP           | 33        |
| 16           | 102023_PAN_BDT_T3_299_MCAV  | CLP           | 52.2      |
| 17           | Negative                    |               |           |

# Protocol 
*adapted from NEB's Hot Start _Taq_DNA Polymerase (M0495) https://www.neb.com/en-us/protocols/2012/10/04/pcr-using-hot-start-taq-dna-polymerase-m0495

*use this sheet to determine reagent volumes*
https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=92320545#gid=92320545

last updated: 7/9/2026 BRC
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
| Buffer          | 2.5                   | 46.75                       |
| dNTP (10mM)     | 0.5                   | 9.35                        |
| F Primer (10uM) | 1                     | 18.7                        |
| R Primer (10uM) | 1                     | 18.7                        |
| DNA             | 1                     | 18.7                        |
| Polymerase      | 0.125                 | 2.3375                      |
| Water           | 18.75                 | 350.625                     |
| Albumin         | 0.125                 | 2.3375                      |
| Total           | 25                    | 467.5                       |


1. Add Buffer, dNTP, and Primers vortex to Eppendorf tube. Vortex Briefly  
	*(DO NOT vortex polymerase or albumin)*
2. Add water, pipette up and down to mix.
3. Add polymerase and albumin, pipette mixture up and down to mix
	*polymerase and albumin are viscous and bubbly easily so pipet slowly*
4. Pipette 24µL of master mix into each replicate tube
	*always mix master mix by pipetting up and down before filling each tube as polymerase sinks quickly*
5. Pipette 1µL of DNA into each tube, dial p20 up to 15 µL and pipette up and down to mix
6. briefly centrifuge pcr tubes before thermal cycler 
7. run thermocycler program: *35 cycles takes ~ 2 hours 20 minutes* 
    1. 95°C for 30 seconds
    2. 95°C for 30 seconds
    3. 45-68°C for 1 minute
    4. 70°C for 1.5 minute _repeat 2-4 for 35 cycles
    5. 68°C for 5 minutes
    6. 8°C for Forever
