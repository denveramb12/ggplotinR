library(tidyverse)

data <- read.table("otu_table_16S_obs10_bittleston.txt",
                   header=TRUE, stringsAsFactors = FALSE, sep="\t")

# otu | taxonomy | sample | count
tidydata <- data %>%
  gather(key="sample", value="count",X26Gt.48:X10Nr.21)

# tidyverse:
# https://www.analyticsvidhya.com/blog/2019/05/beginner-guide-tidyverse-most-powerful-collection-r-packages-data-science/
# creating tidy data: https://rstudio-pubs-static.s3.amazonaws.com/282405_e280f5f0073544d7be417cde893d78d0.html 


## dataset 2, 16S OTU Datatable

otu <- read.table(path2, header = TRUE, stringsAsFactors = FALSE, sep = "\t")
otu

taxonomytable <- otu %>% select(taxonomy)
taxonomyseparated <- separate(taxonomytable,  col = taxonomy, into = c("kingdom","phylum", "class", "order", "family", "genus", "species"), sep ="; ")
View(taxonomyseparated)

tidydata <- subset(otu %>%
  gather(key="sample", value="count",X26Gt.48:X10Nr.21), count>0)

tidydata <- slice(tidydata, 1:122)
max(tidydata$count, na.rm= TRUE)

##plot gets a little messy, as there are 122 rows of data, maybe slice into sets of
##10 and replot?
tidyplot <- ggplot(tidydata, aes(x = OTU_ID, y = count)) + geom_col(color = "black", fill = "darkred") +
  labs(x = "A certain OTU_ID", y = "Count", title = "The X26Gt.48 sample was found most frequently in which OTU?")
tidyplot













nrow(taxonomytable)
ncol(taxonomytable)

names(otu)
nrow(otu)
ncol(otu)


