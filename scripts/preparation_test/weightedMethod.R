# read data
all <- read.table("../allQuestionwords.txt", quote="", sep="\t")

library(qlcMatrix)
s <- sim.obs(all, method = "weighted")
d_whole <- as.dist(1-s)

# cluster
library(fpc)

# first try 2 to 75 clusters
clusters <- pamk(d_whole, 2:75)

# see how many cluster get the best results; 'b' with punkt
plot(1:length(clusters$crit), clusters$crit, type = "b")

# =======================

# use German data for reference
deu <- read.table("../questionwords/check-deu-schlachter.txt", sep="\t", quote = "", row.names = 1)

skip <- scan("../verse/skip.txt", what = "character")
sel <- !(rownames(deu) %in% skip)
deu <- deu[sel,]

library(cluster)
# 8 clusters with 'pam' algorithm;
cl_whole <- pam(d_whole, 7)

info <- cl_whole$silinfo$widths
info <- info[rownames(deu),]
info <- cbind(info,deu)
info <- info[,-5]
# write.table(info, "../sandbox/clusterWholeWeighted.txt", sep = "\t" ,quote = F)

# =========== Morph ===============

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
allsplitted <- as.matrix(allsplitted)
rownames(allsplitted) <- rownames(allmorph)

# =============== Visualization =========

library(qlcVisualize)

# using partitioning table 'info' from "clusterWhole.R"
# using table with morphemes 'allsplitted' from "morph.R"

clusternr <- 6

selection <- info$cluster == clusternr
d <- dist(allsplitted[selection,], method="manhattan")
p <- cmdscale(d)/100

text <- "deu.schlachter.txt"
words <- all[selection,text]
versenr <- rownames(info[selection,])

lmap(	points = p
      , data = words
      , position = "bottomleft"
      , main = text
#      , labels = versenr 
#      , font = "LiSongPro"
#      , file.out = file.path("../sandbox",paste(text, clusternr, ".pdf"))
)

# also useful: 
# labels = words

# identify the point; ''labels in the lmap should be skiped
identify(p)
# click points in the graph
# escape,print the number of points, e.g. '77'
# find the corresponding verse
info[selection,][77,]









