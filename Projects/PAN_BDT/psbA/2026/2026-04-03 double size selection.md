**sample 2:** 072024_PAN_BDT_T2_662_OANN (75.4 ng/μL)
**sample 3:** 072024_PAN_BDT_T4_823_ORBI (15.2 ng/μL)
**sample 5:** 072024_PAN_BDT_T1_739_ORBI (4.10 ng/μL)

experimental setup notes: Tried to seperate top bands and bottom bands from [2026-03-23 PCR (diluted samples)](2026-03-23%20PCR%20(diluted%20samples).md) to sequence each on individually. The L tubes  is from the first round of bead clean up where I attempted to pull all the >1300 bp fragments. The <1300 bands should be in the S tubes.
# 4/14/2026 

![](2026_04_14_Gel.png)

*Notes: I did the ratio math for 24 ul of PCR sample, however when I was doing the bead clean up I pipetted up less than 20 uL and decided to continue doing the bead extraction anyway instead of stopping and redoing my math... will redo bead cleanup double checking my math from now on 

## Next Steps 
- Caroline recommends to just try to reclean sample 3L and 5L 
- sample 2S is ready for sequencing 
- also suggested that if the bands are too close together that a gel extraction might work better 

# Double Band Size Selection 
*goal was to seperate >1300 bp bands and then <1200 bp bands
Large band selection = >1300 bp
Smaller band selection = <1200 bp bands*

Did math using this calculator: https://www.beckman.com/reagents/genomic/cleanup-and-size-selection/size-selection/spriselect-protocol 
using these variables: 
Sample Volume, μL: 24 uL
DNA Size Range, bp: 175–1300   

**KEY PROTOCOL VARIABLES CALCULATED**
Left–Right Side Bead Ratio: 0.9–0.5
SPRIselect Volume 1, μL: 12
SPRIselect Volume 2, μL: 9.6
### Purification 
1. make fresh 80% ethanol in a 50mL tube (label and parafilm when not in use)
2. Determine whether or not a plate transfer is necessary. If the PCR reaction volume multiplied by 2.8 exceeds the volume of the PCR plate, a transfer to larger tubes is required.
3. Gently shake the Clean NGS Mag PCR Clean-up aliquot to resuspend any Magnetic particles that may have settled.
    1. Add CleanNGS Mag PCR Clean-up volume table below:

Large Band Selection:  SPRIselect Volume 1 = Sample Volume × Right Side Bead Ratio

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
| ------------------ | --------------- | ----------------------- | --------------- | ---------------------- |
| 0.5                | 24              | 12                      | 3               | 36                     |

Smaller Band Size Selection: SPRIselect Volume 2 = Sample Volume × (Left Side Bead Ratio - Right Side Bead Ratio)

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
| ------------------ | --------------- | ----------------------- | --------------- | ---------------------- |
| 0.4                | 24              | 9.6                     | 3               | 28.8                   |

**Note:** The volume of CleanNGS Mag PCR Clean-up for a given reaction can be determined from the following equation:  
_(Volume of Mag Beads per reaction) = (Bead Concentration) x (PCR Reaction Volume)_

3. Mix reagent and PCR reaction thoroughly by pipette mixing 5 times.
	 *==reminder that >1300 bp fragments will stick to the beads isolating them from solution, therefore beads in this tube contain the "large band sample==*
4. Incubate the mixed samples for 5 minutes at room temperature for maximum recovery. 
	 *After mixing, the color of the mixture should appear homogenous.*
5. Place the reaction plate onto a 96 well Magnet Plate for 3 minutes or wait until the solution is clear.
	*Wait until the solution is clear before proceeding to the next washing step. Otherwise there may be beads loss.*
6. Transfer the cleared solution from the reaction plate and place into fresh PCR tubes; save these tubes for later.
	*This step must be performed while the reaction plate is placed on the 96 magnetic plate. Avoid disturbing the settled magnetic beads. If beads are drawn into tips, leave behind a few microliters of solution.
	==also fragments <1200 bp are in this solution, this solution will need to be cleaned for leftover primers; this is the "small band sample"==
7. Dispense **180 uL of 80% ethanol** to each well of the reaction plate and incubate for **1 min** at room temperature. 
8. Aspirate out the ethanol and discard. Repeat for a total of two washes. 
	*It is important to perform these steps with the reaction plate on a 96 well Magnetic Plate. Do not disturb the settled Magnetic beads.*
    1. Remove all of the ethanol from the bottom of the well to avoid ethanol carryover. 
	    *Bump pipette tip up to 200 uL, may need to use p20 multichannel*
    2. **NOTE:** *A 5 min air dry at room temperature is recommended for the evaporation of the remaining traces of ethanol.* **Do not overdry the beads** *(the layer of settled beads appears cracked) as this will significantly decrease elution efficiency.*
9. Take off the plate from the Magnetic plate, add 15 uL of elution buffer (Reagent grade water, TRIS-HCl pH 8.0, or TE buffer) to each well of the reaction plate and pipette mix 5 times.
    *mix until homogeneous and there are no beads on tube wall*
10. Incubate at room temperature for 10 minutes.
11. While the large band samples are incubating, begin cleaning the "small band samples" 
12. Mix reagent and PCR reaction thoroughly by pipette mixing 5 times.
	 *==reminder that 175—1300 bp fragments will stick to the beads isolating them from solution, fragments <175 bp float in the solution==*
13. Incubate the mixed samples for 5 minutes at room temperature for maximum recovery. 
	 *After mixing, the color of the mixture should appear homogenous.*
14. Place the reaction plate onto a 96 well Magnet Plate for 3 minutes or wait until the solution is clear.
	*Wait until the solution is clear before proceeding to the next washing step. Otherwise there may be beads loss.*
15. Aspirate the cleared solution from the reaction plate and discard.
	*This step must be performed while the reaction plate is placed on the 96 magnetic plate. Avoid disturbing the settled magnetic beads. If beads are drawn into tips, leave behind a few microliters of solution.
16. Dispense **180 uL of 80% ethanol** to each well of the reaction plate and incubate for **1 min** at room temperature. 
17. Aspirate out the ethanol and discard. Repeat for a total of two washes. 
	*It is important to perform these steps with the reaction plate on a 96 well Magnetic Plate. Do not disturb the settled Magnetic beads.*
    1. Remove all of the ethanol from the bottom of the well to avoid ethanol carryover. 
	    *Bump pipette tip up to 200 uL, may need to use p20 multichannel*
    2. **NOTE:** *A 5 min air dry at room temperature is recommended for the evaporation of the remaining traces of ethanol.* **Do not overdry the beads** *(the layer of settled beads appears cracked) as this will significantly decrease elution efficiency.*
18. Take off the plate from the Magnetic plate, add 15 uL of elution buffer (Reagent grade water, TRIS-HCl pH 8.0, or TE buffer) to each well of the reaction plate and pipette mix 5 times.
    *mix until homogeneous and there are no beads on tube wall*
19. Incubate at room temperature for 10 minutes.
20. Place both large band samples and small band samples on the plate on a magnetic separation device to magnetize the CleanNGS particles. 
21. Incubate at room temperature until the CleanNGS particles are completely cleared from solution.
22. Transfer the cleared supernatant containing purified DNA and/or RNA to a new (RNase-free) 96-well microplate and seal with non-permeable sealing film.
23. Store the plate at 2-8°C if storage is only for a few days. For long-term storage, samples should be kept at -20°C.