# This folder contains:

- Data_Preparing.ipynb: this code to generate the data needed to train OncoPlex.

To run this we provide the incidence_matrix_FI_coo.npz which is contain the incidence matrix to construct a graph, the core_features.tsv node features which is the mutation, gene expression, and methylation metrics after combined them. For the comprehnsive features we provide the link to the main source. 

- OncoPlex_ Pan_Cancer and Cancer-Specific notebooks: these are the main notebooks for the training. 
- enrichment_analysis.R: R script for enrichment analysis experiment, which you can run it on the NPGs for a specefic cancer. 
