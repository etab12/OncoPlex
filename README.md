# ONCOPLEX: An Oncology-Inspired Hypergraph Model Integrating Diverse Biological Knowledge for Cancer Driver Gene Prediction
OncoPlex is a hypergraph-based method for cancer driver gene prediction. It learns rich node representations by modeling higher-order pathway interactions, enabling the identification of cancer driver genes across both pan-cancer and 11 specific cancer types within shared biological processes.

Our model takes multi-omics features—including somatic mutations, gene expression, DNA methylation, histone modifications, and other functional data—as input, and produces a score for each gene indicating its likelihood of being a cancer driver. It also predicts candidate driver genes for each individual cancer type, providing a prioritized list for further biological validation.

# Datasets

# Dependencies 
 - python >=3.7
 - Numpy==2.0.2
 - Pandas==2.2.2
 - sklearn==1.6.1
 - pytorch==2.6.0
 - pytorch geometric==2.6.1
   

# Training the model

