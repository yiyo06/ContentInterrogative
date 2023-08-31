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
cl_whole <- pam(d_whole, 6)

info <- cl_whole$silinfo$widths
info <- info[rownames(deu),]
info <- cbind(info,deu)
info <- info[,-5]
# write.table(info, "clusterWhole.txt", sep = "\t" ,quote = F)





