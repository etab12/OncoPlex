# ONCOPLEX: An Oncology-Inspired Hypergraph Model Integrating Diverse Biological Knowledge for Cancer Driver Gene Prediction
OncoPlex is a hypergraph-based method for cancer driver gene prediction. It learns rich node representations by modeling higher-order pathway interactions, enabling the identification of cancer driver genes across both pan-cancer and 11 specific cancer types within shared biological processes.

Our model takes multi-omics features—including somatic mutations, gene expression, DNA methylation, histone modifications, and other functional data—as input, and produces a score for each gene indicating its likelihood of being a cancer driver. It also predicts candidate driver genes for each individual's cancer type, providing a prioritized list for further biological validation.

# Datasets Overview 
All the data required to run the model is in the Data folder [here](https://github.com/etab12/OncoPlex/tree/029ef7a69ec6fc0483ff39d79ee88d74639eb0c5/Data).

All data are publicly available:
 - To download the MAF somatic mutation, gene expression FPKM normal and tumor files, and Illumina DNA methylation 450K files from The Cancer Genome Atlas (TCGA) through their GDC portal:
   [here](https://portal.gdc.cancer.gov/)
 - The comprehensive features from DORGE paper: [here](https://www.science.org/doi/10.1126/sciadv.aba6784)

# Dependencies 
 - Python >=3.7
 - Numpy==2.0.2
 - Pandas==2.2.2
 - sklearn==1.6.1
 - pytorch==2.6.0
 - pytorch geometric==2.6.1
   

# Training the model
To run OncoPlex, we prepared all the notebooks needed [here](https://github.com/etab12/OncoPlex/tree/029ef7a69ec6fc0483ff39d79ee88d74639eb0c5/src).

  1- To prepare the data, run the Data_Preparing notebook using the incidence matrix, features, and labels provided in the data folder.

  2- Once the graph is constructed, run the OncoPlex_pan_cancer notebook for pan-cancer training.

  3- For cancer-specific training, run the OncoPlex_cancer_specific notebook.

  4- To perform functional validation, use the enrichment_analysis R script with the new gene list located in the data folder.

You can follow these steps with your own features, network data (nodes and hyperedge list), and labels.

