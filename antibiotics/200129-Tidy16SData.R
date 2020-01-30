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


