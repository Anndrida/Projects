#The program visualises amounts of amino acids in a gene.

#install.packages("seqinr")
#install.packages("ggplot2")

library(seqinr)
library(ggplot2)

#Please write the name of a file with gene sequence in the quotation marks below 
x <- read.fasta(file = "Homo_sapiens_BRCA2_sequence.fa", as.string = TRUE,
                seqtype = "AA")

gen = x[[1]]

codons = substring(gen, seq(1, nchar(gen)-2, 3), seq(3, nchar(gen), 3))
#length(codons)


#stop=grep("TA[AG]|TGA",codons)
#length(stop)

aanames = c("alanina","glicyna","prolina","asparagina","kwas asparaginowy",
            "kwas glutaminowy","glutamina","cysteina","seryna","fenyloalanina",
            "izoleucyna" ,"leucyna","metionina","treonina","lizyna", 
            "tryptofan","walina","histydyna","tyrozyna","arginina")
short = c("Ala","Gly","Pro","Asn","Asp","Glu","Gln","Cys","Ser","Phe","Ile",
          "Leu","Met","Thr","Lys","Trp","Val","His","Tyr","Arg")
sequence = c("GC[TCAG]","GG[TCAG]","CC[TCAG]","AA[CT]","GA[CT]","GA[AG]",
             "CA[GA]","TG[TC]","TC[TCAG]|AG[CT]","TT[TC]","AT[ACT]",
             "CT[TCAG]|TT[AG]","ATG","AC[TCAG]","AA[AG]","TGG","GT[TCAG]",
             "CA[TC]","TA[TC]","CG[TCAG]|AG[GA]")

data <- data.frame(aanames,short,sequence)

found = sapply(data$sequence,grep,codons)
data$amount <- sapply(found,length)
print(data)

#You can choose a type of plot.
#plot(data$amount, xaxt="n", type = "h",
#     main="The amount of amino acids in the gene",xlab="Amino acids",
#     ylab="Frequency", col="Purple")
#axis(1, at = 1:20, labels = data$short, col="Blue")

p2 <- ggplot(data,aes(x=short, y=amount, fill=amount),xlab="Amino acids",
             ylab="Frequency") + geom_bar(stat = "identity")

p2 + labs(x = "Amino acids", y = "Frequency",fill = "Amount",
          title = "The amount of amino acids in the gene")


