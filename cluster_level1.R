# combined of 'clusterWhole', 'morph' and 'visualization'

# read data
all <- read.table("../allQuestionwords.txt", quote="", sep="\t")

library(qlcMatrix)
s <- sim.obs(all, method = "hamming")
d_whole <- as.dist(1-s)

# cluster
library(fpc)

# first try 2 to 75 clusters
clusters <- pamk(d_whole, 2:75)

# see how many clusters are the optimal result; 'b' with points
plot(1:length(clusters$crit), clusters$crit, type = "b", xlab = "Number of clusters", ylab = "Average silhouette width")

# =======================

# use English data for reference
eng <- read.table("../questionwords/check-eng-common.txt", sep="\t", quote = "", row.names = 1)

skip <- scan("../verse/skip.txt", what = "character")
sel <- !(rownames(eng) %in% skip)
eng <- eng[sel,]

library(cluster)
# 6 clusters with 'pam' algorithm;
cl_whole <- pam(d_whole, 6)

# check silhouette plot of pam
plot(cl_whole)

info <- cl_whole$silinfo$widths
info <- info[rownames(eng),]
info <- cbind(info,eng)
info <- info[,-5]

#write.table(info, "../sandbox/clusterWholeHammingEng.txt", sep = "\t" ,quote = F)


# use German data for reference
deu <- read.table("../questionwords/check-deu-schlachter.txt", sep="\t", quote = "", row.names = 1)

skip <- scan("../verse/skip.txt", what = "character")
sel <- !(rownames(deu) %in% skip)
deu <- deu[sel,]

library(cluster)
# 6 clusters with 'pam' algorithm;
cl_whole <- pam(d_whole, 6)

info <- cl_whole$silinfo$widths
info <- info[rownames(deu),]
info <- cbind(info,deu)
info <- info[,-5]
# write.table(info, "../sandbox/clusterWholeHamming.txt", sep = "\t" ,quote = F)

# use Chinese data for reference
zho <- read.table("../questionwords/check-zho-contemp.txt", sep="\t", quote = "", row.names = 1)

skip <- scan("../verse/skip.txt", what = "character")
sel <- !(rownames(zho) %in% skip)
zho <- zho[sel,]

library(cluster)
# 6 clusters with 'pam' algorithm;
cl_whole <- pam(d_whole, 6)

info_zho <- cl_whole$silinfo$widths
info_zho <- info_zho[rownames(zho),]
info_zho <- cbind(info_zho,zho)
info_zho <- info_zho[,-5]


# ======== Morph ==================

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

# ============ Visualization  ==========

library(qlcVisualize)

# use partitioning table 'info' from "clusterWhole.R"
# use table with morphemes 'allsplitted' from "morph.R"


# load labels
label <- read.delim2("../LabelContext.txt", quote = "")
label <- label[order(label$verse),]

# load 38 typical ID
typical <- scan("../typicalID.txt", what = "character")

clusternr <- 2

#move MASS to MANNER
selection <- (label$cluster == clusternr) & label$verse %in% typical
#selection <- (label$cluster == clusternr) & !is.na(label$label)
#selection <- (label$cluster == clusternr)

#show 38 typical contexts only
#selection <- (info$cluster == clusternr) & label$verse %in% typical

#show contexts with labels (LabelContext) only
#selection <- (info$cluster == clusternr) & !is.na(label$label)

#show all contexts
#selection <- (info$cluster == clusternr)

d <- dist(allsplitted[selection,], method="manhattan")
p <- cmdscale(d)/100

text <- "eng.common.txt"
words <- all[selection,text]
versenr <- rownames(info[selection,])

lmap(	points = p
      , data = label$label[selection] #words
#      , position = "bottomleft"
#      , main = text
#     , draw = 5
      , legend = FALSE
      , note = FALSE
      , levels = 1
#      , cex = 0.5
      , labels = label$label[selection]
 #     , labels = substring(label$label[selection],first = 6)  #versenr 
#      , font = "LiSongPro"
#      , file.out = file.path("../sandbox",paste(text, ".hamming", clusternr, ".pdf"))
)

# also useful: 
# labels = words
# levels = 2 without lines around points
# cex = 1 adjusts the point size

# identify the point; ''labels in the lmap should be skipped
identify(p)
# click points in the graph
# escape,print the number of points, e.g. '77'
# find the corresponding verse
info[selection,][77,]






