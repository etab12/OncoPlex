# ONCOPLEX: An Oncology-Inspired Hypergraph Model Integrating Diverse Biological Knowledge for Cancer Driver Gene Prediction
OncoPlex is a hypergraph-based method for cancer driver gene prediction. It learns rich node representations by modeling higher-order pathway interactions, enabling the identification of cancer driver genes across both pan-cancer and 11 specific cancer types within shared biological processes.

Our model takes diverse type of features including mutstions, gene ecpression, methylation profiles, and other genomics and epigenetics as input, and produces a score for each gene indicating its likelihood of being a cancer driver. It also predicts candidate driver genes for each individual's cancer type, providing a potential gene list for further validation.

# Datasets Overview 
All the data required to run our model is in the [Data](https://github.com/etab12/OncoPlex/tree/029ef7a69ec6fc0483ff39d79ee88d74639eb0c5/Data). 

All datasets are publicly available:
 - To download the core features uncluding: MAF somatic mutation, gene expression FPKM normal and tumor files, and Illumina DNA methylation 450K files from The Cancer Genome Atlas (TCGA) through their
   [GDC portal](https://portal.gdc.cancer.gov/).
 - The comprehensive features from [DORGE paper](https://www.science.org/doi/10.1126/sciadv.aba6784).
 - Cancer driver gene labels were collected from the Network of Cancer Genes v6.0, DigSee, COSMIC CGC v91, and IntOGen v2024.09.204. 

# Dependencies 
 - Python >=3.7
 - Numpy==2.0.2
 - Pandas==2.2.2
 - Sklearn==1.6.1
 - Pytorch==2.6.0
 
   

# Training The Model
To run OncoPlex, we prepared all the notebooks needed in the [Notebooks](https://github.com/etab12/OncoPlex/tree/029ef7a69ec6fc0483ff39d79ee88d74639eb0c5/src), following these step:



  1- To prepare the data, run the Data_Preparing.ipynb notebook. 

  2- Once the graph is constructed, run the OncoPlex_Pan_Cancer.ipynb notebook for pan-cancer training.

  3- For cancer-specific training, you can independently run it through the OncoPlex_Cancer_Specific.ipynb notebook.

  4- To perform functional validation, use the enrichment_analysis R script with the new gene list located in the NPGs folder.

* You can follow these steps using your own features, network data (nodes and hyperedges), and labels, by replacing the file paths in the provided notebooks. 
* We provide a description in each folder that explain its component files. 

