library(admixtools)
library(tidyverse)

# Parse command-line arguments
args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 3) {
  stop("Usage: Rscript script.R <mix_num> <numadmix> <outpop>\nExample: Rscript script.R mix1 1 TC")
}

mix_name <- args[1]
numadmix <- as.integer(args[2])
outpop <- args[3]

# Validate arguments
valid_mix <- c("mix0","mix1", "mix2", "mix3", "mix4","mix5")
valid_outpop <- c("LQ", "TC", "kr_so", "on_na", "WC")

if (!mix_name %in% valid_mix) stop("Invalid mix name! Use one of mix0-mix5")
if (!numadmix %in% 0:5) stop("numadmix must be between 0 and 5")
if (!outpop %in% valid_outpop) stop("Invalid outpop!")

# Configure paths
base_dir <- "/home/xichen/chenxi/onnare_8/15.qpgraph/2ed.qpgraph"
output_dir <- file.path(base_dir, mix_name, outpop)
dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

my_f2_dir <- file.path(base_dir, "5pop")

# Main loop
for (i in 1:50) {
  # Generate unique filenames
  outprefix <- file.path(output_dir, sprintf("%s.%s.run%03d", outpop, mix_name, i))
  pdffile <- paste0(outprefix, ".pdf")
  
  # Computation process
  f2_blocks <- f2_from_precomp(my_f2_dir)
  results <- find_graphs(f2_blocks, numadmix = numadmix, outpop = outpop)
  winner <- results %>% slice_min(score)
  
  # Save results
  write_tsv(winner$edges[[1]], paste0(outprefix, "_edges.tsv"))
  write_lines(paste0('score\t', winner$score[[1]]), paste0(outprefix, "_score.tsv"))
  
  # Generate plot
  pdf(pdffile)
  print(plot_graph(winner$edges[[1]]))
  dev.off()
  
  message("Completed iteration ", i)
}

