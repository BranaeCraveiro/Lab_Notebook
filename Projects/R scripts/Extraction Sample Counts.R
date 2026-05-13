library(dplyr)
library(stringr)
library(stringr)
library(knitr)

setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")

#loading sample csv 
pan_samples <- read.csv("PAN-BDT_samples.csv")

#cleaning sample datasheet 
pan_samples_subset <- pan_samples %>%
  filter(
    Transect_num %in% c("1", "2", "3", "4"),                 # keep transects 1-4
    Sample_type %in% c("Core_RNAlater", "Core_EtOH"),        # keep only RNA Later and Ethanol sample types
    Sample_physical_location != "TX STATE"                   # remove samples at Texas State
    ) %>%
  mutate(
    Species = str_trim(str_to_upper(Species)),               # clean species codes
    Transect_num = str_trim(Transect_num),                   # clean transect numbers
    Health_status = str_trim(str_to_lower(Health_status)),   # clean health status
    Species = case_when(
      Species %in% c("OANN", "OFAV") ~ "ORBI",      # If OANN or OFAV, set to ORBI
      TRUE ~ Species                              # Otherwise keep original Species code
    )) %>% 
      filter(Species %in% c("CNAT", "PSTR", "MCAV", "SSID", "ORBI")    # keep target species 
  ) %>%

  # collapse duplicate rows by date, tag number, health status, and species 
  distinct(Month_year, Current_tag_num, Health_status, Species, .keep_all = TRUE)

#count how many samples per species
sample_counts <- pan_samples_subset %>%
  count(Species)
# output  markdown table of species counts (for obsidian)
kable(sample_counts, format = "markdown")

#checking if distinct worked (is same date/tag/hs collapsed correctly)
#expected to see my CNAT extracted count the same as collapsed count

#check extracted samples counts (anything with Extraction_physical_location filled) 
raw_extracted_df <- pan_samples %>%
  filter(!is.na(Extraction_physical_location) & trimws(Extraction_physical_location) != "")

# coillapsed version of extracted samples using same distinct rule
collapsed_extracted_df <- raw_extracted_df %>%
  distinct(Month_year, Current_tag_num, Health_status, Species, .keep_all = TRUE)

#compare raw vs collapsed by merging df 
compare_df <- raw_extracted_df %>%
  left_join(
    collapsed_extracted_df %>%
      mutate(in_collapsed = TRUE),
    by = c("Month_year","Current_tag_num","Health_status","Species")
  )

# any rows with NA in in_collapsed didn’t make it into the collapsed version
missing_df <- compare_df %>%
  filter(is.na(in_collapsed)) %>%
  distinct()

# check counts and print missing rows
cat("Raw with location: ", nrow(raw_extracted_df), "\n")
cat("Collapsed unique: ", nrow(collapsed_extracted_df), "\n")
cat("Missing after collapse: ", nrow(missing_df), "\n")

print(missing_df)  # shows rows that are not in collapsed