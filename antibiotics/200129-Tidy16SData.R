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
data <- prune_taxa(taxa_sums(data) > 0,data)
data


groupDF <-group_by(sample_data(data), Subject) %>% mutate(maxw = max(Weight))
groupDF<- as.data.frame(groupDF)
groupDF

#The weight was only taken once per subject, at the beginning of the study
DBU <- filter(groupDF, Subject == "DBU", Weight >0)%>%mutate(rown=row_number())
DBV <- filter(groupDF, Subject == "DBV")%>%mutate(rown = row_number()) ##Weight not tracked for DBV Subject
EAQ <- filter(groupDF, Subject == "EAQ", Weight >0)
EBF <- filter(groupDF, Subject == "EBF", Weight >0)

Avgweight <- ((sum(DBU$Weight)/nrow(DBU)) + (sum(EAQ$Weight)/nrow(EAQ))+
    (sum(EBF$Weight)/nrow(EBF)))/3 
#Average weight of 64.69667 KG across the subjects



# Plot a timeline of samples for each of the four pilot subjects,
# relative to antibiotic treament. (Abx_RelDay) ### skipped some days

## not tracked for DBU Subject
relDBV <- ggplot(DBV, aes(x=Abx_RelDay, y=1)) + geom_point()
relDBV
relEAQ <- ggplot(EAQ, aes(x=Abx_RelDay, y= 1)) + geom_point()
relEAQ
relEBF <- ggplot(EBF, aes(x=Abx_RelDay, y =1)) + geom_point()
relEBF


# Plot the number of samples for each subject analyzed on different
# sequencing runs. (Sequencing_Run)

DBVRun <- ggplot(DBV, aes(x= DBV$Sequencing_Run))+ geom_bar()
DBVRun
DBURun <- ggplot(DBU, aes(x= DBU$Sequencing_Run))+ geom_bar()
DBURun
EAQRun <- ggplot(EAQ, aes(x= EAQ$Sequencing_Run))+ geom_bar()
EAQRun
EBFRun <- ggplot(EBF, aes(x= EBF$Sequencing_Run))+ geom_bar()
EBFRun



