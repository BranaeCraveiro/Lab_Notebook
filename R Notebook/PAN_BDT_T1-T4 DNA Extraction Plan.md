```r
library(dplyr)
library(readr)
library(lubridate)

pan_samples <- read_csv("samples.csv")

# Create a smaller dataframe with only selected columns
pan_samples_subset <- pan_samples %>%
  select(Month_year, Transect_num, Current_tag_num, Species, Sample_type, Health_status, Tubelabel_species, Sample_physical_location) %>%
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
  )
  filter(Species == "CNAT")                                      #Only CNAT samples 


samples <- pan_samples_subset %>%
  mutate(
    Health_status = factor(Health_status, levels = c("Healthy", "CLP", "CLB")),
    Month_year = my(Month_year)
  ) %>%
  arrange(Health_status, Month_year)

set.seed(123)

# Starting week
start_wed <- as.Date("2025-06-05")
start_fri <- as.Date("2025-06-07")

# Skip week
skip_week_start <- as.Date("2025-06-09")
skip_week_end <- skip_week_start + days(4)

remaining_samples <- nrow(samples)
extraction_schedule <- c()
week_num <- 1

while (remaining_samples > 0) {
  if (week_num == 1) {
    # Week 1: June 5 (Wed) and June 7 (Fri)
    for (day in c(start_wed, start_fri)) {
      samples_today <- min(sample(7:9, 1), remaining_samples)
      extraction_schedule <- c(extraction_schedule, rep(day, samples_today))
      remaining_samples <- remaining_samples - samples_today
      if (remaining_samples == 0) break
    }
    
  } else {
    # Week start (Monday)
    mon_date <- start_wed + weeks(week_num - 1) + days(5)

    # Skip if in the skip week
    if (mon_date >= skip_week_start && mon_date <= skip_week_end) {
      week_num <- week_num + 1
      next
    }

    wed_date <- mon_date + days(2)
    fri_date <- mon_date + days(4)

    for (day in c(mon_date, wed_date, fri_date)) {
      if (remaining_samples == 0) break
      samples_today <- min(sample(7:9, 1), remaining_samples)
      extraction_schedule <- c(extraction_schedule, rep(day, samples_today))
      remaining_samples <- remaining_samples - samples_today
    }
  }

  week_num <- week_num + 1
}

samples$ExtractionDate <- extraction_schedule

write_csv(samples, "scheduled_extractions_start_june5and7_skipweek.csv")


