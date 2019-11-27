install.packages("tidyverse")
library(tidyverse)


##observed_species_16s_6500.txt dataset
path <- file.path("~", "desktop", "observed_species_16s_6500.txt")
path

a <- read.table(path, header = TRUE, sep = ",", stringsAsFactors = TRUE)
a ## q1- what does this data mean??

## dataset 2, 16S OTU Datatable

path2 <- file.path("~", "desktop", "otu_table_16s_obs10_bittleston.txt")
path2

otu <- read.table(path2, header = TRUE, stringsAsFactors = FALSE, sep = "\t")
otu

taxonomytable <- otu %>% select(taxonomy)
taxonomyseparated <- separate(taxonomytable,  col = taxonomy, into = c("kingdom","phylum", "class", "order", "family", "genus", "species"), sep ="; ")
View(taxonomyseparated)

nrow(taxonomytable)
ncol(taxonomytable)

names(otu)
nrow(otu)
ncol(otu)


