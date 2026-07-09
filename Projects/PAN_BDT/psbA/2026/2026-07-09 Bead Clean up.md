bead clean up of samples at temp A (originally wanted to do temp B but the bead clean up messed up) and samples CNAT temp E & F and ORBI E from Caroline's temp gradient: https://github.com/cdesouza02/Lab-Notebook/blob/main/Coral-Lab-Notebook/PAN_BDT/06%20psba%20temp%20gradient.md 
her gel image: https://github.com/cdesouza02/Lab-Notebook/blob/main/Coral-Lab-Notebook/PAN_BDT/jun26_psba_tempgrad.pdf 

Notes:
last bead up that fail: [2026-07-08 bead cleanup](2026-07-08%20bead%20cleanup.md)
- the fresh ethanol I made was used up in one wash- not sure what happened I followed the cart but was having a hard time with the p1000 
- this time I am going to make a fresh cryovial of ethanol to dump into the reservoir using the p1000 downstairs 
	- use 1.6 mL of ethanol and 0.4 mL of water 
sample 1C was real hard to remove elution at end without bead and dropped tube- a little fell out
	measured with pipette about 14 uL left before making gel

# 7/9/2026 Gel image 
![](2026_07_09_Gel.png)
## brain storming what could be going on 
### tips from online 
- for 15-30 uL of beads one person only does 30 seconds of drying time 
- if I do over dry beads the best thing to do it to let it elute overnight 
### notes from user manual 
- they recommend 85% ethanol 
- recommend ≥ 50 μL volume as pipetting accuracy decreases; dilute samples with molecular water
# Protocol 
## **VI. Purification with ampure beads**
obtain, label, and cross-link new strip tubes start with the manufacturer protocol using 1.8X-0.8X bead ratio and 10uL-25uL PCR product
- ratio of beads will change the size you select for _may need to re-clean samples if gel images show that multiple bands were not removed_
- 0.8x will get rid of <350 bp dimers, 1.8X will get rid of dimer <100 bp [https://www.beckman.com/reagents/genomic/cleanup-and-size-selection/pcr/bead-ratio](https://www.beckman.com/reagents/genomic/cleanup-and-size-selection/pcr/bead-ratio) ![[bead_SizeSelection.png]
- **NOTE:** all calculations can be done here [https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=1947158502#gid=1947158502](https://docs.google.com/spreadsheets/d/1O_NJCFvnBztKm_G88Sx-gEKD7CwR44iEaRjyxS_N32E/edit?gid=1947158502#gid=1947158502)
1. make fresh 80% ethanol in a 50mL tube (label and parafilm when not in use)
    - paste filled out table here

| Number of Samples | 80% EtOH for each sample (uL) | Total 80% EtoH needed (uL) | Volume 100% EtOH (uL) | Volume H2O (uL) |
|-------------------|-------------------------------|----------------------------|-----------------------|-----------------|
| 5                 | 360                           | 1800                       | 1440                  | 360             |
|                   |                               | in mL                      |                       |                 |
|                   |                               | 1.8                        | 1.44                  | 0.36            |

2. Determine whether or not a plate transfer is necessary. If the PCR reaction volume multiplied by 2.8 exceeds the volume of the PCR plate, a transfer to larger tubes is required.
3. Gently shake the Clean NGS Mag PCR Clean-up aliquot to resuspend any Magnetic particles that may have settled.
    1. Add CleanNGS Mag PCR Clean-up volume table below:

for samples 1A & 2A (fresh temp gradient... I think a little evaporated from the tubes not being completely closed):

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
|--------------------|-----------------|-------------------------|-----------------|------------------------|
| 0.6                | 9.5             | 5.7                     | 2               | 11.4                   |

For Caroline's samples: 

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
|--------------------|-----------------|-------------------------|-----------------|------------------------|
| 0.6                | 13              | 7.8                     | 3               | 23.4                   |

**Note:** The volume of CleanNGS Mag PCR Clean-up for a given reaction can be determined from the following equation:  
_(Volume of Mag Beads per reaction) = (Bead Concentration) x (PCR Reaction Volume)_

3. Mix reagent and PCR reaction thoroughly by pipette mixing 5 times.
4. Incubate the mixed samples for 5 minutes at room temperature for maximum recovery. This step allows the binding of PCR products 125bp (based on concentration) and greater to the Magnetic beads. After mixing, the color of the mixture should appear homogenous.
5. Place the reaction plate onto a 96 well Magnet Plate for 3 minutes or wait until the solution is clear. Wait until the solution is clear before proceeding to the next washing step. Otherwise there may be beads loss.
6. Aspirate the cleared solution from the reaction plate and discard This step must be performed while the reaction plate is placed on the 96 magnetic plate. Avoid disturbing the settled magnetic beads. If beads are drawn into tips, leave behind a few microliters of solution.
7. Dispense **180 uL of 80% ethanol** to each well of the reaction plate and incubate for **1 min** at room temperature. Aspirate out the ethanol and discard. Repeat for a total of **three washes**. It is important to perform these steps with the reaction plate on a 96 well Magnetic Plate. Do not disturb the settled Magnetic beads.
    1. Remove all of the ethanol from the bottom of the well to avoid ethanol carryover. **Bump pipette tip up to 200 uL, may need to use p20 multichannel**
    2. NOTE: A 5 min air dry at room temperature is recommended for the evaporation of the remaining traces of ethanol. **Do not overdry the beads** (the layer of settled beads appears cracked) as this will significantly decrease elution efficiency.
8. Take off the plate from the Magnetic plate, add 15 uL elution buffer (Reagent grade water, TRIS-HCl pH 8.0, or TE buffer) to each well of the reaction plate and pipette mix 5 times.
    1. mix until homogeneous and there are no beads on tube wall
9. Incubate at room temperature for 10 minutes.
10. Place the plate on a magnetic separation device to magnetize the CleanNGS particles. Incubate at room temperature until the CleanNGS particles are completely cleared from solution.
11. Transfer the cleared supernatant containing purified DNA and/or RNA to a new (RNase-free) 96-well microplate and seal with non-permeable sealing film.
12. Store the plate at 2-8°C if storage is only for a few days. For long-term storage, samples should be kept at -20°C.
## Gel Electrophoresis
