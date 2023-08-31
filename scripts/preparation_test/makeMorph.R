# read data
all <- read.table("../allQuestionwords.txt", quote="", sep="\t")

getList <- function(languageNr) {
	forms <- table(all[languageNr])
	forms <- cbind(rownames(forms), forms, rownames(forms))
	colnames(forms) <- c("WORDFORM", "FREQUENCY", "MORPHOLOGY")
	filename <- substr(colnames(all)[languageNr],7,100)
	out <- file.path("../sandbox", filename)
	write.table(forms
				, file = out
				, quote = FALSE
				, row.names = FALSE
				, sep = "\t"
				)
}

getList(13)

#for (i in 1:ncol(all)) {
#	getList(i)
#}


