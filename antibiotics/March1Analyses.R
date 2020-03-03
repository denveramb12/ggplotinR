library(phyloseq)
library(tidyverse)


data <- readRDS("ps0995_4alpha_29Sep2019.rds")
pilotsamples <- (sample_data(data) %>%
                   filter(Subject %in% c("DBU","DBV","EAQ","EBF")))$Meas_ID


data <- prune_samples(pilotsamples, data)
data <- prune_taxa(taxa_sums(data) > 0,data)
gpt <- subset_taxa(data, Kingdom=="Bacteria")
gpt.ord <- ordinate(gpt, "PCoA")
ntaxa(gpt)

p1 <- plot_ordination(gpt, gpt.ord, type = "sites",color = "Subject", title ="Samples PCoA")
p1

p <- plot_heatmap(gpt, "Family") + facet_wrap(~Subject)
p

# do heatmaps with more subjects
##still working on finding how to track number of ref OTU on any
##given abx_relDay
sample_data(gpt)%>% ggplot() + geom_line(aes(x = Abx_RelDay, y =)))+
  facet_wrap(~Subject)




