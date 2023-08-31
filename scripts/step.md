Experiments of automatic comparison for chinese and german bible texts
===========

### Introduction

A goal of my research with the topic of content interrogative constructions is to test, if it is feasible to use computational methods for identifying the interrogative constructions between languages automatically and correctly. So far four tests between 4 Chinese and German texts have been put into practice, which respectively base on IBM Model I and II -- methodes for extraction accroding to the **co-occurences** of words. These tests yield different results, while various types of faults also surface.

In following text, I will firstly introduce the computational methods of the four tests. The second part consists of steps of each experiment. Finally, the results will be summarized and the errors are categorized. Several hypothesis and questions arisen during the experiments are mentioned at last.      

### Computational methods

**Key Words**: co-occurence statistics; estimated position (tiedemann1999a: 215)

**Note**: 

> "frequencies in (comparative) linguistics tend to show a strongly skewed, non-normal distribution, mostly Zipfian or negative exponential." (prokic_cysouw2013a: 150)

#### IBM Model I

#### IBM Model II

### Tests

The so-far conducted experiments are as follows:

*- Fast-Alignment*:

1. manually check the results from 'tables', with helo from R-loop;

2. insert space between every character in zho texts, then the same procedure as the first test;

3. create inventories for each texts using bash, to see wether wether the output with a high frequency is a QW;

*- qlcMatrix*:

4. in bash to see the correspondence of every word, without taken the position of words into consideration .

#### Pre-steps

Before the bible texts are to be input for the automatic comparison, several manual preparations are necessary. This hand-operated work provides the basis for the computational programs to identify and sort out the corresponding content interrogative constructions.

For the basis texts I've chosen languages which I can interpret without difficulties, i.e. two texts respectively from Chinese, German and English. Since Spanish belongs to a different language family and its grammars are easily accessible, a Spanish translation is also selected as the example. 

From these seven texts 743 contexts in total are verified with content interrogative constructions after the manual check. **?necessary to describe the construction of texts in corpus?** A column is inserted between the verse number and the sentence part, in which the identified interrogative hits are written down. During this step, some special cases should be paied extra attention:

1. Not all 743 contexts contain an content interrogative coding in every sample text. Some of them are translated into other expressions, which means for these contexts there is no longer an interrgoative utterance in the translation. In this situation, the pertaining verses are marked by a tilde in the second column as the counterpart to the interrgative matches in other texts.

2. Occasionally, there are more than one content interrgativ context in a verse. To ease the computational process, these verses are separated into a new line. Their verse number is extended by letters according to the amount of questions, e.g. "40007016a", "40007016b".

3. Regarding the second circumstance above, the corresponding verses in other translations do not always comprise multiple content interrogative contexts. In order to keep the uniformity of examples, a new line with the extended verse number is still be created with a tilde in the second column for these verses, but the sentence part remains blank.

After the above by hand operated procedures, seven texts of four languages are prepared with the markings of 743 interrogative contexts. Notice, the input data of the following tests are the raw texts, which are directly exported from the Bible Corpus. The manual marked translations are used for the examination of the automatic output and for the comparison of the results in the next following steps.

#### Fast-Alignment

The first three tests are conducted with the program **Fast-Alignment**, which is built on the theories of **IBM Model II**. The program is run in bash. Notice, all to be input texts should be stored in the directory 'infile' under the subdirectory 'texts'. For the ouput of results I bulid a folder named 'outfile'. The command in bash is shown below:

