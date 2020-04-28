library(phyloseq)
library(tidyverse)

data <- readRDS("ps0995_4alpha_29Sep2019.rds")
pilotsamples <- (sample_data(data) %>%
                   filter(Subject %in% c("DBU","DBV","EAQ","EBF")))$Meas_ID
dataprune <- prune_samples(c("M1968", "M1969", "M1970", "M1971", "M1972"), data)
dataprune <- prune_taxa(taxa_sums(dataprune) > 5,dataprune) 
samples <- data.frame(sample_data(dataprune))
tax <- data.frame(as(tax_table(dataprune), "matrix"))
otus <- data.frame(otu_table(dataprune))
## both samples and tax need to be of type data frame phyloseq_to_df?, psmelt?

take2 <- merge(otus, tax)%>%gather(key="Meas_ID", value = "count", M1968:M1972)%>%group_by(Class, Meas_ID)%>%
  summarize(count = sum(count)) %>% ungroup() %>% mutate(relabund = count/sum(count))

take2Final <- left_join(samples, take2)

  
  
#gather - what factors here? key ==? value ==?
#group_by Class/Phylum (class probably better)(no questions) group_by(Class)
#summarize to get count summarize() or summary()
#mutate rel abundance (count/sum(count)) check
#use measure ID to left join left_join() check
#the "alternative" to merge()
#geom_area(y=relabundance, color= Class) check


p <- ggplot(take2Final, aes(x = Abx_RelDay,y = relabund, fill = Class))+ geom_area()

p + theme(
  panel.background = element_rect(fill = "#BFD5E3", colour = "#6D9EC1",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white")
)

