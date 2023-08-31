# just for testing manual morphological analysis

readMorph <- function(lang) {
	m <- read.table(lang, sep="\t", header = TRUE, stringsAsFactors = FALSE, quote = "")
	long <- c()
	for (i in 1:nrow(m)) {
		long <- c(long, rep(m[i,3], m[i,2]))
	}
	table(unlist(strsplit(long," ")))
}

# example usage

readMorph("../morphology/ban.bible.txt")