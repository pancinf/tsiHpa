# General Overview
This code computes tissue and cell type specificity of gene expression based on Human Protein Atlas (HPA) data. For cell types multiple are merged (in our case we merged acinar and ductal pancreatic cells to form the "exocrine component").The underlying score is based on the tissue specificity score from Julien et al. (2012,PLoS Biol), but extended for entitiy-specific outcomes (not a tissue agnostic score).

# Required inputs:

## In the "raw" directory:
* rna_tissue_consensus.tsv
* rna_single_cell_type.tsv

Both can be downloaded from HPA website (v. 25).

## In the "entities" directory:
* entities.txt, containing a one-column list of cell types to consider.

# How to use
* Rscript --vanilla tsi.R --expData ../data/raw/rna_tissue_consensus.tsv --entity pancreas --outPath ../data/out/pancreasSpec.txt

-> This example computes tissue (pancreas) scores
* Rscript --vanilla tsiCell.R --expData ../data/raw/rna_single_cell_type.tsv --entity ../data/entities/entities.txt --outPath ../data/out/tsiPancCell.txt

-> This example computes cell type (exocrine) scores
