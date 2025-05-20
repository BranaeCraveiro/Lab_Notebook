
```r
setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab")
pan_data <- read.csv("PAN-BDT_ColonyData_Copy.csv")

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
  mutate(
    Species = str_trim(str_to_upper(Species)),                    # Clean species codes
    health_status = str_trim(str_to_lower(health_status)),        # Clean health status
    time_date = case_when(
      time_point == "X092022_Condition" & !is.na(health_status) & heath_status != "" ~ as.Date("2022-09-01"),
      time_point == "X102023_Condition" ~ as.Date("2023-10-01"),
      time_point == "X72024_Condition"  ~ as.Date("2024-07-01"),
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
| Species | total | non_healthy | healthy | percent_unhealthy |
| :------ | ----: | ----------: | ------: | ----------------: |
| SSID    |    99 |          41 |      58 |              41.4 |
| PSTR    |   102 |          36 |      66 |              35.3 |
| CNAT    |   123 |          39 |      84 |              31.7 |
| DLAB    |    27 |           7 |      20 |              25.9 |
| MCAV    |   111 |          24 |      87 |              21.6 |
| ORBI    |    93 |          19 |      74 |              20.4 |
| OFAV    |    12 |           2 |      10 |              16.7 |
| PAST    |    72 |           7 |      65 |               9.7 |
| MMEA    |    33 |           1 |      32 |               3.0 |
| OANN    |     3 |           0 |       3 |               0.0 |
### Coral  Species per Transect
| Transect_num | total | non_healthy | healthy | percent_unhealthy |
| -----------: | ----: | ----------: | ------: | ----------------: |
|            1 |    81 |          34 |      47 |              42.0 |
|            2 |    87 |          19 |      68 |              21.8 |
|            3 |   111 |          39 |      72 |              35.1 |
|            4 |   144 |           8 |     136 |               5.6 |
|            5 |   141 |          44 |      97 |              31.2 |
|            6 |   111 |          32 |      79 |              28.8 |
### Coral Summary  per Timepoints 
| time_date  | total | non_healthy | healthy | percent_unhealthy |
| :--------- | ----: | ----------: | ------: | ----------------: |
| 2024-07-01 |   225 |          73 |     152 |              32.4 |
| 2023-10-01 |   225 |         103 |     122 |              45.8 |
| 2022-09-01 |   225 |           0 |     225 |               0.0 |
### Coral Summary Species per Transect & Timepoint
| Transect_num | time_date  | Species | total | non_healthy | healthy | percent_unhealthy |
| -----------: | :--------- | :------ | ----: | ----------: | ------: | ----------------: |
|            1 | 2024-07-01 | SSID    |     7 |           5 |       2 |              71.4 |
|            1 | 2024-07-01 | CNAT    |     6 |           3 |       3 |              50.0 |
|            1 | 2024-07-01 | MCAV    |     5 |           3 |       2 |              60.0 |
|            1 | 2024-07-01 | ORBI    |     5 |           2 |       3 |              40.0 |
|            1 | 2024-07-01 | PAST    |     4 |           0 |       4 |               0.0 |
|            2 | 2024-07-01 | MCAV    |     7 |           2 |       5 |              28.6 |
|            2 | 2024-07-01 | CNAT    |     6 |           3 |       3 |              50.0 |
|            2 | 2024-07-01 | ORBI    |     6 |           0 |       6 |               0.0 |
|            2 | 2024-07-01 | PAST    |     5 |           1 |       4 |              20.0 |
|            2 | 2024-07-01 | SSID    |     5 |           5 |       0 |             100.0 |
|            3 | 2024-07-01 | PSTR    |    12 |           8 |       4 |              66.7 |
|            3 | 2024-07-01 | CNAT    |     7 |           3 |       4 |              42.9 |
|            3 | 2024-07-01 | MCAV    |     5 |           5 |       0 |             100.0 |
|            3 | 2024-07-01 | SSID    |     5 |           3 |       2 |              60.0 |
|            3 | 2024-07-01 | MMEA    |     4 |           0 |       4 |               0.0 |
|            3 | 2024-07-01 | OFAV    |     3 |           1 |       2 |              33.3 |
|            3 | 2024-07-01 | OANN    |     1 |           0 |       1 |               0.0 |
|            4 | 2024-07-01 | PSTR    |    10 |           4 |       6 |              40.0 |
|            4 | 2024-07-01 | MCAV    |     8 |           1 |       7 |              12.5 |
|            4 | 2024-07-01 | CNAT    |     6 |           0 |       6 |               0.0 |
|            4 | 2024-07-01 | MMEA    |     6 |           0 |       6 |               0.0 |
|            4 | 2024-07-01 | ORBI    |     6 |           1 |       5 |              16.7 |
|            4 | 2024-07-01 | PAST    |     6 |           1 |       5 |              16.7 |
|            4 | 2024-07-01 | SSID    |     6 |           0 |       6 |               0.0 |
|            5 | 2024-07-01 | CNAT    |    11 |           2 |       9 |              18.2 |
|            5 | 2024-07-01 | ORBI    |    11 |           5 |       6 |              45.5 |
|            5 | 2024-07-01 | DLAB    |     9 |           1 |       8 |              11.1 |
|            5 | 2024-07-01 | MCAV    |     5 |           1 |       4 |              20.0 |
|            5 | 2024-07-01 | PAST    |     5 |           1 |       4 |              20.0 |
|            5 | 2024-07-01 | SSID    |     5 |           4 |       1 |              80.0 |
|            5 | 2024-07-01 | PSTR    |     1 |           1 |       0 |             100.0 |
|            6 | 2024-07-01 | PSTR    |    11 |           3 |       8 |              27.3 |
|            6 | 2024-07-01 | MCAV    |     7 |           2 |       5 |              28.6 |
|            6 | 2024-07-01 | CNAT    |     5 |           0 |       5 |               0.0 |
|            6 | 2024-07-01 | SSID    |     5 |           0 |       5 |               0.0 |
|            6 | 2024-07-01 | PAST    |     4 |           1 |       3 |              25.0 |
|            6 | 2024-07-01 | ORBI    |     3 |           0 |       3 |               0.0 |
|            6 | 2024-07-01 | MMEA    |     1 |           0 |       1 |               0.0 |
|            6 | 2024-07-01 | OFAV    |     1 |           1 |       0 |             100.0 |
|            1 | 2023-10-01 | SSID    |     7 |           6 |       1 |              85.7 |
|            1 | 2023-10-01 | CNAT    |     6 |           6 |       0 |             100.0 |
|            1 | 2023-10-01 | MCAV    |     5 |           4 |       1 |              80.0 |
|            1 | 2023-10-01 | ORBI    |     5 |           5 |       0 |             100.0 |
|            1 | 2023-10-01 | PAST    |     4 |           0 |       4 |               0.0 |
|            2 | 2023-10-01 | MCAV    |     7 |           0 |       7 |               0.0 |
|            2 | 2023-10-01 | CNAT    |     6 |           4 |       2 |              66.7 |
|            2 | 2023-10-01 | ORBI    |     6 |           0 |       6 |               0.0 |
|            2 | 2023-10-01 | PAST    |     5 |           0 |       5 |               0.0 |
|            2 | 2023-10-01 | SSID    |     5 |           4 |       1 |              80.0 |
|            3 | 2023-10-01 | PSTR    |    12 |           8 |       4 |              66.7 |
|            3 | 2023-10-01 | CNAT    |     7 |           5 |       2 |              71.4 |
|            3 | 2023-10-01 | MCAV    |     5 |           1 |       4 |              20.0 |
|            3 | 2023-10-01 | SSID    |     5 |           5 |       0 |             100.0 |
|            3 | 2023-10-01 | MMEA    |     4 |           0 |       4 |               0.0 |
|            3 | 2023-10-01 | OFAV    |     3 |           0 |       3 |               0.0 |
|            3 | 2023-10-01 | OANN    |     1 |           0 |       1 |               0.0 |
|            4 | 2023-10-01 | PSTR    |    10 |           1 |       9 |              10.0 |
|            4 | 2023-10-01 | MCAV    |     8 |           0 |       8 |               0.0 |
|            4 | 2023-10-01 | CNAT    |     6 |           0 |       6 |               0.0 |
|            4 | 2023-10-01 | MMEA    |     6 |           0 |       6 |               0.0 |
|            4 | 2023-10-01 | ORBI    |     6 |           0 |       6 |               0.0 |
|            4 | 2023-10-01 | PAST    |     6 |           0 |       6 |               0.0 |
|            4 | 2023-10-01 | SSID    |     6 |           0 |       6 |               0.0 |
|            5 | 2023-10-01 | CNAT    |    11 |           9 |       2 |              81.8 |
|            5 | 2023-10-01 | ORBI    |    11 |           5 |       6 |              45.5 |
|            5 | 2023-10-01 | DLAB    |     9 |           6 |       3 |              66.7 |
|            5 | 2023-10-01 | MCAV    |     5 |           2 |       3 |              40.0 |
|            5 | 2023-10-01 | PAST    |     5 |           1 |       4 |              20.0 |
|            5 | 2023-10-01 | SSID    |     5 |           5 |       0 |             100.0 |
|            5 | 2023-10-01 | PSTR    |     1 |           1 |       0 |             100.0 |
|            6 | 2023-10-01 | PSTR    |    11 |          10 |       1 |              90.9 |
|            6 | 2023-10-01 | MCAV    |     7 |           3 |       4 |              42.9 |
|            6 | 2023-10-01 | CNAT    |     5 |           4 |       1 |              80.0 |
|            6 | 2023-10-01 | SSID    |     5 |           4 |       1 |              80.0 |
|            6 | 2023-10-01 | PAST    |     4 |           2 |       2 |              50.0 |
|            6 | 2023-10-01 | ORBI    |     3 |           1 |       2 |              33.3 |
|            6 | 2023-10-01 | MMEA    |     1 |           1 |       0 |             100.0 |
|            6 | 2023-10-01 | OFAV    |     1 |           0 |       1 |               0.0 |
|            1 | 2022-09-01 | SSID    |     7 |           0 |       7 |               0.0 |
|            1 | 2022-09-01 | CNAT    |     6 |           0 |       6 |               0.0 |
|            1 | 2022-09-01 | MCAV    |     5 |           0 |       5 |               0.0 |
|            1 | 2022-09-01 | ORBI    |     5 |           0 |       5 |               0.0 |
|            1 | 2022-09-01 | PAST    |     4 |           0 |       4 |               0.0 |
|            2 | 2022-09-01 | MCAV    |     7 |           0 |       7 |               0.0 |
|            2 | 2022-09-01 | CNAT    |     6 |           0 |       6 |               0.0 |
|            2 | 2022-09-01 | ORBI    |     6 |           0 |       6 |               0.0 |
|            2 | 2022-09-01 | PAST    |     5 |           0 |       5 |               0.0 |
|            2 | 2022-09-01 | SSID    |     5 |           0 |       5 |               0.0 |
|            3 | 2022-09-01 | PSTR    |    12 |           0 |      12 |               0.0 |
|            3 | 2022-09-01 | CNAT    |     7 |           0 |       7 |               0.0 |
|            3 | 2022-09-01 | MCAV    |     5 |           0 |       5 |               0.0 |
|            3 | 2022-09-01 | SSID    |     5 |           0 |       5 |               0.0 |
|            3 | 2022-09-01 | MMEA    |     4 |           0 |       4 |               0.0 |
|            3 | 2022-09-01 | OFAV    |     3 |           0 |       3 |               0.0 |
|            3 | 2022-09-01 | OANN    |     1 |           0 |       1 |               0.0 |
|            4 | 2022-09-01 | PSTR    |    10 |           0 |      10 |               0.0 |
|            4 | 2022-09-01 | MCAV    |     8 |           0 |       8 |               0.0 |
|            4 | 2022-09-01 | CNAT    |     6 |           0 |       6 |               0.0 |
|            4 | 2022-09-01 | MMEA    |     6 |           0 |       6 |               0.0 |
|            4 | 2022-09-01 | ORBI    |     6 |           0 |       6 |               0.0 |
|            4 | 2022-09-01 | PAST    |     6 |           0 |       6 |               0.0 |
|            4 | 2022-09-01 | SSID    |     6 |           0 |       6 |               0.0 |
|            5 | 2022-09-01 | CNAT    |    11 |           0 |      11 |               0.0 |
|            5 | 2022-09-01 | ORBI    |    11 |           0 |      11 |               0.0 |
|            5 | 2022-09-01 | DLAB    |     9 |           0 |       9 |               0.0 |
|            5 | 2022-09-01 | MCAV    |     5 |           0 |       5 |               0.0 |
|            5 | 2022-09-01 | PAST    |     5 |           0 |       5 |               0.0 |
|            5 | 2022-09-01 | SSID    |     5 |           0 |       5 |               0.0 |
|            5 | 2022-09-01 | PSTR    |     1 |           0 |       1 |               0.0 |
|            6 | 2022-09-01 | PSTR    |    11 |           0 |      11 |               0.0 |
|            6 | 2022-09-01 | MCAV    |     7 |           0 |       7 |               0.0 |
|            6 | 2022-09-01 | CNAT    |     5 |           0 |       5 |               0.0 |
|            6 | 2022-09-01 | SSID    |     5 |           0 |       5 |               0.0 |
|            6 | 2022-09-01 | PAST    |     4 |           0 |       4 |               0.0 |
|            6 | 2022-09-01 | ORBI    |     3 |           0 |       3 |               0.0 |
|            6 | 2022-09-01 | MMEA    |     1 |           0 |       1 |               0.0 |
|            6 | 2022-09-01 | OFAV    |     1 |           0 |       1 |               0.0 |
going to want to start extracting July 2024 for week 5/19
need to match species between both transects
samples, isolate T1 and T4, species that match both, location 
exclude 2022 

| Transect_num | time_date  | Species | total | non_healthy | healthy | percent_unhealthy | Transect_num | time_date  | Species | total | non_healthy | healthy | percent_unhealthy |
| -----------: | :--------- | :------ | ----: | ----------: | ------: | ----------------: | -----------: | :--------- | :------ | ----: | ----------: | ------: | ----------------: |
|            1 | 2024-07-01 | SSID    |     7 |           5 |       2 |              71.4 |            4 | 2024-07-01 | SSID    |     6 |           0 |       6 |               0.0 |
|            1 | 2024-07-01 | CNAT    |     6 |           3 |       3 |              50.0 |            4 | 2024-07-01 | CNAT    |     6 |           0 |       6 |               0.0 |
|            1 | 2024-07-01 | MCAV    |     5 |           3 |       2 |              60.0 |            4 | 2024-07-01 | MCAV    |     8 |           1 |       7 |              12.5 |
|            1 | 2024-07-01 | ORBI    |     5 |           2 |       3 |              40.0 |            4 | 2024-07-01 | ORBI    |     6 |           1 |       5 |              16.7 |
|            1 | 2024-07-01 | PAST    |     4 |           0 |       4 |               0.0 |            4 | 2024-07-01 | PAST    |     6 |           1 |       5 |              16.7 |

|   1 | 2023-10-01 | SSID |   7 |   6 |   1 |  85.7 |   4 | 2023-10-01 | SSID |   6 |   0 |   6 | 0.0 |
| --: | :--------- | :--- | --: | --: | --: | ----: | --: | :--------- | :--- | --: | --: | --: | --: |
|   1 | 2023-10-01 | CNAT |   6 |   6 |   0 | 100.0 |   4 | 2023-10-01 | CNAT |   6 |   0 |   6 | 0.0 |
|   1 | 2023-10-01 | MCAV |   5 |   4 |   1 |  80.0 |   4 | 2023-10-01 | MCAV |   8 |   0 |   8 | 0.0 |
|   1 | 2023-10-01 | ORBI |   5 |   5 |   0 | 100.0 |   4 | 2023-10-01 | ORBI |   6 |   0 |   6 | 0.0 |
|   1 | 2023-10-01 | PAST |   4 |   0 |   4 |   0.0 |   4 | 2023-10-01 | PAST |   6 |   0 |   6 | 0.0 |
