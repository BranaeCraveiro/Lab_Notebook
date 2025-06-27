```r
library(dplyr)
library(stringr)
library(stringr)
library(knitr)

setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")
pan_samples <- read.csv("PAN-BDT_samples.csv")

# Create a smaller dataframe with only selected columns
pan_samples_subset <- pan_samples %>%
  filter(
    Transect_num %in% c("1", "2", "3", "4"),                 # only keep transects 1-4
    Sample_type %in% c("Core_RNAlater", "Core_EtOH"),        #Keep only RNA Later and Ethanol Sample types 
    Sample_physical_location != "TX STATE"               # remove samples at texas state
  ) %>%
  mutate(
    Species = str_trim(str_to_upper(Species)),               # Clean species codes
    Transect_num = str_trim(Transect_num),                   # Clean transect numbers
    Health_status = str_trim(str_to_lower(Health_status))    # Clean health status
  ) %>%
  mutate(
    Species = case_when(
      Species %in% c("OANN", "OFAV") ~ "ORBI",      # If OANN or OFAV, set to ORBI
      TRUE ~ Species                              # Otherwise keep original Species code
    )
  ) %>%
  filter(Species == "CNAT")                                           #Only CNAT samples
  
# Remove Specimen+Timepoints where ANY sample is already done
pan_samples_subset_2 <- pan_samples_subset %>%
group_by(Current_tag_num, Month_year, Health_status) %>%
filter(!Extraction_physical_location %in% "UML_PENGUIN" | is.na(Extraction_physical_location)) %>%       #filter if colony has been done already
  slice_sample(n = 1) %>%                      # randomly pick one per group
  ungroup()

# Create schedule assigning extraction sessions
samples_scheduled <- pan_samples_subset_2 %>%
  mutate(
    Extraction_number = ceiling(row_number() / 9),
    Week = ceiling(Extraction_number / 3),
    Day_in_Week = ((Extraction_number - 1) %% 3) + 1,
    Extraction_Day = case_when(
      Day_in_Week == 1 ~ "Day 1",
      Day_in_Week == 2 ~ "Day 2",
      Day_in_Week == 3 ~ "Day 3"
    )
  ) %>%
  select(Tubelabel_species, Health_status, Week, Extraction_Day) %>%
  rename(
    Week_Number = Week,
    Day = Extraction_Day
  ) %>%
  arrange(Week_Number, Day)


# creating obsidian friendly markdown
kable(samples_scheduled, format = "markdown")
```
