Rscript --vanilla tsi.R --expData ~/Downloads/rna_tissue_consensus.tsv --entity pancreas --outPath tsiPanc.txt
Rscript --vanilla tsiCell.R --expData ~/Downloads/rna_single_cell_type.tsv --entity /home/andi/Documents/tsi/entities.txt --outPath tsiPancCell.txt
