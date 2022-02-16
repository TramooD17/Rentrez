# Makes a vector of the needed gene data from NCBI using ID numbers:
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

# Opens the rentrez package, which has functions that help to search and pull data from NCBI databases:
library(rentrez)

# Downloads the specified gene data (ncbi_ids) from the NCBI nucleotide database (nucore) and coverts them into the FASTA format:
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
Bburg
#Making the Sequences Data Frame
Sequences <- strsplit(Bburg,split = "\n\n")
print(Sequences)
Sequences <- unlist(Sequences)

#Separating the sequences from the header
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)

#Removing newline characters from Sequences data frame
Sequences$seq <- gsub("\\W","", as.character(Sequences$seq)
Sequences$seq <- gsub("n", "", as.character(Sequences$seq)

#Outputting data frame to file
write.csv(Sequences, "A5_Duong_Tram_Sequences.csv",row.names = FALSE)
