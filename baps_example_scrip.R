#Run hierBAPS.
#install.packages('rhierbaps')
library(rhierbaps)
library(ggtree)
library(phytools)
library(ape)
set.seed(1234)

#Loading data
fasta.file.name <- system.file("extdata", "seqs.fa", package = "rhierbaps")
snp.matrix <- load_fasta(fasta.file.name)
  
#data(woodmouse)
#woodmouse.snp.matrix <- load_fasta(woodmouse)

#To run hierBAPS with 2 levels and 20 initial clusters we run
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 2, n.pops = 20, quiet = TRUE)
head(hb.results$partition.df)

#hierBAPS can also be run until the algorithm converges to a local optimum as
#hb.results <- hierBAPS(snp.matrix, max.depth = 2, n.pops = 20, n.extra.rounds = Inf, quiet = TRUE)

#We can also check how long hierBAPS takes to run on the test dataset of 515 samples and 744 SNPs.
#system.time(hierBAPS(snp.matrix, max.depth = 2, n.pops = 20, quiet = TRUE))

#Plotting results
newick.file.name <- system.file("extdata", "seqs.fa.treefile", package = "rhierbaps")
iqtree <- phytools::read.newick(newick.file.name)

#A simple coloured tree allows us to see the top level cluster assignment from hierBAPS.
gg <- ggtree(iqtree, layout = "circular")
gg <- gg %<+% hb.results$partition.df
gg <- gg + geom_tippoint(aes(color = factor(`level 1`)))
gg

gg <- ggtree(iqtree, layout = "circular", branch.length = "none")
gg <- gg %<+% hb.results$partition.df
gg <- gg + geom_tippoint(aes(color = factor(`level 1`)))
gg <- gg + theme(legend.position = "right")
gg <- gg + geom_tiplab(aes(label = `level 2`), size = 1, offset = 1)
gg

plot_sub_cluster(hb.results, iqtree, level = 1, sub.cluster = 9)

#Finally, we can inspect the log marginal likelihoods given for each level.
hb.results$lml.list

#Caculating assignment probabilities
#hb.results.woodmouse <- hierBAPS(woodmouse.snp.matrix, max.depth = 2, n.extra.rounds = Inf, quiet = TRUE, assignment.probs = TRUE)
#head(hb.results.woodmouse$cluster.assignment.prob[[1]])

#Saving results
write.csv(hb.results$partition.df, file = file.path(tempdir(), "hierbaps_partition.csv"), col.names = TRUE, row.names = FALSE)
save_lml_logs(hb.results, file.path(tempdir(), "hierbaps_logML.txt"))
