# check QW of a certain level_2 cluster

# QW of a level_2 cluster or level_3 cluster

v1 <- as.integer(rownames(out2[out2[,1] == 1,]))

v2 <- as.integer(rownames(out2[out2[,1] == 2,]))

v3 <- 114



# the first five languages in all

all[v1,1:5]

# choose a language with its index

lan <- 20

# compare qw in other verses and words used for a certain level_2 cluster
# the number is the index of the language
# the 1. column is words used for all other verses, the 2. is for the wanted level_2 cluster

cbind(table(all[-v1,lan]), table(all[v1,lan]))

# compare words of a level_2 cluster and its level_1 cluster
# the 1. column is levels_1, the 2. is level_2
# cbind(table(all[selection, 12]), table(all[tmp, 12])) the first column conclude level 2 too!

cbind(table(all[selection[-v1], lan]), table(all[v1, lan]))

# 1. QW in all verses ; 2. other QW in corresponding level_1 ; 3. level_2

cbind(table(all[,lan]), table(all[selection[-v1], lan]), table(all[v1, lan]))

# compare multiple sub-clusters at the same time
cbind(table(all[,lan]), table(all[v1, lan]),table(all[v2, lan]),table(all[v3, lan]))