![Conduct Fast-Alignment in Bash](https://user-images.githubusercontent.com/33869669/74651824-fe2b3980-5184-11ea-8678-797e0cd5dca8.png)

The output results consists of three folders:

- **pairwise**: As described above, the position of words is an important element for the consideration of IBM Model II. The data in 'pairwise' illustrate the correspondences between words in terms of their position in sentences.        

- **multiple**: Words and their parallel counterparts of the same verse in all other texts are intuitively presented in this folder.     

- **tables**: On the basis of the computationally identified correpondences between all input texts, the aligned words of every context (verse) are further classified into groups in 'table' folder. Datas from this folder will be input into the R loop for the analysis. 

For the later comparison the files from 'multiple' and 'table' are essential.

#### R loop for sorting the ouput results

In the three folders creating by fast-alignment, each verses in the new testament possesses now a file with the result from the automatic comparison, from which 743 contexts/verses contain a content interrogative utterance. It will be an enormous work to sort out the data needed for the research from these 3013 files by hand, not to mention to compare them with the basic data from the manual check in pre-steps. To ease the manual labour, some commands in R are used as following.

```
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
	file <- paste0("~/Desktop/zhoDeuOutput/tables/", satznummer, ".csv")
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
	file <- paste0("~/Desktop/zhoDeuOutput/tables/", satznummer, ".csv")
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
			name <- paste0("~/Desktop/zhoDeuQW/", satznummer, "_", n, "_", g, ".csv")
			write.table(sprachen, file = name, sep = "\t", quote = FALSE, row.names = FALSE)
		}
	}
}

# 13.01.20 test: take only deu texts as basefiles
alltexts <- c("deu-x-bible-schlachter.txt", "deu-x-bible-newworld.txt")
allbasefiles <- sapply(alltexts, readBasefile, simplify = FALSE)
#

# USAGE

alltexts <- c("deu-x-bible-schlachter.txt", "deu-x-bible-newworld.txt", "zho-x-bible-new.txt", "zho-x-bible-contemp.txt")
allbasefiles <- sapply(alltexts, readBasefile, simplify = FALSE)

# example usage
extractWords("40002002", basistext = alltexts[1], check = allbasefiles[[1]])
extractWords("40002002", basistext = alltexts[2], check = allbasefiles[[2]])
extractWords("40002002", basistext = alltexts[3], check = allbasefiles[[3]])
extractWords("40002002", basistext = alltexts[4], check = allbasefiles[[4]])


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
```

What the R loops above have conducted is to read the interrogative codings written in the second column of the Chinese and German basis files, then extract their counterparts in the results from the fast-alignment programm. The computational alignment of content interrogative constructions between four texts are now more clearly presented. An example of the verse 40002002 is as below.

```
V1	V3
deu-x-bible-newworld.txt	Wo
deu-x-bible-schlachter.txt	Wo
zho-x-bible-contemp.txt	哪裡
zho-x-bible-new.txt	哪裡
```

##### Test. 1: Manual check for the results from fast-alignment

In the first part of the first test, the four manual processed files of all four input texts are taken as basis files for the extraction in R loops. However,  


In the seond part, only German basis files are used to extract the aligned interrogative constructions in R. The intention is to test whether it is reliable to use German texts as the basis for further language sampling.  


##### Test. 2: Insert spaces between every character in Chinese texts

The fast-alignment programm recognizes the token between two spaces as a "word" and performs the alignment regarding them. It is problem-free for the most of germanic languages, since they apply spaces for the separation of words. By constrast, the so-call "morphologically isolating" or analytic languages, such as Chinese, Vietnamese, do not use spaces for the writing. In terms of this kind of languages, the Bible Corpus has used some programms **?what kind of programms?** to add spaces between characters / letters, however, some decision of those programms can not be understood by the native speakers. For example, the content interrogative construction in Chinese "*为什么*" (why; literally: "for what"), which is used to ask for reasons, are sometimes divided into "*为*" and "*什么*", but in some contexts or some texts maintains together. This case leads to at least two problems: 1) In respect of the cross-linguistic comparison, the fast-aglignment takes them as two question constructions and produces different association; 2) Within a language, such an inconsistent separation of texts harms the possibility to conduct a diachronic xomparison.

In order to find out how the spaces in Chinese texts, especiall which of them are obviously added in the wrong places, impact the results of the fast-aglinment, I have tried to insert a space between every character in Chinese input texts and run the fast-alignment again (the reason why not just delete all spaces is as the explaination before -- the fast-alignment cannot recognize "words" without spaces). Then the same R loops are used for the extraction.

###### An extra test for analytic languages (not finished!) 

Regarding the problem of the space as sepearator, an extra computational alignment is performed between four languages -- Chinese, Vietnamese, Yoruba and Sango, which do not apply spaces for writing. The original texts from the Bible Corpus are used for input and no more change for spaces is made.

An another goal of this extra experiment is to test, wether it is necessary to use different languages as basis files for the comparison in the later data collection.

##### Test. 3: Create inventories of content interrogative constructions for every text

In the first two tests, the fast-aglignment extracts question words in each context / verse, which cannot provide an whole impression about the usage of content interrogative in a language and, in terms of my research in a Bible text. In order to summary all conent interrogative words, which are identified by the fast-alignment, and to count their frequency, the third experiment uses a simple command in bash to create a inventory of QW for every text. The input for this test is the data from the R loops process. The command in bash to create a inventory for Bible *zho-contempt* is as below:

```
zhoDeuQW mac$ grep contempt * >>../inv.txt
zhoDeuQW mac$ cut -f2 ../inv.txt | tr [:upper:] [:lower:] | sort | uniq -c | sort -nr >../ invtotal.txt
```

The procedure of each step is:

1) find all results from *zho-contempt* in the directory *zhoDeuQW* and write to the file `inv.txt`

2)	take the second column from inv.txt;

	translate the upper case to the lower case;
	
	sort;
	
	print not-repeated word and count the frequency;
	
	sort according to the numeric order and reverse (from big nummber to small number);
	
	write to the file `invtotal.txt`.

The manual check is needed after inventories are generated. The goal is to verify wether the words with a relative high frequency are truely content interrogative constructions. Of course, it should be noticed that several interrogative constructions appear only few times, or even only one time, in the Bible texts.

#### qlcMatrix

The first three experiments reveal that it is possible to extract content interrogative constructions from the parallel texts with the computational approaches, i.e. fast-alignment, however, the automatic results stills need a huge manual work to check the correctness which of every text and of the three above tests is not assured either. In order to simplify the parameters for the computational methods to execute the alignment, the fourth test applies the **qlcMatrix** programm, which is based on the IBM Model I and will exclude the impact of positions of words. 

