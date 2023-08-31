# FUNCTIONS

readBasefile <- function(text) {
	basefilepath <- paste0("~/Desktop/basisfile/", text)
	basefile <- read.delim(basefilepath, quote = "", sep = "\t", skip = 11, header = FALSE)
	return(basefile)
}

extractWords <- function( satznummer
						, check = basefile
						, basistext = text
						) {

	# correct manually prepared basefile
	check$V2 <- as.character(check$V2)
	# allow for extra letters after number
	check$V1 <- gsub("[a-z]", "", check$V1)
	
	# extract word from basefile
	wort <- check[check$V1 == satznummer, 2]
	# split by spaces
	wort <- unlist(strsplit(wort, split = " "))
	
	# read output from alignment
	file <- paste0("~/Desktop/Goutput/tables/", satznummer, ".csv")
	table <- read.delim(file, quote = "", header = FALSE)
	table$V3 <- as.character(table$V3)
	
	# get all groups from the alignment
	gruppenMitNamen <- c()
	for (w in unique(wort)) {
		gruppe <- table[table$V1 == basistext  & tolower(table$V3) == w, 4]
		names(gruppe) <- rep(w, times = length(gruppe))
		gruppenMitNamen <- c(gruppenMitNamen, gruppe)
	}

	return(gruppenMitNamen)
}

extractFromAlignment <- function(satznummer, texts = alltexts, basefiles = allbasefiles) {
	
	# merge groups found through different texts
	numberOfTexts <- length(texts)
	allGroups <- c()
	for (n in 1:numberOfTexts) {
		gruppenMitNamen <- extractWords(satznummer, basistext = texts[n], check = basefiles[[n]])
		allGroups <- c(allGroups, gruppenMitNamen)
	}
	uniqueGroups <- unique(allGroups)
	namesGroups <- c()
	for (g in uniqueGroups) {
		namesG <- paste(names(allGroups[allGroups == g]), collapse = "_")
		namesGroups <- c(namesGroups, namesG)
	}
	
	names(uniqueGroups) <- namesGroups
	
	# read output from alignment
	file <- paste0("~/Desktop/Goutput/tables/", satznummer, ".csv")
	table <- read.delim(file, quote = "", header = FALSE)
	table$V3 <- as.character(table$V3)
	
	# write results to file
	if (length(uniqueGroups > 0)) {		
		for (i in 1:length(uniqueGroups)) {
			g <- uniqueGroups[i]
			n <- names(uniqueGroups)[i]
			frageworter <- table[table$V4 == g,]
			sprachen <- aggregate(V3 ~ V1, data = frageworter, FUN = paste, collapse = " ")
	
			# export results
			name <- paste0("~/Desktop/QW von Goutput/", satznummer, "_", n, "_", g, ".csv")
			write.table(sprachen, name, sep = "\t", quote = FALSE, row.names = FALSE)
		}
	}
}

# USAGE

alltexts <- c("deu-x-bible-schlachter.txt", "eng-x-bible-common.txt")
allbasefiles <- sapply(alltexts, readBasefile, simplify = FALSE)

# example usage
extractWords("40002002", basistext = alltexts[1], check = allbasefiles[[1]])
extractWords("40002002", basistext = alltexts[2], check = allbasefiles[[2]])

extractFromAlignment("40002002", alltexts, allbasefiles)
extractFromAlignment("40027023")

# use with multiple verses
verses <- c("40002002", "40002004", "40003007", "40005013", "40005046", "40005047")

# Typical loop in most programming languages
for (v in verses) {
	extractFromAlignment(v)
}

# more typical for R
sapply(verses, extractFromAlignment)

# read all verse numbers

allVerses <- readLines("/Users/mac/Documents/Content Interrogative/Bible/743.txt")
allVerses <- gsub("[a-z]","", allVerses)
allVerses <- unique(allVerses)

sapply(allVerses[1:15], extractFromAlignment)



# ===========
# old code
# ===========
satznummer <- "40005013"

file <- paste0("~/Desktop/Goutput/tables/", satznummer, ".csv")
basistext <- "deu-x-bible-schlachter.txt" 
wort <- "womit" # soll die 2. Spalte von mein deu-schlachter.txt sein

table <- read.delim(file, quote = "", header = FALSE)
gruppe <- table[table$V1 == basistext  & table$V3 == wort, 4]
frageworter <- table[table$V4 == gruppe,]
sprachen <- aggregate(V3 ~ V1, data = frageworter, FUN = paste, collapse = " ")
name <- paste0("~/Desktop/", satznummer, ".csv")
write.table(sprachen, name, sep = "\t", quote = FALSE, row.names = FALSE)


# Beispiel "40002002"


# how to append a row to a csv file (when QW of a language belongs to a different group)
# Bsp "40005013" bar-x-bible "wie" 
satznummer <- "40005013"
file <- paste0("~/Desktop/Goutput/tables/", satznummer, ".csv")
table <- read.delim(file, quote = "", header = FALSE)
table[table$V1 == "bar-x-bible.txt",] # to find the QW and its group in bar-txt
bar <- table[table$V1 == "bar-x-bible.txt" & table$V4 == "2",] # write all words of the same group in bar-txt
all <- aggregate(V3 ~ V1, data = bar, FUN = paste, collapse = " ")
write.table(all, name, sep = "\t", quote = FALSE, row.names = FALSE, append = TRUE, col.names= FALSE)
