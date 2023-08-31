library(qlcMatrix)

# read morphology
allmorph <- read.table("../allMorphology.txt"
                       , sep = "\t"
                       , quote = ""
                       , header = TRUE
                       )

# split morphemes into separate columns
splitted <- apply(allmorph, 2, splitStrings
                  , sep=" "
                  , bigrams = F
                  , simplify = T
                  )
splitted <- sapply(splitted, t)

# combine all into one large matrix
allsplitted <- do.call(cbind, splitted)
rownames(allsplitted) <- rownames(allmorph)

# simple manhattan distance
d_morph <- dist(as.matrix(allsplitted), method="manhattan")

# cluster
# first try 2 to 75 clusters
library(fpc)
clusters <- pamk(d_morph, 2:75)

# see how many cluster get the best results; 'b' with punkt
plot(1:length(clusters$crit), clusters$crit, type = "b")

# ========== Investigate clustering =========

# first try 8 or 22 clusters with 'pam' algorithm;
library(cluster)
cl_morph_8 <- pam(d_morph, 8)
cl_morph_22 <- pam(d_morph, 22)

getinfo <- function(clustering) {
  info <- clustering$silinfo$widths
  info <- info[order(rownames(info)),]
}

info_morph_8 <- getinfo(cl_morph_8)
info_morph_22 <- getinfo(cl_morph_22)

# list the QW of each verse of the same cluster
table(all[which(cl_morph_8$clustering == 6),'deu.schlachter.txt'])


