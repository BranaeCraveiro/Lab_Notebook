since I have never done more than 16 samples at once I am going to do two batches of 48 


## 6/25/2026 Gel Image
NOTE: sample 11 had 15 uL extra in the indexed tube- I only took 25 uL but forgot to mix it (I did take from the bottom though)
- Instead of running sample 10 in the gel I ran sample 11 


note: I think some of the beads may of dried
- I think I will split up the next 48 into two batches of 24 for my own sanity 

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
| 96                | 360                           | 34560                      | 27648                 | 6912            |
|                   |                               | in mL                      |                       |                 |
|                   |                               | 34.56                      | 27.648                | 6.912           |

2. Determine whether or not a plate transfer is necessary. If the PCR reaction volume multiplied by 2.8 exceeds the volume of the PCR plate, a transfer to larger tubes is required.
3. Gently shake the Clean NGS Mag PCR Clean-up aliquot to resuspend any Magnetic particles that may have settled.
    1. Add CleanNGS Mag PCR Clean-up volume table below:

| Bead Concentration | PCR volume (uL) | Added beads volume (uL) | Total # Samples | Total Bead Volume (uL) |
|--------------------|-----------------|-------------------------|-----------------|------------------------|
| 0.8                | 25              | 20                      | 48              | 960                    |

**Note:** The volume of CleanNGS Mag PCR Clean-up for a given reaction can be determined from the following equation:  
_(Volume of Mag Beads per reaction) = (Bead Concentration) x (PCR Reaction Volume)_

3. Mix reagent and PCR reaction thoroughly by pipette mixing 5 times.
4. Incubate the mixed samples for 5 minutes at room temperature for maximum recovery. This step allows the binding of PCR products 125bp (based on concentration) and greater to the Magnetic beads. After mixing, the color of the mixture should appear homogenous.
5. Place the reaction plate onto a 96 well Magnet Plate for 3 minutes or wait until the solution is clear. Wait until the solution is clear before proceeding to the next washing step. Otherwise there may be beads loss.
6. Aspirate the cleared solution from the reaction plate and discard This step must be performed while the reaction plate is placed on the 96 magnetic plate. Avoid disturbing the settled magnetic beads. If beads are drawn into tips, leave behind a few microliters of solution.
7. Dispense **180 uL of 80% ethanol** to each well of the reaction plate and incubate for **1 min** at room temperature. Aspirate out the ethanol and discard. Repeat for a total of **three washes**. It is important to perform these steps with the reaction plate on a 96 well Magnetic Plate. Do not disturb the settled Magnetic beads.
    1. Remove all of the ethanol from the bottom of the well to avoid ethanol carryover. **Bump pipette tip up to 200 uL, may need to use p20 multichannel**
    2. NOTE: A 5 min air dry at room temperature is recommended for the evaporation of the remaining traces of ethanol. **Do not overdry the beads** (the layer of settled beads appears cracked) as this will significantly decrease elution efficiency.
8. Take off the plate from the Magnetic plate, add equal amount of original volume or less of elution buffer (Reagent grade water, TRIS-HCl pH 8.0, or TE buffer) to each well of the reaction plate and pipette mix 5 times.
    1. mix until homogeneous and there are no beads on tube wall
9. Incubate at room temperature for 10 minutes.
10. Place the plate on a magnetic separation device to magnetize the CleanNGS particles. Incubate at room temperature until the CleanNGS particles are completely cleared from solution.
11. Transfer the cleared supernatant containing purified DNA and/or RNA to a new (RNase-free) 96-well microplate and seal with non-permeable sealing film.
12. Store the plate at 2-8°C if storage is only for a few days. For long-term storage, samples should be kept at -20°C.
## Gel Electrophoresis