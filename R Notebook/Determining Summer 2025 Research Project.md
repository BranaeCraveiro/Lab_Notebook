# PAN_Colony Data
```r
setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")
pan_data <- read.csv("PAN-BDT_ColonyData.csv")

# loading libraries
library(dplyr)
library(tidyr)
library(stringr)
library(knitr)

# reorganizing data into long format
long_data <- pan_data %>%
  pivot_longer(
    cols = c("X092022_Condition", "X102023_Condition", "X72024_Condition"),
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
      time_point == "X72024_Condition" ~ as.Date("2024-07-01"),
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
```

### Coral Summary Species 
| Species | total | non_healthy | healthy | percent_unhealthy |
| :------ | ----: | ----------: | ------: | ----------------: |
| SSID    |    83 |          41 |      42 |              49.4 |
| PSTR    |    75 |          36 |      39 |              48.0 |
| CNAT    |   100 |          39 |      61 |              39.0 |
| DLAB    |    18 |           7 |      11 |              38.9 |
| MCAV    |    91 |          24 |      67 |              26.4 |
| ORBI    |    85 |          21 |      64 |              24.7 |
| PAST    |    55 |           5 |      50 |               9.1 |
| MMEA    |    26 |           1 |      25 |               3.8 |
### Coral  Species per Transect
| Transect_num | total | non_healthy | healthy | percent_unhealthy |
| -----------: | ----: | ----------: | ------: | ----------------: |
|            1 |    81 |          34 |      47 |              42.0 |
|            2 |    87 |          19 |      68 |              21.8 |
|            3 |   106 |          39 |      67 |              36.8 |
|            4 |    96 |           8 |      88 |               8.3 |
|            5 |    94 |          44 |      50 |              46.8 |
|            6 |    69 |          30 |      39 |              43.5 |

