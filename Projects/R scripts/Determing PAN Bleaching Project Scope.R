setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")
pan_data <- read.csv("PAN-BDT_ColonyData.csv")

# loading libraries
library(dplyr)
library(tidyr)
library(stringr)
library(knitr)

# reorganizing data into long format
long_data <- pan_data %>%
  filter( Transect_num %in% c("1", "2", "3", "4"),                 # only keep transects 1-4
  ) %>%
  pivot_longer(
    cols = c("X092022_Condition", "X102023_Condition", "X072024_Condition"),
    names_to = "time_point",           # names of the original columns (the time points)
    values_to = "health_status"        # values inside the cells (the coral's condition)
  ) %>%
  filter(!is.na(health_status) & health_status != "") %>%        #removes NAs and blanks
  mutate(
    Species = str_trim(str_to_upper(Species)),                   # Clean species codes
    health_status = str_trim(str_to_lower(health_status)),       # Clean health status
    time_date = case_when(
      time_point == "X092022_Condition" ~ as.Date("2022-09-01"),
      time_point == "X102023_Condition" ~ as.Date("2023-10-01"),
      time_point == "X072024_Condition" ~ as.Date("2024-07-01"),
      TRUE ~ as.Date(NA)
    ),
    Species = case_when(
      Species %in% c("OANN", "OFAV") ~ "ORBI",      # If OANN or OFAV, set to ORBI
      TRUE ~ Species                              # Otherwise keep original Species code
    )
  )

# Count non-healthy coral conditions per species
non_healthy_counts_species <- long_data %>%
  filter(health_status != "healthy") %>%               # filter non-healthy
  count(Species, sort = TRUE) %>%                      # count by species
  rename(non_healthy = n)                              # rename the default 'n' column

# total species counts 
total_counts_species <- long_data %>%
  count(Species, sort = TRUE) %>%                      #count by species
  rename(total = n)                                    # rename the default 'n' column

# calculating percent unhealthy per species
coral_summary_species <- total_counts_species %>%
  left_join(non_healthy_counts_species, by = "Species") %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),    # Some species may have no non-healthy cases so they’re missing from the non_healthy_counts table; replaces those NAs with 0, so the math doesn’t break and correctly reflects that no unhealthy corals were observed.
    healthy = total - non_healthy,                # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(percent_unhealthy))                # highest percent unhealthy come first

# Count non-healthy coral conditions per location
non_healthy_counts_transects <- long_data %>%
  filter(health_status != "healthy") %>%                 # filter non-healthy
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(non_healthy = n)                                # rename the default 'n' column

# total species counts per location
total_counts_transect <- long_data %>%
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(total = n)                                      # rename the default 'n' column

# calculating percent unhealthy per location
coral_summary_transects <- total_counts_transect %>%
  left_join(non_healthy_counts_transects, by = "Transect_num") %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(Transect_num)                     # highest percent unhealthy come first

# count non-healthy coral conditions per timepoint
non_healthy_by_time <- long_data %>%
  filter(health_status != "healthy") %>%                 # filter non-healthy
  count(time_date, sort = TRUE) %>%                      # count by time point
  rename(non_healthy = n) %>%                            # rename the default 'n' column
  arrange(time_date, desc(non_healthy))             

# total coral conditions per timepoint
total_counts_by_time <- long_data %>%
  count(time_date, sort = TRUE) %>%                      # count by time_date
  rename(total = n) %>%                                  # rename the default 'n' column
  arrange(time_date, desc(total))                   

# calculate percent unhealthy per species per timepoint
coral_summary_timepoint <- total_counts_by_time %>%
  left_join(non_healthy_by_time, by = c("time_date")) %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(time_date))                                # most recent date comes first

# Unhealthy species per transect & timepoint
non_healthy_transect_time <- long_data %>%
  filter(health_status != "healthy") %>%                           # filter non-healthy
  count(Transect_num, time_date, Species, sort = TRUE) %>%         #count by species, transect, & timepoint
  rename(non_healthy = n) %>%                            # rename the default 'n' column
  arrange(Transect_num, time_date, desc(non_healthy))

# total coral conditions per species, timepoint, & transect
total_counts_by_transect_time <- long_data %>%
  count(Transect_num, time_date, Species, sort = TRUE) %>%
  rename(total = n) %>%
  arrange(time_date, desc(total)) 

