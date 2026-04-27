#load libraries
require(tidyverse)
require(dplyr)
require(data.table)

setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")

#load Colony_Data.csv
colony=read.csv("PAN-BDT_ColonyData.csv")

#step 1: cleaning colony data 

#checking column headers 
head(colony)

#keeping useful columns 
colony_clean=colony[c('Transect_num', 'Current_tag_num', 'X092022_Condition', 
                      'X102023_Condition', 'X072024_Condition')]

#renaming health condition columns 
colony_clean <- colony_clean %>% 
  rename_with(
    .cols = matches ("^X\\d{6}_Condition$"), 
    .fn = ~ str_extract(., "\\d{6}")
  ) 

#putting df in long format
colony_long <- colony_clean %>% 
  pivot_longer(
    cols = matches ("^\\d{6}"), 
    names_to = "MonthYear", 
    values_to = "Condition"
  )

#add colony column 
#adding a colony column to sample data using transect num and tag num data 
colony_long$colony = c(paste0(colony_long$Transect_num, "_", colony_long$Current_tag_num))

#checking if code worked
#want to see 5 columns: transect num, current tag num, monthyear, condition, and colony 
head(colony_long)

#removing transcet num and current tag number columns now that we have the colony column 
colony_long$Transect_num =NULL
colony_long$Current_tag_num =NULL
#checking if worked 
head(colony_long)

#Step 2: clean sample data 

#load Sample_data.csv
sample=read.csv("PAN-BDT_samples.csv")

#adding a colony column to sample data
sample$colony=colony=c(paste0(sample$Transect_num, "_", sample$Current_tag_num))

#only use EtOH and RNALater samples & target species, exclude nontarget transects
sample_DNA <- sample[(sample$Sample_type == "Core_EtOH" | sample$Sample_type == "Core_RNAlater") &
                       (sample$Species == "CNAT" | sample$Species == "PSTR" | sample$Species == "MCAV" | sample$Species == "SSID") &
                       (sample$Transect != "5" |  sample$Transect != "6") ,]

#checking if code worked (want to see last column as colony) 
head(sample_DNA)

#Step 3: cleaning metagenomics df 

#load Metagenomics_tracker.csv
metagenomics=read.csv("Metagenomics_Tracker_PAN-BDT.csv")

#checking df 
head(metagenomics)

#changing X column to Tubelabel_species
names(metagenomics)[names(metagenomics) == 'X'] <- 'Tubelabel_species'

#checking if column name changed 
colnames(metagenomics)

#isolating useful columns 
metagenomics_PCR = metagenomics[c("Tubelabel_species", "Health_Status", "Extracted", "Raw_ng_ul", "Extraction_physical_location")]

#checking if code worked
head(metagenomics_PCR)


#Step 4: merging sample_DNA and metagenonics_PCR into one dataframe 


#filter meta for grep t5 t6 

#need to make number of rows match- need to remove samples not yet extracted 
nrow(metagenomics_PCR)
nrow(sample_DNA)

#keeping only my extracted samples (ones in penguin fridge) 
sample_DNA <- sample_DNA[!is.na(sample_DNA$Extraction_physical_location) &
                           sample_DNA$Extraction_physical_location == "UML_PENGUIN", ]
metagenomics_PCR <- metagenomics_PCR[metagenomics_PCR$Extraction_physical_location == "UML_PENGUIN", ]
#for some reason the NAs were messing with just the sample_DNA df so I had to clean for NA also 

head(sample_DNA)
head(metagenomics_PCR)

nrow(metagenomics_PCR)
nrow(sample_DNA)

#info using to create ties between sample_dna and metagenomics_PCR
sample_DNA=sample_DNA[c("Tubelabel_species", "colony")]

sample_tracker <- merge(x=metagenomics_PCR, y=sample_DNA, by="Tubelabel_species")
sample_tracker <- merge(sample_tracker, colony_long, by = c("MonthYear", "colony"), all = FALSE)


