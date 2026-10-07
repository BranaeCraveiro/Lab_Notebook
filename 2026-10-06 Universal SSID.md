| PCR TubeNum | Colony | Tubelabel_species          | Health_Status | Raw_ng_ul |
| ----------- | ------ | -------------------------- | ------------- | --------- |
| 1           | 1_10   | 072024_PAN_BDT_T1_580_SSID | Healhty       | 1.99      |
| 2           | 1_7    | 072024_PAN_BDT_T1_558_SSID | Healthy       | 11.7      |
| 3           | 1_7    | 072024_PAN_BDT_T1_559_SSID | CLP           | 25.2      |
| 4           | 2_55   | 072024_PAN_BDT_T2_627_SSID | CLP           | 21.2      |
| 5           | 2_55   | 072024_PAN_BDT_T2_630_SSID | Healthy       | 29.4      |
| 6           | 2_59   | 072024_PAN_BDT_T2_611_SSID | Healthy       | 11.6      |
| 7           | 3_81   | 072024_PAN_BDT_T3_701_SSID | Healthy       | 32        |
| 8           | 1_18   | 92022_PAN_BDT_T1_41_SSID   | Healthy       | 5.16      |
| 9           | 2_55   | 92022_PAN_BDT_T2_15_SSID   | Healthy       | 5.26      |
| 10          | 1_7    | 92022_PAN_BDT_T1_48_SSID   | Healthy       | 7.16      |
| 11          | 2_59   | 92022_PAN_BDT_T2_23_SSID   | Healthy       | 11.9      |
| 12          | 3_81   | 92022_PAN_BDT_T3_27_SSID   | Healthy       | 36.2      |
| 13          | 1_10   | 102023_PAN_BDT_T1_148_SSID | CLP           | 32.6      |
| 14          | 1_18   | 102023_PAN_BDT_T1_109_SSID | CLP           | 12.6      |
| 15          | 1_7    | 102023_PAN_BDT_T1_132_SSID | CLP           | 63.4      |
| 16          | 2_55   | 102023_PAN_BDT_T2_219_SSID | CLB           | 61.6      |
| 17          | 2_59   | 102023_PAN_BDT_T2_188_SSID | CLB           | 30.6      |
| 18          | 3_81   | 102023_PAN_BDT_T3_288_SSID | CLB           | 82        |
| 19          | -      | Negative                   | -             | -         |
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
| Buffer          | 2.5                   | 52.25                       |
| dNTP (10mM)     | 0.5                   | 10.45                       |
| F Primer (10uM) | 1                     | 20.9                        |
| R Primer (10uM) | 1                     | 20.9                        |
| DNA             | 1                     | 20.9                        |
| Polymerase      | 0.125                 | 2.6125                      |
| Water           | 18.75                 | 391.875                     |
| Albumin         | 0.125                 | 2.6125                      |
| Total           | 25                    | 522.5                       |

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
    4. 68°C for 1.5 minute _repeat 2-4 for 35 cycles
    5. 68°C for 5 minutes
    6. 8°C for Forever