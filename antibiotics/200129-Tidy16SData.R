library(phyloseq)
library(tidyverse)

# Import phyloseq object.
data <- readRDS("ps0995_4alpha_29Sep2019.rds")

# Identify samples belonging to the four pilot subjects.
pilotsamples <- (sample_data(data) %>%
                   filter(Subject %in% c("DBU","DBV","EAQ","EBF")))$Meas_ID
# Retain only samples belonging to the four pilot subjects.
data <- prune_samples(pilotsamples, data)

# Prune OTUs that are absent from the four pilot subjects.
# Use prune_taxa.
# How many taxa are remaining?


# Plot a timeline of samples for each of the four pilot subjects,
# relative to antibiotic treament. (Abx_RelDay)


# What was the average weight of the pilot subjects? (Weight)


# Plot the number of samples for each subject analyzed on different
# sequencing runs. (Sequencing_Run)
