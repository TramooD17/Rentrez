#Assignment 5: Part 2

#Downloading SARS-CoV-2 reference genome from Genbank.
library(rentrez)
cov_ids <- c("NC_045512.2 ")
Covi<-entrez_fetch(db = "nuccore", id = cov_ids, rettype = "fasta")
print(Covi)

#Convert string into vector.
Coviseq <- unlist(strsplit(Covi,split=""))
print(Coviseq)

#Removing newline characters from the sequence.
Coviseq <- gsub("\\W","", as.character(Coviseq))
Coviseq <- gsub("n", "", as.character(Coviseq))

#Using regular expressions to isolate the S protein from the genome
#The Sequence begins after the 97th character in Coviseq
#21563+97=21660 ,25384+97=25481
regexec("ATGTTTGTTTTTCTTGTTTA",Coviseq)

#This gene is evolving rapidly. The E-value for the top matches are zero, meaning there is an exact match for all of the sequences compared by BLAST and that the alignment is not occurring by chance. This then suggests that the S protein gene is not rapidly evolving, and that it is conserved in all of the genomes BLAST presented. This protein is conserved in all (or most) variants of COV2-Sars, which makes it a useful target in drug development.


