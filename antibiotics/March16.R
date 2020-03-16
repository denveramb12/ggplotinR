library(phyloseq)
library(tidyverse)

data <- readRDS("ps0995_4alpha_29Sep2019.rds")
pilotsamples <- (sample_data(data) %>%
                   filter(Subject %in% c("DBU","DBV","EAQ","EBF")))$Meas_ID
dataprune <- prune_samples(pilotsamples, data)
dataprune <- prune_taxa(taxa_sums(dataprune) > 0,dataprune) 
h <- merge_phyloseq(tax_table(dataprune), sample_data(dataprune), otu_table(dataprune))
h <- psmelt(h)
ggplot(dataprune) + geom_bar(fill= )
