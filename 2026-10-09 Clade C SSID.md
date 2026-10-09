| PCR Tube_num | Colony | Tubelabel_species          | Health_Status | Raw_ng_ul |
| ------------ | ------ | -------------------------- | ------------- | --------- |
| 1            | 1_7    | 072024_PAN_BDT_T1_559_SSID | CLP           | 25.2      |
| 2            | 2_59   | 072024_PAN_BDT_T2_611_SSID | Healthy       | 11.6      |
| 3            | 1_10   | 92022_PAN_BDT_T1_51_SSID   | Healthy       | 2.62      |
| 4            | 1_18   | 92022_PAN_BDT_T1_41_SSID   | Healthy       | 5.16      |
| 5            | 1_7    | 92022_PAN_BDT_T1_48_SSID   | Healthy       | 7.16      |
| 6            | 3_81   | 92022_PAN_BDT_T3_27_SSID   | Healthy       | 36.2      |
| 7            | 1_10   | 102023_PAN_BDT_T1_148_SSID | CLP           | 32.6      |
| 8            | 1_18   | 102023_PAN_BDT_T1_109_SSID | CLP           | 12.6      |
| 9            | 1_7    | 102023_PAN_BDT_T1_132_SSID | CLP           | 63.4      |
| 10           | 2_55   | 102023_PAN_BDT_T2_219_SSID | CLB           | 61.6      |
| 11           | 2_59   | 102023_PAN_BDT_T2_188_SSID | CLB           | 30.6      |
| 12           | 3_81   | 102023_PAN_BDT_T3_288_SSID | CLB           | 82        |
| 13           | -      | Negative                   | -             | -         |

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
| Buffer          | 2.5                   | 35.75                       |
| dNTP (10mM)     | 0.5                   | 7.15                        |
| F Primer (10uM) | 1                     | 14.3                        |
| R Primer (10uM) | 1                     | 14.3                        |
| DNA             | 1                     | 14.3                        |
| Polymerase      | 0.125                 | 1.7875                      |
| Water           | 18.75                 | 268.125                     |
| Albumin         | 0.125                 | 1.7875                      |
| Total           | 25                    | 357.5                       |

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
    4. 63°C for 1.5 minute _repeat 2-4 for 35 cycles
    5. 68°C for 5 minutes
    6. 8°C for Forever