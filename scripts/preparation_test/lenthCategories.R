morph <- read.delim2("../allMorphology.txt")

# average number of morphological elements

len <- function(x){length(strsplit(x, " ")[[1]])}
n <- apply(morph, c(1,2), len)
n[is.na(morph)] <- NA
nmean <- apply(n,1,mean,na.rm=T)

# labels

lab <- read.delim2("../LabelContext.txt", quote="")
lab <- lab[order(lab$verse),]

cats <- names(table(lab[,2]))

# Average lenght of categories

sapply(cats, function(x){mean(nmean[which(lab[,2] == x)])})
