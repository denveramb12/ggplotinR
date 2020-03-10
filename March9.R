library(phyloseq)
library(tidyverse)

data <- readRDS("ps0995_4alpha_29Sep2019.rds")
pilotsamples <- (sample_data(data) %>%
                   filter(Subject %in% c("DBU","DBV","EAQ","EBF")))$Meas_ID
dataprune <- prune_samples(pilotsamples, data)
dataprune <- prune_taxa(taxa_sums(dataprune) > 0,dataprune) 
plot_richness(dataprune, measures="Shannon") + facet_wrap(~Subject)

sample_data(dataprune)%>%
  ggplot() + geom_point(aes(x=Abx_RelDay, y=JD1)) +   
  geom_line(color='red',data = sample_data(dataprune), aes(x=Abx_RelDay, y=JD1)) +
  facet_wrap(~Subject)

g<-sample_data(dataprune)%>%filter(Subject == "EBF")
g
