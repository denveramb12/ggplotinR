library(phyloseq)
library(tidyverse)

data <- readRDS("ps0995_4alpha_29Sep2019.rds")
gpt <- subset_taxa(data, Kingdom=="Bacteria")
gpt <- prune_taxa(names(sort(taxa_sums(data),TRUE)[1:300]), data)
plot_heatmap(gpt, sample.label="SampleType")

