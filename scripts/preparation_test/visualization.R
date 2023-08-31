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
#      , levels = 1
#      , cex = 1
#      , labels = versenr 
#      , font = "LiSongPro"
#      , file.out = file.path("../sandbox",paste(text, clusternr, ".pdf"))
)

# also useful: 
# labels = words
# levels = 1 without lines around points
# cex adjust the point size

# identify the point; ''labels in the lmap should be skiped
identify(p)
# click points in the graph
# escape,print the number of points, e.g. '77'
# find the corresponding verse
info[selection,][77,]