### Coral Summary  per Timepoints 
| time_date  | total | non_healthy | healthy | percent_unhealthy |
| :--------- | ----: | ----------: | ------: | ----------------: |
| 2024-07-01 |   225 |          73 |     152 |              32.4 |
| 2023-10-01 |   220 |         101 |     119 |              45.9 |
| 2022-09-01 |    88 |           0 |      88 |               0.0 |
### Coral Summary Species per Transect & Timepoint
| Transect_num|time_date  |Species | total| non_healthy| healthy| percent_unhealthy|
|------------:|:----------|:-------|-----:|-----------:|-------:|-----------------:|
|            1|2024-07-01 |SSID    |     7|           5|       2|              71.4|
|            1|2024-07-01 |CNAT    |     6|           3|       3|              50.0|
|            1|2024-07-01 |MCAV    |     5|           3|       2|              60.0|
|            1|2024-07-01 |ORBI    |     5|           2|       3|              40.0|
|            1|2024-07-01 |PAST    |     4|           0|       4|               0.0|
|            2|2024-07-01 |MCAV    |     7|           2|       5|              28.6|
|            2|2024-07-01 |CNAT    |     6|           3|       3|              50.0|
|            2|2024-07-01 |ORBI    |     6|           0|       6|               0.0|
|            2|2024-07-01 |PAST    |     5|           1|       4|              20.0|
|            2|2024-07-01 |SSID    |     5|           5|       0|             100.0|
|            3|2024-07-01 |PSTR    |    12|           8|       4|              66.7|
|            3|2024-07-01 |CNAT    |     7|           3|       4|              42.9|
|            3|2024-07-01 |MCAV    |     5|           5|       0|             100.0|
|            3|2024-07-01 |SSID    |     5|           3|       2|              60.0|
|            3|2024-07-01 |MMEA    |     4|           0|       4|               0.0|
|            3|2024-07-01 |ORBI    |     4|           1|       3|              25.0|
|            4|2024-07-01 |PSTR    |    10|           4|       6|              40.0|
|            4|2024-07-01 |MCAV    |     8|           1|       7|              12.5|
|            4|2024-07-01 |CNAT    |     6|           0|       6|               0.0|
|            4|2024-07-01 |MMEA    |     6|           0|       6|               0.0|
|            4|2024-07-01 |ORBI    |     6|           1|       5|              16.7|
|            4|2024-07-01 |PAST    |     6|           1|       5|              16.7|
|            4|2024-07-01 |SSID    |     6|           0|       6|               0.0|
|            5|2024-07-01 |CNAT    |    11|           2|       9|              18.2|
|            5|2024-07-01 |ORBI    |    11|           5|       6|              45.5|
|            5|2024-07-01 |DLAB    |     9|           1|       8|              11.1|
|            5|2024-07-01 |MCAV    |     5|           1|       4|              20.0|
|            5|2024-07-01 |PAST    |     5|           1|       4|              20.0|
|            5|2024-07-01 |SSID    |     5|           4|       1|              80.0|
|            5|2024-07-01 |PSTR    |     1|           1|       0|             100.0|
|            6|2024-07-01 |PSTR    |    11|           3|       8|              27.3|
|            6|2024-07-01 |MCAV    |     7|           2|       5|              28.6|
|            6|2024-07-01 |CNAT    |     5|           0|       5|               0.0|
|            6|2024-07-01 |SSID    |     5|           0|       5|               0.0|
|            6|2024-07-01 |ORBI    |     4|           1|       3|              25.0|
|            6|2024-07-01 |PAST    |     4|           1|       3|              25.0|
|            6|2024-07-01 |MMEA    |     1|           0|       1|               0.0|
|            1|2023-10-01 |SSID    |     7|           6|       1|              85.7|
|            1|2023-10-01 |CNAT    |     6|           6|       0|             100.0|
|            1|2023-10-01 |MCAV    |     5|           4|       1|              80.0|
|            1|2023-10-01 |ORBI    |     5|           5|       0|             100.0|
|            1|2023-10-01 |PAST    |     4|           0|       4|               0.0|
|            2|2023-10-01 |MCAV    |     7|           0|       7|               0.0|
|            2|2023-10-01 |CNAT    |     6|           4|       2|              66.7|
|            2|2023-10-01 |ORBI    |     6|           0|       6|               0.0|
|            2|2023-10-01 |PAST    |     5|           0|       5|               0.0|
|            2|2023-10-01 |SSID    |     5|           4|       1|              80.0|
|            3|2023-10-01 |PSTR    |    12|           8|       4|              66.7|
|            3|2023-10-01 |CNAT    |     7|           5|       2|              71.4|
|            3|2023-10-01 |MCAV    |     5|           1|       4|              20.0|
|            3|2023-10-01 |SSID    |     5|           5|       0|             100.0|
|            3|2023-10-01 |MMEA    |     4|           0|       4|               0.0|
|            3|2023-10-01 |ORBI    |     4|           0|       4|               0.0|
|            4|2023-10-01 |PSTR    |    10|           1|       9|              10.0|
|            4|2023-10-01 |MCAV    |     8|           0|       8|               0.0|
|            4|2023-10-01 |CNAT    |     6|           0|       6|               0.0|
|            4|2023-10-01 |MMEA    |     6|           0|       6|               0.0|
|            4|2023-10-01 |ORBI    |     6|           0|       6|               0.0|
|            4|2023-10-01 |PAST    |     6|           0|       6|               0.0|
|            4|2023-10-01 |SSID    |     6|           0|       6|               0.0|
|            5|2023-10-01 |CNAT    |    11|           9|       2|              81.8|
|            5|2023-10-01 |ORBI    |    11|           5|       6|              45.5|
|            5|2023-10-01 |DLAB    |     9|           6|       3|              66.7|
|            5|2023-10-01 |MCAV    |     5|           2|       3|              40.0|
|            5|2023-10-01 |PAST    |     5|           1|       4|              20.0|
|            5|2023-10-01 |SSID    |     5|           5|       0|             100.0|
|            5|2023-10-01 |PSTR    |     1|           1|       0|             100.0|
|            6|2023-10-01 |PSTR    |    11|          10|       1|              90.9|
|            6|2023-10-01 |MCAV    |     7|           3|       4|              42.9|
|            6|2023-10-01 |SSID    |     5|           4|       1|              80.0|
|            6|2023-10-01 |CNAT    |     4|           4|       0|             100.0|
|            6|2023-10-01 |ORBI    |     2|           1|       1|              50.0|
|            6|2023-10-01 |PAST    |     2|           0|       2|               0.0|
|            6|2023-10-01 |MMEA    |     1|           1|       0|             100.0|
|            1|2022-09-01 |SSID    |     7|           0|       7|               0.0|
|            1|2022-09-01 |CNAT    |     6|           0|       6|               0.0|
|            1|2022-09-01 |MCAV    |     5|           0|       5|               0.0|
|            1|2022-09-01 |ORBI    |     5|           0|       5|               0.0|
|            1|2022-09-01 |PAST    |     4|           0|       4|               0.0|
|            2|2022-09-01 |MCAV    |     7|           0|       7|               0.0|
|            2|2022-09-01 |CNAT    |     6|           0|       6|               0.0|
|            2|2022-09-01 |ORBI    |     6|           0|       6|               0.0|
|            2|2022-09-01 |PAST    |     5|           0|       5|               0.0|
|            2|2022-09-01 |SSID    |     5|           0|       5|               0.0|
|            3|2022-09-01 |CNAT    |     7|           0|       7|               0.0|
|            3|2022-09-01 |PSTR    |     7|           0|       7|               0.0|
|            3|2022-09-01 |MCAV    |     5|           0|       5|               0.0|
|            3|2022-09-01 |SSID    |     5|           0|       5|               0.0|
|            3|2022-09-01 |MMEA    |     4|           0|       4|               0.0|
|            3|2022-09-01 |ORBI    |     4|           0|       4|               0.

