pan_data <- PAN-BDT_ColonyData_Copy

```r
# loading libraries
library(dplyr)
library(tidyr)
library(stringr)

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
    time_point == "X092022_Condition" ~ as.Date("2022-09-01"),
    time_point == "X102023_Condition" ~ as.Date("2023-10-01"),
    time_point == "X72024_Condition"  ~ as.Date("2024-07-01"),
    TRUE ~ as.Date(NA)
    )
  )

# Count non-healthy coral conditions per species
non_healthy_counts_species <- long_data %>%
  mutate(health_status = str_trim(str_to_lower(health_status))) %>%      # clean health status
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


# Count non-healthy coral conditions per species per location
non_healthy_counts_transects <- long_data %>%
  filter(health_status != "healthy") %>%                 # filter non-healthy
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(non_healthy = n)                                # rename the default 'n' column

# total species counts per location
total_counts_transect <- long_data %>%
  count(Transect_num, sort = TRUE) %>%                   # count by transect
  rename(total = n)                                      # rename the default 'n' column
  
# calculating percent unhealthy per species location
coral_summary_transects <- total_counts_transect %>%
  left_join(non_healthy_counts_transects, by = "Transect_num") %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(percent_unhealthy))                # highest percent unhealthy come first
  
  # count non-healthy coral conditions per timepoint & species
  non_healthy_by_time <- long_data %>%
  filter(health_status != "healthy") %>%                 # filter non-healthy
  count(time_date, Species, sort = TRUE) %>%             # count by species & time point
  rename(non_healthy = n) %>%                            # rename the default 'n' column
  arrange(time_date, desc(non_healthy))             
  
# total coral conditions per timepoint & species
total_counts_by_time <- long_data %>%
  count(time_date, Species, sort = TRUE) %>%             # count by species & time_date
  rename(total = n) %>%                                  # rename the default 'n' column
  arrange(time_date, desc(total))                   
  
# calculate percent unhealthy per species per timepoint
coral_summary_timepoint <- total_counts_by_time %>%
  left_join(non_healthy_by_time, by = c("time_date", "Species")) %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(percent_unhealthy))                # highest percent unhealthy come first
 
# Unhealthy species per transect per timepoint
non_healthy_by_transect_time <- long_data %>%
  filter(health_status != "healthy") %>%                           # filter non-healthy
  count(Transect_num, time_date, Species, sort = TRUE) %>%         #count by species, transect, & timepoint
  rename(non_healthy = n) %>%                            # rename the default 'n' column
  arrange(Transect_num, time_date, desc(non_healthy))
  
# total coral conditions per timepoint & species
total_counts_by_transect_time <- long_data %>%
  count(Transect_num, time_date, Species, sort = TRUE) %>%           #count by species, transect, & timepoint
  rename(total = n) %>%                                  # rename the default 'n' column
  arrange(Transect_num, time_date, desc(total)) 
  
# calculate percent unhealthy per species per timepoint
coral_summary_by_transect_time <- total_counts_by_transect_time %>%
  left_join(non_healthy_by_transect_time, by = c("time_date", "Species", "Transect_num")) %>%
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),                 # replaces NAs with 0
    healthy = total - non_healthy,                            # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(time_date))                                    # most recent date first

```


