
| PCR_tube | Colony | Tubelabel_species           | Health_Status | Raw_ng_ul |
| -------- | ------ | --------------------------- | ------------- | --------- |
| 1        | 1_5    | 072024_PAN_BDT_T1_598_CNAT  | CLP           | 33.2      |
| 2        | 1_6    | 072024_PAN_BDT_T1_601_CNAT  | Healthy       | 0.794     |
| 3        | 1_6    | 072024_PAN_BDT_T1_603_CNAT  | CLP           | 7.58      |
| 4        | 1_16   | 92022_PAN_BDT_T1_12_CNAT    | Healthy       | 30.4      |
| 5        | 2_33   | 072024_PAN_BDT_T2_1053_CNAT | Healthy       | 40.6      |
| 6        | 2_44   | 072024_PAN_BDT_T2_656_CNAT  | CLP           | 58        |
| 7        | 2_44   | 072024_PAN_BDT_T2_658_CNAT  | Healthy       | 29.8      |
| 8        | 4_12   | 072024_PAN_BDT_T4_838_CNAT  | Healthy       | 44.8      |
| 9        | 4_2    | 072024_PAN_BDT_T4_806_CNAT  | Healthy       | 31.2      |
| 10       | 4_3    | 072024_PAN_BDT_T4_808_CNAT  | Healthy       | 16.3      |
| 11       | 2_57   | 072024_PAN_BDT_T2_1059_CNAT | CLP           | 19.1      |
| 12       | 2_57   | 072024_PAN_BDT_T2_1064_CNAT | Healthy       | 15.9      |
| 13       | 3_60   | 072024_PAN_BDT_T3_693_CNAT  | Healthy       | 46.4      |
| 14       | 3_60   | 072024_PAN_BDT_T3_696_CNAT  | CLP           | 15.3      |
| 15       | 3_61   | 072024_PAN_BDT_T3_692_CNAT  | Healthy       | 51.6      |
| 16       | 3_74   | 072024_PAN_BDT_T3_723_CNAT  | Healthy       | 4.64      |
| 17       | 3_74   | 072024_PAN_BDT_T3_724_CNAT  | CLP           | 1.81      |
| 18       | 3_76   | 072024_PAN_BDT_T3_726_CNAT  | Healthy       | 2.26      |
| 19       | 3_80   | 072024_PAN_BDT_T3_733_CNAT  | Healthy       | 26.2      |
| 20       | 4_19   | 072024_PAN_BDT_T4_768_CNAT  | Healthy       | 77.4      |
| 21       | 1_2    | 072024_PAN_BDT_T1_606_MCAV  | Healthy       | 46.6      |
| 22       | 2_55   | 92022_PAN_BDT_T2_15_SSID    | Healthy       | 5.26      |
| 23       | 1_7    | 92022_PAN_BDT_T1_48_SSID    | Healthy       | 7.16      |
| 24       | 2_59   | 92022_PAN_BDT_T2_23_SSID    | Healthy       | 11.9      |
| 25       | 3_81   | 92022_PAN_BDT_T3_27_SSID    | Healthy       | 36.2      |
| 26       | 1_10   | 102023_PAN_BDT_T1_148_SSID  | CLP           | 32.6      |
| 27       | 1_18   | 102023_PAN_BDT_T1_109_SSID  | CLP           | 12.6      |
| 28       | 1_7    | 102023_PAN_BDT_T1_132_SSID  | CLP           | 63.4      |
| 29       | 2_55   | 102023_PAN_BDT_T2_219_SSID  | CLB           | 61.6      |
| 30       | 2_59   | 102023_PAN_BDT_T2_188_SSID  | CLB           | 30.6      |
| 31       | 3_81   | 102023_PAN_BDT_T3_288_SSID  | CLB           | 82        |
| 32       | -      | Negative                    | -             | -         |
# 11/10/2026 gel image 
![](2026_11_10_Gel_uni.png)
note: Anthony took photo for me - he has a different phone than me so I think that is what happened to image quality 

# Protocol

## PCR Preparation 
- thaw reagents & samples 
- UV & label PCR tubes (1 tube per sample)
- check that molecular water is aliquoted 
- include negative control (water) in calculations  
## Create master mix for each sample
copy and paste calculation table here: 

| Reagent         | Amount per 1 rxn (uL) | MasterMix Amount (uL) + 10% |
| --------------- | --------------------- | --------------------------- |
| Buffer          | 2.5                   | 88                          |
| dNTP (10mM)     | 0.5                   | 17.6                        |
| F Primer (10uM) | 1                     | 35.2                        |
| R Primer (10uM) | 1                     | 35.2                        |
| DNA             | 1                     | 35.2                        |
| Polymerase      | 0.125                 | 4.4                         |
| Water           | 18.75                 | 660                         |
| Albumin         | 0.125                 | 4.4                         |
| Total           | 25                    | 880                         |

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
