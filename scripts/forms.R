
all <- read.delim2("../allQuestionwords.txt", quote="")
id <- scan("../typicalID.txt", what = "character")

typical <- all[rownames(all) %in% id,][id,]

compare <- function(a,b) {
	forms <- typical[c(a,b),]
	AB <- apply(forms,2,function(x){grepl(x[1],x[2])})
	return(sum(AB, na.rm = TRUE))	
}

same <- function(a,b) {
	sum(typical[a,] == typical[b, ], na.rm=T)
}

diff <- matrix(nrow = length(id), ncol = length(id), dimnames = list(id,id))
sim <- matrix(nrow = length(id), ncol = length(id), dimnames = list(id,id))


for (i in id) {
	for (j in id) {
		sim[i,j] <- same(i,j)
		diff[i,j] <- compare(i,j) - sim[i,j]
	}
}



write.table(diff, "diff.txt", sep = "\t", quote=F)
write.table(diff-t(diff), "diff2.txt", sep = "\t", quote = F)
write.table(sim, "sim.txt", sep = "\t", quote=F)
