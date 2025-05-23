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

|Species | total| non_healthy| healthy| percent_unhealthy|
|:-------|-----:|-----------:|-------:|-----------------:|
|SSID    |    83|          41|      42|              49.4|
|PSTR    |    75|          36|      39|              48.0|
|CNAT    |   100|          39|      61|              39.0|
|DLAB    |    18|           7|      11|              38.9|
|MCAV    |    91|          24|      67|              26.4|
|ORBI    |    72|          19|      53|              26.4|
|OFAV    |    10|           2|       8|              20.0|
|PAST    |    55|           5|      50|               9.1|
|MMEA    |    26|           1|      25|               3.8|
|OANN    |     3|           0|       3|               0.0|

### Coral  Species per Transect
| Transect_num | total | non_healthy | healthy | percent_unhealthy |
| -----------: | ----: | ----------: | ------: | ----------------: |
|            1 |    81 |          34 |      47 |              42.0 |
|            2 |    87 |          19 |      68 |              21.8 |
|            3 |   106 |          39 |      67 |              36.8 |
|            **4** |    **96** |           **8** |      **88** |               **8.3** |
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
|            3|2024-07-01 |OFAV    |     3|           1|       2|              33.3|
|            3|2024-07-01 |OANN    |     1|           0|       1|               0.0|
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
|            6|2024-07-01 |PAST    |     4|           1|       3|              25.0|
|            6|2024-07-01 |ORBI    |     3|           0|       3|               0.0|
|            6|2024-07-01 |MMEA    |     1|           0|       1|               0.0|
|            6|2024-07-01 |OFAV    |     1|           1|       0|             100.0|
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
|            3|2023-10-01 |OFAV    |     3|           0|       3|               0.0|
|            3|2023-10-01 |OANN    |     1|           0|       1|               0.0|
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
|            3|2022-09-01 |OFAV    |     3|           0|       3|               0.0|
|            3|2022-09-01 |OANN    |     1|           0|       1|               0.0|

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
    Transect_num %in% c("1", "2", "3", "4"),       # only keep transect 1-4
    Sample_type == "Core_RNAlater",               # only keep Core_RNAlater sample type
    Sample_physical_location != "TX STATE"        # remove samples at texas state
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
shared_species <- pan_samples_subset %>%
  distinct(Transect_num, Species) %>%                     #keeps unique combos of transects and species, prevents duplicate combos 
  group_by(Species) %>%                  
  summarise(n_transects = n(), .groups = "drop") %>%    # For each species, count the number of transects it shows up in (should be 4 if it’s in all 4 Transects).
  filter(n_transects == >3) %>%                          # Keep only species that show up in both transects
  pull(Species)

# filtering data by shared species 
T1toT4_samples_shared <- pan_samples_subset %>%
  filter(Species %in% shared_species)
nrow (T1toT4_samples_shared)

# Count non-healthy coral conditions per species
non_healthy_counts_species <- T1_T4_samples_shared %>%
  filter(Health_status != "healthy") %>%               # filter non-healthy
  count(Species, sort = TRUE) %>%                      # count by species
  rename(non_healthy = n)                              # rename the default 'n' column

# total species counts 
total_counts_species <- T1_T4_samples_shared %>%
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
non_healthy_counts_transects <- T1_T4_samples_shared %>%
  filter(Health_status != "healthy") %>%                 # filter non-healthy
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(non_healthy = n)                                # rename the default 'n' column

# total species counts per location
total_counts_transect <- T1_T4_samples_shared %>%
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
non_healthy_by_time <- T1_T4_samples_shared %>%
  filter(Health_status != "healthy") %>%                 # filter non-healthy
  count(Month_year, sort = TRUE) %>%                      # count by time point
  rename(non_healthy = n) %>%                            # rename the default 'n' column
  arrange(Month_year, desc(non_healthy))             

# total coral conditions per timepoint
total_counts_by_time <- T1_T4_samples_shared %>%
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
kable(coral_summary_species, format = "markdown")           #species
kable(coral_summary_transects, format = "markdown")         #transects
kable(coral_summary_timepoint, format = "markdown")         #timepoint

```


### Coral Sample Summary Species 
| Species | total | non_healthy | healthy | percent_unhealthy |
| :------ | ----: | ----------: | ------: | ----------------: |
| SSID    |    36 |          19 |      17 |              52.8 |
| ORBI    |    48 |          17 |      31 |              35.4 |
| CNAT    |    49 |          17 |      32 |              34.7 |
| MCAV    |    31 |           7 |      24 |              22.6 |
| PAST    |    24 |           1 |      23 |               4.2 |
### Coral Sample Summary Transects

|Transect_num | total| non_healthy| healthy| percent_unhealthy|
|:------------|-----:|-----------:|-------:|-----------------:|
|1            |    88|          43|      45|              48.9|
|4            |   100|          18|      82|              18.0|

### Coral Sample Summary Timepoint
| Month_year| total| non_healthy| healthy| percent_unhealthy|
|----------:|-----:|-----------:|-------:|-----------------:|
|     102023|    59|          24|      35|              40.7|
|      72024|   129|          37|      92|              28.7|

## Notes 
- going to want to start extracting July 2024 for week 5/19
- can do 7 samples 3 extractions a week, 10 weeks left for summer, aim to do 96 samples
- I can do more, this is if I want a space between tubes on rack  

#### Some Questions I would Like to Answer 
*a majority of my nonhealthy samples are CLP, so will focus questions on paling
1. Do symbiont community compositions differ between healthy and paling coral samples?
2. Is symbiont diversity higher or lower in paling corals compared to healthy ones?
3. ==Do transects with a higher percentage of paling samples show distinct symbiont community shifts compared to those with mostly healthy corals?==
4. Can differences in symbiont types predict coral health status before visible paling occurs?
5. Do symbionts in paling corals show signs of functional differences?

##### Samples for 5/22 extraction

| Status   | Tube Label                  | Location           |
| -------- | --------------------------- | ------------------ |
| pale     | 072024_PAN_BDT_T2_1059_CNAT | UML_NARWHAL_R3_B33 |
| bleached | 102023_PAN_BDT_T2_228_CNAT  | UML_NARWHAL_R1_B15 |
| healthy  | 92022_PAN_BDT_T2_48_CNAT    | UML_NARWHAL_R1_B13 |
| healthy  | 072024_PAN_BDT_T1_601_CNAT  | UML_NARWHAL_R3_B32 |
| pale     | 072024_PAN_BDT_T1_603_CNAT  | UML_NARWHAL_R3_B32 |
|          |                             |                    |
 
|102023_PAN_BDT_T2_228_CNAT|UML_NARWHAL_R1_B15|

|072024_PAN_BDT_T2_1059_CNAT|UML_NARWHAL_R3_B33|


could not do past 
