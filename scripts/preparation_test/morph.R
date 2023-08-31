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


