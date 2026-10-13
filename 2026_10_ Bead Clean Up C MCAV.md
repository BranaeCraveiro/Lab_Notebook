
| PCR_Tube_Num | Tubelabel_species          | Health_Status | Raw_ng_ul |
| ------------ | -------------------------- | ------------- | --------- |
| 1            | 072024_PAN_BDT_T2_609_MCAV | CLP           | 92.8      |
| 2            | 072024_PAN_BDT_T3_697_MCAV | Healthy       | 46.2      |
| 3            | 072024_PAN_BDT_T3_699_MCAV | CLP           | 29.6      |
| 4            | 072024_PAN_BDT_T3_711_MCAV | CLP           | 8.04      |
| 5            | 92022_PAN_BDT_T2_27_MCAV   | Healthy       | 3.34      |
| 6            | 92022_PAN_BDT_T3_15_MCAV   | Healthy       | 7.7       |
| 7            | 92022_PAN_BDT_T3_10_MCAV   | Healthy       | 2.92      |
| 8            | 102023_PAN_BDT_T1_151_MCAV | CLP           | 61.8      |
| 9            | 102023_PAN_BDT_T1_116_MCAV | CLP           | 25        |
| 10           | 102023_PAN_BDT_T2_179_MCAV | CLP           | 66.8      |
| 11           | 102023_PAN_BDT_T3_290_MCAV | CLP           | 33        |
| 12           | 102023_PAN_BDT_T3_299_MCAV | CLP           | 52.2      |
| 13           | Negative                   |               |           |

# Protocol
## III. Purification with ampure beads
https://www.beckman.com/reagents/genomic/cleanup-and-size-selection/pcr/bead-ratio
### Purification Preparation
- UV 1x # of samples in strip tubes 
- label and cross-link strip tubes start with the manufacturer protocol using 1.8X-1.0X DNA to bead ratio and 10uL-25uL PCR product 
- ratio of beads will change the band size you select for 
	*may need to re-clean samples if gel images show that multiple bands were not removed*
	- *1.0x will get rid of <200 bp dimers, 1.8X will get rid of dimer <100 bp* 
	- *for psbA usually use 0.6x but always double check sample gel image to pick ratio
- all calculations can be done here: [https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=1947158502#gid=1947158502](https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=1947158502#gid=1947158502) 
### Purification 
1. make fresh 80% ethanol in a 50mL tube (label and parafilm when not in use)
    - paste filled out table here

| Number of Samples | 80% EtOH for each sample (uL) | Total 80% EtoH needed (mL) | Volume 100% EtOH (mL) | Volume H2O (mL) |
|-------------------|-------------------------------|----------------------------|-----------------------|-----------------|
| 12                | 540                           | 6.48                       | 5.18                  | 1.30            |

2. Determine whether or not a plate transfer is necessary. If the PCR reaction volume multiplied by 2.8 exceeds the volume of the PCR plate, a transfer to larger tubes is required.
3. Gently shake the Clean NGS Mag PCR Clean-up aliquot to resuspend any Magnetic particles that may have settled.
    1. Add CleanNGS Mag PCR Clean-up volume table below:

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
|--------------------|-----------------|-------------------------|-----------------|------------------------|
| 0.6                | 20              | 12                      | 12              | 144                    |

**Note:** The volume of CleanNGS Mag PCR Clean-up for a given reaction can be determined from the following equation:  
_(Volume of Mag Beads per reaction) = (Bead Concentration) x (PCR Reaction Volume)

3. Mix reagent and PCR reaction thoroughly by pipette mixing 5 times.
4. Incubate the mixed samples for 5 minutes at room temperature for maximum recovery. 
	*This step allows the binding of PCR products 125bp (based on concentration) and greater to the Magnetic beads. After mixing, the color of the mixture should appear homogenous.*
5. Place the reaction plate onto a 96 well Magnet Plate for 3 minutes or wait until the solution is clear.
	*Wait until the solution is clear before proceeding to the next washing step. Otherwise there may be beads loss.*
6. Aspirate the cleared solution from the reaction plate and discard
	*This step must be performed while the reaction plate is placed on the 96 magnetic plate. Avoid disturbing the settled magnetic beads. If beads are drawn into tips, leave behind a few microliters of solution.*
	*Since the target DNA is on the bead, pipette tips can be reused between samples as long as beads are not disturbed - ALWAYS check tips for beads before going to the next sample* 
7. Dispense **180 uL of 80% ethanol** to each well of the reaction plate and incubate for **1 min** at room temperature. 
8. Aspirate out the ethanol and discard. Repeat for a total of two washes. 
	*It is important to perform these steps with the reaction plate on a 96 well Magnetic Plate. Do not disturb the settled Magnetic beads (again can reuse tips as long as beads are not disturbed.*
    1. Remove all of the ethanol from the bottom of the well to avoid ethanol carryover. 
	    *Bump pipette tip up to 200 uL, may need to use p20 multichannel*
    2. **NOTE:** *A 1 minute air dry at room temperature is recommended for the evaporation of the remaining traces of ethanol when using ~20 uL of beads.* **Do not overdry the beads** *(the layer of settled beads appears dull or cracked) as this will significantly decrease elution efficiency.
9. Take off the plate from the Magnetic plate, add same volume or less than starting sample uL of elution buffer (Reagent grade water, TRIS-HCl pH 8.0, or TE buffer) to each well of the reaction plate and pipette mix 5 times.
    *mix until homogeneous and there are no beads on tube wall*
10. Incubate at room temperature for 10 minutes.
	*if beads over dried incubate for longer*
11. Place the plate on a magnetic separation device to magnetize the CleanNGS particles. 
12. Incubate at room temperature until the CleanNGS particles are completely cleared from solution.
13. Transfer the cleared supernatant containing purified DNA and/or RNA to a new (RNase-free) 96-well microplate and seal with non-permeable sealing film.
14. Store the plate at 2-8°C if storage is only for a few days. For long-term storage, samples should be kept at -20°C.
### Gel Electrophoresis
1. Refer to step II 
2. Run a gel to confirm bead size selection worked