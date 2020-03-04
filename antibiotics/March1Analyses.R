library(phyloseq)
library(tidyverse)

data <- readRDS("ps0995_4alpha_29Sep2019.rds")
pilotsamples <- (sample_data(data) %>%
                   filter(Subject %in% c("DBU","DBV","EAQ","EBF")))$Meas_ID
dataprune <- prune_samples(pilotsamples, data)
dataprune <- prune_taxa(taxa_sums(dataprune) > 0,dataprune)
gpt <- subset_taxa(dataprune, Kingdom=="Bacteria")
gptconfined <- prune_taxa(names(sort(taxa_sums(dataprune),TRUE)[1:331]), gpt)


pilotsamples2 <- pilotsamples <- (sample_data(data) %>%
                                    filter(Subject %in% c("CAN","CAC","BSM","BAN")))$Meas_ID
data2 <- prune_samples(pilotsamples2, data)
data2 <- prune_taxa(taxa_sums(data2)>0,data2)

gpt2 <- subset_taxa(data2, Kingdom == "Bacteria")
gpt2confined <- prune_taxa(names(sort(taxa_sums(data2),TRUE)[1:331]), gpt2)

plot_heatmap(gptconfined) + facet_wrap(~Subject)
plot_heatmap(gpt2confined)+facet_wrap(~Subject)

gpt.ord <- ordinate(gpt, "PCoA")
ntaxa(gpt)

plot_ordination(gpt, gpt.ord, type = "sites",color = "Subject", title ="Samples PCoA")

##still working on
sample_data(gpt)%>% ggplot() + geom_line(aes(x = Abx_RelDay, y =))+
  facet_wrap(~Subject)

plot_heatmap(gpt, "Family") + facet_wrap(~Subject)






