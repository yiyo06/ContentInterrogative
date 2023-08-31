library(qlcVisualize)

# using partitioning table 'info' from "clusterWhole.R"
# using table with morphemes 'allsplitted' from "morph.R"

clusternr <- 3

selection <- info$cluster == clusternr

# ========
# apcluster
library(apcluster)

#apcluster for all
p <- princomp(t(allsplitted[selection,]))$loadings[,1:2]
d <- dist(allsplitted, method = "manhattan")

# apcluster for level 2 ?
d <- dist(allsplitted[selection,], method = "manhattan")

# since apcluster takes the similarity matrix, here 1-as.matrix(d)
cl_ap <- apcluster(1-as.matrix(d))

# versenumber of each cluster
cl_ap@clusters[[35]]

# detail of each cluster
# not suitable for level 2 apcluster!
info[cl_ap@clusters[[35]],1:4] # or with sentences: info[cl_ap@clusters[[35]],1:5] 

# for comparison the clustering of pam and apcluster
table(labels(cl_ap), cl_whole$clustering)

# ========
language_nr <- 21
text <- colnames(all)[language_nr]
words <- all[selection,text]
versenr <- rownames(info[selection,])

# morphs <- as.matrix(splitted[[language_nr]])
# morphs <- morphs[selection,]

# =========
# Further subdivision with pamk (again); level 2
# Using distance "d" from morphology as above

clus_small <- pamk(d, 2:10)
plot(1:10, clus_small$crit, type="b")

# =======
# visualisation

lmap(	points = p
      , data = words
      , position = "bottomleft"
      , main = text
      , labels = words # clus_small[[1]]$clustering
#     , draw = 10
#     , font = "LiSongPro"
#     , file.out = file.path("sandbox",paste(text,".pdf"))
)

# identify(p)
# info[selection,][77,]

# ==========
# output smaller clusters

out <- clus_small[[1]]$silinfo$widths
write.table(out, "../sandbox/clusterX.txt", sep = "\t" ,quote = F)
