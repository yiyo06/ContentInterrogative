# location of data files
datadir <- "../questionwords"

# list all files, but only with 'check' in the name
f <- list.files(datadir) 

# read only second column
getColumn <- function(file) {
	filepath <- file.path(datadir, file)
	read.table(filepath, sep = '\t', quote = '')[,2]
}

# collect all columns
all <- sapply(f,getColumn)

# '~' replaced by 'NA'
all[all=="~"] <- NA

# add numbers for verses as rownames
f1 <- file.path(datadir, f[1])
rownames(all) <- read.table(f1, sep = '\t', quote = '')[,1]

# all words should be in lower case
all <- tolower(all)

# remove duplicates and low-data 
skip <- scan("../verse/skip.txt", what = "character")
all <- all[!rownames(all) %in% skip,]

# column names
colnames(all) <- substr(colnames(all),7,100)

# save results to a file
write.table(all, file = "../allQuestionwords.txt", quote = F, sep = "\t")

#==================== MORPHOLOGY ==============

# read questionwords
all <- read.table("../allQuestionwords.txt", sep = "\t", quote = "", header = TRUE)

# names of morphology analyses
morph.files <- list.files("../morphology/")

# replace words with morphological analysis
expand <- function(lang) {
  allforms <- as.character(all[,lang])
  file <- file.path("..","morphology",lang)
  morphs <- read.table(file, sep = "\t", quote = "", header = TRUE, row.names = 1)
  sep <- morphs[allforms,"MORPHOLOGY"]
  return(sep)
}

# apply to all languages and write result as new table
allmorph <- sapply(morph.files, expand)
write.table(allmorph, file = "../allMorphology.txt", quote = F, sep = "\t")


