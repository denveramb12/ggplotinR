library(tidyverse)

data <- read.table("otu_table_16S_obs10_bittleston.txt",
                   header=TRUE, stringsAsFactors = FALSE, sep="\t")

# otu | taxonomy | sample | count
tidydata <- data %>%
  gather(key="sample", value="count",X26Gt.48:X10Nr.21)

# tidyverse:
# https://www.analyticsvidhya.com/blog/2019/05/beginner-guide-tidyverse-most-powerful-collection-r-packages-data-science/
# creating tidy data: https://rstudio-pubs-static.s3.amazonaws.com/282405_e280f5f0073544d7be417cde893d78d0.html 

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


