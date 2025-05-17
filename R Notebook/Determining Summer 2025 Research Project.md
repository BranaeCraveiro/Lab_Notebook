pan_data <- PAN-BDT_ColonyData_Copy

```r
# loading libraries
library(dplyr)
library(tidyr)
library(stringr)

# reorganizing data into long format
long_data_species <- pan_data %>%
  pivot_longer(
    cols = c("X092022_Condition", "X102023_Condition", "X72024_Condition"),
    names_to = "time_point",             # names of the original columns (the time points)
    values_to = "health_status"          # values inside the cells (the coral's condition)
  )

# Count non-healthy coral conditions per species
non_healthy_counts <- long_data_species %>%
  mutate(health_status = str_trim(str_to_lower(health_status))) %>%  # clean health status
  filter(health_status != "healthy", name = "non_healthy") %>%       # filter non-healthy
  count(Species, sort = TRUE)                                        # count by species

# total species counts 
total_counts <- long_data_species %>%
  count(Species, sort = TRUE)

# calculating percent unhealthy 
coral_summary_species <- total_counts %>%
  left_join(non_healthy_counts, by = "Species") %>%
  
  # Add calculated columns: non_healthy, healthy, and percent_unhealthy
  mutate(
    non_healthy = replace_na(non_healthy, 0),       # Some species may have no non-healthy cases so they’re missing from the non_healthy_counts table; replaces those NAs with 0, so the math doesn’t break and correctly reflects that no unhealthy corals were observed.
    healthy = total - non_healthy,                  # creating healthy column 
    percent_unhealthy = round((non_healthy / total) * 100, 1)
  ) %>%
  arrange(desc(percent_unhealthy))  # highest percent unhealthy come first



```