# ONCOPLEX: An Oncology-Inspired Hypergraph Model Integrating Diverse Biological Knowledge for Cancer Driver Gene Prediction
OncoPlex is a hypergraph-based method for cancer driver gene prediction. It learns rich node representations by modeling higher-order pathway interactions, enabling the identification of cancer driver genes across both pan-cancer and 11 specific cancer types within shared biological processes.

Our model takes multi-omics features—including somatic mutations, gene expression, DNA methylation, histone modifications, and other functional data—as input, and produces a score for each gene indicating its likelihood of being a cancer driver. It also predicts candidate driver genes for each individual cancer type, providing a prioritized list for further biological validation.

# Datasets
All  the data needed to run the model is in the Data folder here [here](https://github.com/etab12/OncoPlex/tree/029ef7a69ec6fc0483ff39d79ee88d74639eb0c5/Data).

# Dependencies 
 - python >=3.7
 - Numpy==2.0.2
 - Pandas==2.2.2
 - sklearn==1.6.1
 - pytorch==2.6.0
 - pytorch geometric==2.6.1
   

# Training the model
To run OncoPlex, we prepared the notebooks needed [here](https://github.com/etab12/OncoPlex/tree/029ef7a69ec6fc0483ff39d79ee88d74639eb0c5/src).

  1- Run the Data_Preparing notebook using the incidence matrix, features, and labels in the data folder. 
  
  2- After constructing a graph, run OncoPlex_pan_cancer notebook for pancancer training.
  
  3- For cancer_specific training, run OncoPlex_cancer_specific notebook. 

  4- For functional validation, use the enrichment_analysis R code. 

