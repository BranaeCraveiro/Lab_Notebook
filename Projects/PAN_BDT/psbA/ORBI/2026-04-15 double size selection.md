*retry of double size selection bead clean up* 
**sample 3:** 072024_PAN_BDT_T4_823_ORBI
**sample 5:** 072024_PAN_BDT_T1_739_ORBI

experimental setup notes: The L tubes is from the first round of bead clean up where I attempted to pull all the >1300 bp fragments. The <1300 bands should be in the S tubes. I also tried three rounds of washing instead of just 2

# 4/15/2026 Gel 
![](ORBI%20psbA%20Gel%20Images/2026_04_15_Gel.png)

# Sending out Samples for Sequencing 

## Nanodrop 
from [2026-04-03 double size selection](2026-04-03%20double%20size%20selection.md)
Sample 2S: 13.0 ng/uL

from [2026-04-15 double size selection](2026-04-15%20double%20size%20selection.md)
Sample 3L: 4.9 ng/uL
Sample 5L: 6.1 ng/uL

### Bar code: AT03901530
**Sample 2S:**   072024_PAN_BDT_T2_662_OANN_psbA_F
	Concentration: 13.0 ng/uL
	V1 = C2(V2)/ C1 = (20)/conc from nanodrop
		need:
		1.54 uL DNA: 
		8.46 uL water + 2.5 uL from primer dilution = 10.96 uL water 
		2.5 uL primer from 10 uM stock
		USED FORWARD PRIMER 

### Bar code: AT03901529
**Sample 2S:**  072024_PAN_BDT_T2_662_OANN_psbA_R
	Concentration: 13.0 ng/uL
	V1 = C2(V2)/ C1 = (20)/conc from nanodrop
		need:
		1.54 uL DNA: 
		8.46 uL water + 2.5 uL from primer dilution = 10.96 uL water 
		2.5 uL primer from 10 uM stock
		USED REVERSE PRIMER 

### Bar code: AT03901528
**Sample 3L:**  072024_PAN_BDT_T4_823_ORBI_psbA_F
	Concentration: 4.9 ng/uL
	V1 = C2(V2)/ C1 = (20)/conc from nanodrop
		need:
		4.08 uL DNA: 
		5.92 uL water + 2.5 from primer dilution = 8.42 uL water 
		2.5 uL primer from 10 uM stock
		USED FORWARD PRIMER 

### Bar code: AT03901527
**Sample 3L:**  072024_PAN_BDT_T4_823_ORBI_psbA_R
	Concentration: 4.9 ng/uL
	V1 = C2(V2)/ C1 = (20)/conc from nanodrop
		need:
		4.08 uL DNA: 
		5.92 uL water + 2.5 from primer dilution = 8.42 uL water 
		2.5 uL primer from 10 uM stock
		USED REVERSE PRIMER 

### Bar code: AT03901526
**Sample 5L:**  072024_PAN_BDT_T1_739_ORBI_psbA_F
	Concentration: 6.1 ng/uL
	V1 = C2(V2)/ C1 = (20)/conc from nanodrop
		need:
		3.28 uL DNA: 
		6.72 uL water + 2.5 from primer dilution = 9.22 uL water 
		2.5 uL primer from 10 uM stock
		USED FORWARD PRIMER 

### Bar code: AT03901525
**Sample 5L:**  072024_PAN_BDT_T1_739_ORBI_psbA_R
	Concentration: 6.1 ng/uL
	V1 = C2(V2)/ C1 = (20)/conc from nanodrop
		need:
		3.28 uL DNA: 
		6.72 uL water + 2.5 from primer dilution = 9.22 uL water 
		2.5 uL primer from 10 uM stock
		USED REVERSE PRIMER 

# Double Band Size Selection 
*goal was to seperate >1300 bp bands and then <1200 bp bands
Large band selection = >1300 bp
Smaller band selection = <1200 bp bands*

Did math using this calculator: https://www.beckman.com/reagents/genomic/cleanup-and-size-selection/size-selection/spriselect-protocol 

I measured each sample using the pipet to get the exact volumes of each sample: 

**Sample 3L:** 
Sample Volume, μL: 12 uL
DNA Size Range, bp: 175–1300   

**KEY PROTOCOL VARIABLES CALCULATED**
Left–Right Side Bead Ratio: 0.9–0.5
SPRIselect Volume 1, μL: 6
SPRIselect Volume 2, μL: 4.8

**Sample 5L:** 
Sample Volume, μL: 11 uL
DNA Size Range, bp: 175–1300   

**KEY PROTOCOL VARIABLES CALCULATED**
Left–Right Side Bead Ratio: 0.9–0.5
SPRIselect Volume 1, μL: 5.5
SPRIselect Volume 2, μL: 4.4
### Purification 
1. make fresh 80% ethanol in a 50mL tube (label and parafilm when not in use)
2. Determine whether or not a plate transfer is necessary. If the PCR reaction volume multiplied by 2.8 exceeds the volume of the PCR plate, a transfer to larger tubes is required.
3. Gently shake the Clean NGS Mag PCR Clean-up aliquot to resuspend any Magnetic particles that may have settled.
    1. Add CleanNGS Mag PCR Clean-up volume table below:

Large Band Selection:  SPRIselect Volume 1 = Sample Volume × Right Side Bead Ratio

| sample | Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
| ------ | ------------------ | --------------- | ----------------------- | --------------- | ---------------------- |
| 3L     | 0.5                | 12              | 6                       | 1               | 6                      |
| 5L     | 0.5                | 11              | 5.5                     | 1               | 5.5                    |


Smaller Band Size Selection: SPRIselect Volume 2 = Sample Volume × (Left Side Bead Ratio - Right Side Bead Ratio)

| sample | Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
| ------ | ------------------ | --------------- | ----------------------- | --------------- | ---------------------- |
| 3L     | 0.4                | 12              | 4.8                     | 1               | 4.8                    |
| 5L     | 0.4                | 11              | 4.4                     | 1               | 4.4                    |

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
8. Aspirate out the ethanol and discard. Repeat for a total of three washes. 
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
17. Aspirate out the ethanol and discard. Repeat for a total of three washes. 
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