The qlcMatrix prgramm is run in R. The commands and some example are shown below.

```
> library(qlcMatrix)
Loading required package: Matrix
Loading required package: slam
Loading required package: sparsesvd
> ?qlcMatrix
starting httpd help server ... done
> deu <- read.text("~/Documents/GitHub/paralleltext/bibles/corpus/deu-x-bible-albrecht.txt") > head(deu)
40001001 "Dies ist das Buch der Geschichte Jesu Christi , des Sohnes Davids , des Sohnes Abrahams ." 40001002 "Abraham war der Vater Isaaks . Isaak war der Vater Jakobs . Jakob war der Vater Judas und seiner Brüder ." 40001003 "Juda war — durch Thamar — der Vater des Perez und Serah . Perez war der Vater Hezrons . Hezron war der Vater Rams ." 40001004 "Ram war der Vater Aminadabs . Aminadab war der Vater Nahessons . Nahesson war der Vater Salmas ." 40001005 "Salma war — durch Rahab — der Vater des Boas . Boas war — durch Ruth — der Vater Obeds . Obed war der Vater Isais ." 40001006 "Isai war der Vater des Königs David . David war — durch Urias Witwe — der Vater Salomos ."
> eng <- read.txt("~/Documents/GitHub/paralleltext/bibles/corpus/eng-x-bible-amplified.txt") Error in read.txt("~/Documents/GitHub/paralleltext/bibles/corpus/eng-x-bible-amplified.txt") :
could not find function "read.txt"
> eng <- read.text("~/Documents/GitHub/paralleltext/bibles/corpus/eng-x-bible-amplified.txt")
> sim <- sim.words(deu, eng)
> str(sim)
Formal class 'dgCMatrix' [package "Matrix"] with 6 slots
..@ i
..@ p
..@ Dim
..@ Dimnames:List of 2
.. ..$ : chr [1:11733] "!" "\"" "'" "'s" ...
.. ..$ : chr [1:10466] "!" "$" "(" ")" ...
..@ x : num [1:1577876] 28.04 18.08 7.09 2.16 -2.13 ... ..@ factors : list()
> sim@Dimnames[[2]][1:100]
: int [1:1577876] 0 1 2 3 4 5 6 7 8 9 ...
: int [1:10467] 0 2779 2836 9291 15746 26870 26897 29017 39479 39539 ... : int [1:2] 11733 10466
[1] "!"
[5] ","
[9] "1,260"
[13] "10,000,000" [17] "153"
[21] "276"
[25] "4,000"
[29] "450"
[33] "6"
[37] "72"
[41] "9:00"
[45] "["
[49] "aaron"
[53] "abandoning" [57] "abdomen" [61] "abhorrent" [65] "abide"
[69] "abilene"
[73] "ablaze"
[77] "abode"
[81] "abolishing" [85] "abominations" [89] "abounds"
[93] "abraham’s"
[97] "absolute"
"$" "("
"-" "--"
"1,500" "1,600" "12,000" "144" "2,000" "200" "3,000" "300"
"400" "42"
"5" "5,000" "666" "6:00" "80,000" "9,300"
":" ";"
"]" "a" "abaddon" "abandon" "abandonment" "abased" "abel" "abhor" "abhorring" "abia" "abides" "abiding" "abilities" "ability" "able" "abnormal" "abodes" "abolish" "abominable" "abominates" "abound" "abounded" "about" "above" "abroad" "absence" "absolutely" "absolved"
")"
"."
"10,000" "144,000" "200,000,000" "3:00"
"430" "50,000" "700"
"900"
"?"
"a.m." "abandoned" "abba" "abhorrence" "abiathar" "abijah" "abiud" "aboard" "abolished" "abomination" "abounding" "abraham" "absent" "absolving"
> sort(sim["warum",],descreasing = T)[1:10]
Error in sort.int(x, na.last = na.last, decreasing = decreasing, ...) :
unused argument (descreasing = T)
> sort(sim["warum",],decreasing = T)[1:10]
why 64.58206 swayed 10.60123
? 24.97575 troubling 10.60123
lama sabachthani
molest praiseworthy 10.60123 10.60123
> sort(sim["was",],decreasing = T)[1:10] what ? whatever
das 8.455957 eckstein 5.715973
bauleute gerechtigkeit
worin 6.291278 gottes 5.452550
nearer 25.68563
> sort(sim["welcher",],decreasing = householder rouse burglar 29.63677 29.63677 25.68563 undermined wake critical 25.68563 25.68563 18.13499
T)[1:10]
lessons 25.68563 guidance 18.13499
20.39485 exhibitions 20.39485
20.39485 20.39485 inanimate inconsistent 20.39485 20.39485
20.39485 mete 20.39485
7.023808 goldenen 5.715973
6.912646 verworfen 5.591386
> sort(sim["welche",],decreasing = T)[1:10]
5 alliances complicity condoning
13.05949 untying 10.60123
13.05949 do
```