# calculate percent unhealthy per species, timepoint, & transect
coral_summary_transect_time <- total_counts_by_transect_time %>%
  left_join(non_healthy_transect_time, by = c("time_date", "Species", "Transect_num")) %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(time_date), Transect_num)                      # most recent date comes first

# creating obsidian friendly markdown
kable(coral_summary_species, format = "markdown")           #species
kable(coral_summary_transects, format = "markdown")         #transects
kable(coral_summary_timepoint, format = "markdown")         #timepoint
kable(coral_summary_transect_time, format = "markdown")     #transects & timepoint


#Now looking at sample data 
pan_samples <- read.csv("PAN-BDT_samples.csv")

# Create a smaller dataframe with only selected columns
pan_samples_subset <- pan_samples %>%
  select(Month_year, Transect_num, Current_tag_num, Species, Sample_type, Health_status, Tubelabel_species, Sample_physical_location) %>%
  filter(
    Transect_num %in% c("1", "2", "3", "4"),             # only keep transects 1-4
    Sample_type %in% c("Core_RNAlater", "Core_EtOH"),    #Keep only RNA Later and Ethanol Sample types 
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
      TRUE ~ Species                                # Otherwise keep original Species code
    )
  )

# Determining shared species
species_transect_counts <- pan_samples_subset %>%
  distinct(Transect_num, Species) %>%                     #keeps unique combos of transects and species, prevents duplicate combos 
  group_by(Species) %>%                  
  summarise(n_transects = n(), .groups = "drop")

# Filter species that are found in at least 3 or 4 transects
shared_species <- species_transect_counts %>%
  filter(Species %in% c("CNAT", "PSTR", "MCAV", "SSID", "ORBI")) %>%
  pull(Species)

# filtering data by shared species 
T1toT4_samples_shared <- pan_samples_subset %>%
  filter(Species %in% shared_species)
nrow (T1toT4_samples_shared)

# Count non-healthy coral conditions per species
non_healthy_counts_species <- T1toT4_samples_shared %>%
  filter(Health_status != "healthy") %>%               # filter non-healthy
  count(Species, sort = TRUE) %>%                      # count by species
  rename(non_healthy = n)                              # rename the default 'n' column

# total species counts 
total_counts_species <- T1toT4_samples_shared %>%
  count(Species, sort = TRUE) %>%                      #count by species
  rename(total = n)                                    # rename the default 'n' column

# calculating percent unhealthy per species
coral_summary_species <- total_counts_species %>%
  left_join(non_healthy_counts_species, by = "Species") %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces  NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(percent_unhealthy))                # highest percent unhealthy come first

# Count non-healthy coral conditions per location
non_healthy_counts_transects <- T1toT4_samples_shared %>%
  filter(Health_status != "healthy") %>%                 # filter non-healthy
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(non_healthy = n)                                # rename the default 'n' column

# total species counts per location
total_counts_transect <- T1toT4_samples_shared %>%
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(total = n)                                      # rename the default 'n' column

# calculating percent unhealthy per location
coral_summary_transects <- total_counts_transect %>%
  left_join(non_healthy_counts_transects, by = "Transect_num") %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replace NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(Transect_num)                     # highest percent unhealthy come first

# count non-healthy coral conditions per timepoint
non_healthy_by_time <- T1toT4_samples_shared %>%
  filter(Health_status != "healthy") %>%                 # filter non-healthy
  count(Month_year, sort = TRUE) %>%                      # count by time point
  rename(non_healthy = n) %>%                            # rename the default 'n' column
  arrange(Month_year, desc(non_healthy))             

# total coral conditions per timepoint
total_counts_by_time <- T1toT4_samples_shared %>%
  count(Month_year, sort = TRUE) %>%                      # count by Month_year
  rename(total = n) %>%                                  # rename the default 'n' column
  arrange(Month_year, desc(total))                   

# calculate percent unhealthy per species per timepoint
coral_summary_timepoint <- total_counts_by_time %>%
  left_join(non_healthy_by_time, by = c("Month_year")) %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(Month_year))                              # most recent date comes first

# creating obsidian friendly markdown
kable(species_transect_counts, format = "markdown")         
kable(coral_summary_species, format = "markdown")           
kable(coral_summary_transects, format = "markdown")         
kable(coral_summary_timepoint, format = "markdown") 