Clean up of successful samples from [2026-11-10 Clade C PCR](2026-11-10%20Clade%20C%20PCR.md)

| x   | Colony | Tubelabel_species           | Health_Status | Raw_ng_ul |
| --- | ------ | --------------------------- | ------------- | --------- |
| 1   | 1_26   | 072024_PAN_BDT_T1_588_CNAT  | Healthy       | 21        |
| 2   | 2_34   | 072024_PAN_BDT_T2_1036_CNAT | CLP           | 45.8      |
| 3   | 2_39   | 072024_PAN_BDT_T2_612_CNAT  | CLP           | 28.8      |
| 4   | 2_50   | 072024_PAN_BDT_T2_650_CNAT  | Healthy       | 26.6      |
| 5   | 3_68   | 072024_PAN_BDT_T3_741_CNAT  | Healthy       | 19.1      |
| 6   | 3_75   | 072024_PAN_BDT_T3_725_CNAT  | Healthy       | 13.7      |
| 7   | 2_39   | 92022_PAN_BDT_T2_51_CNAT    | Healthy       | 3.84      |
| 8   | 2_50   | 92022_PAN_BDT_T2_42_CNAT    | Healthy       | 26.6      |
| 9   | 3_68   | 92022_PAN_BDT_T3_38_CNAT    | Healthy       | 7.78      |
| 10  | 3_75   | 92022_PAN_BDT_T3_42_CNAT    | Healthy       | 5.44      |
| 12  | 1_26   | 102023_PAN_BDT_T1_90_CNAT   | CLP           | 29        |
| 13  | 2_34   | 102023_PAN_BDT_T2_198_CNAT  | CLB           | 13.7      |
| 14  | 2_39   | 102023_PAN_BDT_T2_183_CNAT  | CLB           | 40.2      |
| 15  | 2_50   | 102023_PAN_BDT_T2_223_CNAT  | CLB           | 32.6      |
| 18  | 2_33   | 072024_PAN_BDT_T2_1053_CNAT | Healthy       | 40.6      |
| 19  | 2_44   | 072024_PAN_BDT_T2_656_CNAT  | CLP           | 58        |
| 20  | 2_44   | 072024_PAN_BDT_T2_658_CNAT  | Healthy       | 29.8      |
| 21  | 2_57   | 072024_PAN_BDT_T2_1059_CNAT | CLP           | 19.1      |
| 22  | 2_57   | 072024_PAN_BDT_T2_1064_CNAT | Healthy       | 15.9      |
| 23  | 3_60   | 072024_PAN_BDT_T3_693_CNAT  | Healthy       | 46.4      |
| 24  | 3_60   | 072024_PAN_BDT_T3_696_CNAT  | CLP           | 15.3      |
| 25  | 3_61   | 072024_PAN_BDT_T3_692_CNAT  | Healthy       | 51.6      |
| 26  | 3_74   | 072024_PAN_BDT_T3_723_CNAT  | Healthy       | 4.64      |
| 27  | 3_74   | 072024_PAN_BDT_T3_724_CNAT  | CLP           | 1.81      |
| 28  | 3_76   | 072024_PAN_BDT_T3_726_CNAT  | Healthy       | 2.26      |
| 29  | 3_80   | 072024_PAN_BDT_T3_733_CNAT  | Healthy       | 26.2      |
| 31  | 2_43   | 072024_PAN_BDT_T2_662_ORBI  | Healthy       | 75.4      |

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
| 28                | 540                           | 15.12                      | 12.10                 | 3.02            |

2. Determine whether or not a plate transfer is necessary. If the PCR reaction volume multiplied by 2.8 exceeds the volume of the PCR plate, a transfer to larger tubes is required.
3. Gently shake the Clean NGS Mag PCR Clean-up aliquot to resuspend any Magnetic particles that may have settled.
    1. Add CleanNGS Mag PCR Clean-up volume table below:  

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
|--------------------|-----------------|-------------------------|-----------------|------------------------|
| 0.6                | 20              | 12                      | 28              | 336                    |

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
### Sequencing Prep
1. Assess need for Gel Extraction
    1. If need gel extraction refer to [[Qiagen Gel Extraction]]
    2. If no need, skip to step 2
2. Nanodrop each indexed sample
3. Calculate amount of sample needed to send out for sequencing
	*For Sanger-EZ, create a sample with 10 uL DNA + 5 uL Primer (5 uM)*
	*this is what will go into the easy sanger tubes that will be sent for sequencing*
	calculations can be done here: https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=92320545#gid=92320545
4. Fill out necessary sequencing paperwork 
	*For Sanger-EZ, login into Genewiz account and request courier pickup for the Olsen hall drop box, then place samples into drop box at the end of the hall on the 6th floor