# PAN_Sample Data
```r
setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\GitHub\\SCTLD_samples\\Sample_Data")
pan_samples <- read.csv("PAN-BDT_samples.csv")

# Load necessary libraries
library(dplyr)
library(tidyr)
library(stringr)
library(knitr)

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
  filter(n_transects %in% c(3, 4)) %>%
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


```
**Total samples for Species at all 4 transects: 454**

### Coral Species Transect Counts
| Species | n_transects |
| :------ | ----------: |
| CNAT    |           4 |
| DLAB    |           1 |
| MCAV    |           4 |
| MMEA    |           2 |
| ORBI    |           4 |
| PAST    |           3 |
| PSTR    |           2 |
| SSID    |           4 |
### Coral Sample Summary Species 
| Species | total | non_healthy | healthy | percent_unhealthy |
| :------ | ----: | ----------: | ------: | ----------------: |
| SSID    |   106 |          38 |      68 |              35.8 |
| CNAT    |   129 |          40 |      89 |              31.0 |
| ORBI    |   109 |          28 |      81 |              25.7 |
| MCAV    |   110 |          28 |      82 |              25.5 |
### Coral Sample Summary Transects
| Transect_num | total | non_healthy | healthy | percent_unhealthy |
| :----------- | ----: | ----------: | ------: | ----------------: |
| 1            |   122 |          42 |      80 |              34.4 |
| 2            |   134 |          44 |      90 |              32.8 |
| 3            |   110 |          30 |      80 |              27.3 |
| 4            |    88 |          18 |      70 |              20.5 |
### Coral Sample Summary Timepoint
| Month_year | total | non_healthy | healthy | percent_unhealthy |
| ---------: | ----: | ----------: | ------: | ----------------: |
|      92022 |   136 |           0 |     136 |               0.0 |
|     102023 |    93 |          48 |      45 |              51.6 |
|      72024 |   225 |          86 |     139 |              38.2 |

# Notes 
#### Some Questions I would Like to Answer 
1. Do symbiont community compositions differ between healthy and paling/unhealthy coral samples?
2. Is symbiont diversity higher or lower in paling corals compared to healthy ones?
3. Do the dominant symbiont composition shift after paling in reefs?
4. Do transects with a higher percentage of paling samples show distinct symbiont community shifts compared to those with mostly healthy corals?
5. Can differences in symbiont types predict coral health status before visible paling occurs?
6. Do symbionts in paling corals show signs of functional differences?

##### Samples for 5/22 extraction

| Status   | Tube Label                  | Location           |
| -------- | --------------------------- | ------------------ |
| pale     | 072024_PAN_BDT_T2_1059_CNAT | UML_NARWHAL_R3_B33 |
| bleached | 102023_PAN_BDT_T2_228_CNAT  | UML_NARWHAL_R1_B15 |
| healthy  | 92022_PAN_BDT_T2_48_CNAT    | UML_NARWHAL_R1_B13 |
| healthy  | 072024_PAN_BDT_T1_601_CNAT  | UML_NARWHAL_R3_B32 |
| pale     | 072024_PAN_BDT_T1_603_CNAT  | UML_NARWHAL_R3_B32 |


