*now using NEB Hot Start Taq DNA Polymerase instead of NEB Q5 Hot Start -had to redo anealing gradient to meet new kits specifications. Also upped DNA load to 2 µL per reaction. 

**Row 1:** 92022_PAN_BDT_T3_39_CNAT (14.2 ng/μL)
**Row 2:** 92022_PAN_BDT_T2_55_CNAT (9.56 ng/μL)
*Note: Lane C is a sample from Caroline's pooled 16s samples that she wanted to double check* 

![](CNAT%20psbA%20Gel%20Images/July24_2025_Gel.png)
*Notes:*
- *ideal temperature either 45 or 46°C.* 
- *Band appearing around 300/400 bp might be psbAncr region. However, the paper I got my primers from (Thornhill & LaJeunesse 2011, 10.1371/journal.pone.0029013) indicates the psbA NCR product should be around 500–600 bp.*
- *Not sure what the top band (~1500 bp) is in my samples. It is surprisingly bright across all annealing temperatures.  Not sure what is going on* 
	-  *This band also showed up faintly on the July 23rd gel (([[2025-07-23 troubleshooting]])) but seemed limited to a specific temperature range.* 
- *Used 2 µL of DNA extract and ran 40 cycles, but the bands are still pretty faint. Should I increase DNA load or increase cycles again?*

#### Sarahs Thoughts (from 7/29/2025 [Summer 2025](../../../Notes/Meeting%20Notes/Summer%202025.md))
- recommends add a negative control to future PCRs (will let me know if the bands I am seeing are because of my dna or something else)
- the bright 1500 bp band is non-specific binding 
	- likely caused by how many times I am running my cycle- try decreasing to 38 cycles 
	- also try decreasing extension time (supposed to be 1 min/kb of expected product)
	- think its mainly about the amount of non-target DNA in there, so I should try increasing the amount of DNA you add
## Determining annealing temperature range
https://tmcalculator.neb.com/#!/main 
**Primer 1**
25 nt  
44% GC  
Tm: 57°C

**Primer 2**
22 nt  
45% GC  
Tm: 55°C

**Anneal at** 50 °C

*try annealing gradient between 45°C - 55°C*
## PCR Preparation 

| Reagent         | Amount per 1 rxn (uL) | MasterMix Amount (uL) + 10% |
| --------------- | --------------------- | --------------------------- |
| Buffer          | 2.5                   | 44                          |
| dNTP (10mM)     | 0.5                   | 8.8                         |
| F Primer (10uM) | 1                     | 17.6                        |
| R Primer (10uM) | 1                     | 17.6                        |
| DNA             | 1                     | 17.6                        |
| Polymerase      | 0.125                 | 2.2                         |
| Water           | 18.75                 | 330                         |
| Albumin         | 0.125                 | 2.2                         |
| Total           | 25                    | 440                         |
1. Add Buffer, dNTP, and Primers vortex to eppendorf tube. Vortex Briefly 
*(DO NOT vortex polymerase or albumin)*
2. Add polymerase and albumin. 
*albumin is viscous so pipet slowly*
3. Add water, pipette up and down to mix.
*Be careful not to make bubbles*
4. Pipette 24µL of master mix into each replicate tube
5. Pipette 1µL of DNA into each replicate tube
*use new pipette tip for each replicate*
6. briefly centrifuge pcr tubes before thermal cycler
7. run thermocycler program:
    1. 95°C for 30 seconds
    2. 95°C for 30 seconds
    3. 45-55°C for 1 minute
    4. 68°C for 1 minute _repeat 2-4 for 40 cycles (# of cycles varies depending on input)
    5. 68°C for 5 minutes
    6. 6°C for Forever

## Annealing Temperature Gradient Key 
**A:** 55°C
**B:** 54.3°C
**C:** 53.1°C
**D:** 51.3°C
**E:** 49°C
**F:** 47.3°C
**G:** 45.9°C
**H:** 45°C

### Sample Location 
Post PCR Fridge in box "PAN_BDT CNAT psbA Troubleshooting Box #1"