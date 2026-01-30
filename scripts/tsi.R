#This script calculates the TSI score from HPA

###
###
###Libraries and parameters
set.seed(1234)
options(scipen = 999)
library(data.table)
library(optparse)

###
###
###Arguments
option_list = list(
  make_option("--expData", type="character", default=NULL,
              help="Path to expression file from HPA"),
  
  make_option("--entity", type="character", default=NULL,
              help="Name of entity"),
  
  make_option("--outPath", type="character", default=NULL,
              help="Path to output file")
)

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

if (is.null(opt$expData) | is.null(opt$entity) | is.null(opt$outPath)) {
  print("You have to specify all inputs. Here is the help:")
  print_help(opt_parser)
  quit()
}

###
###
###Main
expData <- fread(opt$expData, data.table = FALSE)
gene_names <- unique(c(expData$Gene[expData[,3] == opt$entity & expData$nTPM >= 1]))
tsi <- c()
for(i in 1:length(gene_names)){
  tsi <- c(tsi, expData$nTPM[expData$Gene == gene_names[i] & expData[,3] == opt$entity] / sum(expData$nTPM[expData$Gene == gene_names[i]]))
}
spec <- data.frame(gene_names, tsi)
write.table(spec, opt$outPath, sep = "\t", append = FALSE, quote = FALSE, col.names = TRUE, row.names = FALSE)
