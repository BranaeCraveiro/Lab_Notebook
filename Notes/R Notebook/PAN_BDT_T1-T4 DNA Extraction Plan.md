*Note: something is wrong with code- ended up doing plan manually will need out in the later for future extractions*

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

# Determining how many samples I will be extracting 
```r
library(dplyr)
library(stringr)
library(stringr)
library(knitr)

setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")
library(dplyr)
library(stringr)
library(knitr)

# Read in your raw file
pan_samples <- read.csv("PAN-BDT_samples.csv")

# Make a clean subset of your samples
# This filters by transect, sample type, location, cleans up text fields,
# merges OANN & OFAV into ORBI, keeps only target species,
# and collapses duplicate rows by Month_year + Current_tag_num + Health_status + Species
pan_samples_subset <- pan_samples %>%
  filter(
    Transect_num %in% c("1", "2", "3", "4"),                 # only keep transects 1–4
    Sample_type %in% c("Core_RNAlater", "Core_EtOH"),        # keep only RNA Later and Ethanol sample types
    Sample_physical_location != "TX STATE"                  # remove samples at Texas State
  ) %>%
  mutate(
    Species = str_trim(str_to_upper(Species)),               # clean species codes
    Transect_num = str_trim(Transect_num),                   # clean transect numbers
    Health_status = str_trim(str_to_lower(Health_status)),   # clean health status
    Species = case_when(                                     # merge OANN & OFAV to ORBI
      Species %in% c("OANN", "OFAV") ~ "ORBI",
      TRUE ~ Species
    )
  ) %>%
  filter(
    Species %in% c("CNAT", "PSTR", "MCAV", "SSID")           # only certain species
  ) %>%
  # IMPORTANT: include Species here so distinct matches your extraction collapse
  distinct(Month_year, Current_tag_num, Health_status, Species, .keep_all = TRUE)

# Count how many samples per species
sample_counts <- pan_samples_subset %>%
  count(Species)

# Output a markdown table of species counts (good for Obsidian)
kable(sample_counts, format = "markdown")

# Check extracted samples (anything with Extraction_physical_location filled)
raw_extracted_df <- pan_samples %>%
  filter(!is.na(Extraction_physical_location) & trimws(Extraction_physical_location) != "")

# Collapsed version of extracted samples using the same distinct rule
collapsed_extracted_df <- raw_extracted_df %>%
  distinct(Month_year, Current_tag_num, Health_status, Species, .keep_all = TRUE)

# Compare raw vs collapsed
compare_df <- raw_extracted_df %>%
  left_join(
    collapsed_extracted_df %>%
      mutate(in_collapsed = TRUE),
    by = c("Month_year","Current_tag_num","Health_status","Species")
  )

# Any rows with NA in in_collapsed didn’t make it into the collapsed version
missing_df <- compare_df %>%
  filter(is.na(in_collapsed)) %>%
  distinct()

# Check counts and print missing rows
cat("Raw with location: ", nrow(raw_extracted_df), "\n")
cat("Collapsed unique: ", nrow(collapsed_extracted_df), "\n")
cat("Missing after collapse: ", nrow(missing_df), "\n")

print(missing_df)  # shows rows that are not in collapsed

```

| Species   |   n |
| :-------- | --: |
| CNAT      |  74 |
| MCAV      |  69 |
| PSTR      |  62 |
| SSID      |  65 |
| **Total** | 270 |
