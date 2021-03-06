#Run hierBAPS.
#install.packages('rhierbaps')
library(rhierbaps)
library(ggtree)
library(phytools)
library(ape)
set.seed(1234)

#Loading data
fasta.file.name <- "run_alignment_no_resis.fas"
snp.matrix <- load_fasta(fasta.file.name)
  
#To run hierBAPS with 2 levels and 20 initial clusters we run
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 10, n.pops = 50, quiet = TRUE)
head(hb.results$partition.df)
      
#hierBAPS can also be run until the algorithm converges to a local optimum as
#hb.results <- hierBAPS(snp.matrix, n.cores = 4, max.depth = 2, n.pops = 20, n.extra.rounds = Inf, quiet = TRUE)
    
#We can also check how long hierBAPS takes to run on the test dataset of 515 samples and 744 SNPs.
#system.time(hierBAPS(snp.matrix, n.cores = 6, max.depth = 4, n.pops = 100, quiet = TRUE))
    
#Plotting results
newick.file.name <- "run_alignment_no_resis.fas.treefile"
iqtree <- phytools::read.newick(newick.file.name)
iqtree <- phytools::reroot(iqtree, 157)
    
#A simple coloured tree allows us to see the top level cluster assignment from hierBAPS.
gg <- ggtree(iqtree, layout = "circular")
gg <- gg %<+% hb.results$partition.df
gg <- gg + geom_tippoint(aes(color = factor(`level 4`)))
gg

gg <- ggtree(iqtree, layout = "circular", branch.length = "none")
gg <- gg %<+% hb.results$partition.df
gg <- gg + geom_tippoint(aes(color = factor(`level 2`)))
gg <- gg + theme(legend.position = "right")
gg <- gg + geom_tiplab(aes(label = `level 2`), size = 1, offset = 1)
gg

plot_sub_cluster(hb.results, iqtree, level = 2, sub.cluster = 40)

#Finally, we can inspect the log marginal likelihoods given for each level.
hb.results$lml.list

#Save
write.csv(hb.results$partition.df, file = file.path(tempdir(), "hierbaps_partition.csv"), col.names = TRUE, row.names = FALSE)
save_lml_logs(hb.results, file.path(tempdir(), "hierbaps_logML.txt"))