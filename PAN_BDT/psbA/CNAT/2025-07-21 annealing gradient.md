**Row 1**: 92022_PAN_BDT_T3_39_CNAT (14.2 ng/μL)
**Row 2:** 92022_PAN_BDT_T2_55_CNAT (9.56 ng/μL)

![](CNAT%20psbA%20Gel%20Images/July21_2025_Gel.png)

*Notes: need to troubleshoot to determine what went wrong with my PCR, could be primer, reagents, sample, or temperature issue.* 

*7/24/2025 note: looked at primer tubes and noticed Rev_1 primer is significantly lower than For_1 primer; I believe I must of added the reverse primer twice while making the master mix hence why the PCR had no results

### Next steps 
*notes from [Summer 2025](../../../Notes/Meeting%20Notes/Summer%202025.md) meeting notes under "7/22/2025 w/ Brooke, Caroline, & Sarah"*
- use Caroline reagents & my samples to test whether primers are working [[2025-07-23 troubleshooting]]
- if that doesnt work then test if my samples are working, use Caroline's reagents and ITS2 primers 
- Sarah suggests making my gradient have a lowest temperature of 55 °C and have it run for 40 cycles since the paper (*Thornhill & Lajuenesse 2011, 10.1371/journal.pone.0029013* ) I got my primers from used that temperature. 

## PCR Set Up 

| Reagent         | Amount per 1 rxn (uL) | MasterMix Amount (uL) + 10% |
| --------------- | --------------------- | --------------------------- |
| Buffer          | 5                     | 88                          |
| dNTP (10mM)     | 0.5                   | 8.8                         |
| F Primer (10uM) | 1                     | 17.6                        |
| R Primer (10uM) | 1                     | 17.6                        |
| DNA             | 1                     | 17.6                        |
| Polymerase      | 0.25                  | 4.4                         |
| Water           | 16                    | 281.6                       |
| Albumin         | 0.25                  | 4.4                         |
| Total           | 25                    | 440                         |
1. Create master mix for each sample
    1. after adding Buffer, dNTP, and Primers vortex master mix
    2. DO NOT vortex polymerase or albumin, pipette up and down to mix. Becareful not to make bubbles
2. Pipette 24uL of master mix into each replicate tube
3. Pipette 1uL of DNA into each replicate tube
    1. use new pipette tip for each replicate
4. briefly centrifuge pcr tubes before thermal cycler
5. run thermocycler program:
    1. 98°C for 30 sec
    2. 98°C for 10 sec
    3. 70-60°C for 30 sec
    4. 72°C for 20 sec _repeat 2-4 for 30 cycles (# of cycles varies depending on input)_
    5. 72°C for 2 min
    6. 8°C for Forever

## Annealing Temperature Gradient Key 
**A**: 70°C
**B**: 69.3°C
**C**: 68.1°C
**D**: 66.3°C
**E**: 64°C
**F**: 62.3°C
**G**: 61°C
**H**: 60°C

### Sample Location 
Post PCR Fridge in box "PAN_BDT CNAT psbA Troubleshooting Box #1"