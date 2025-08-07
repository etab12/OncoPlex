library(clusterProfiler) 
library(msigdbr) # for Hallmark  gene set
library(org.Hs.eg.db) 
library(dplyr)
library(ggplot2)
library(enrichplot) 
install.packages("svglite")


genes_symbol <- c(
  "GRB2", "NRAS", "SHC1", "SOS1", "MAPK1", "MAPK3", "PIK3CB", "PIK3R2",
  "SRC", "MAP2K1", "JUN", "RAF1", "MAPK8", "PLCG1", "PIK3CG", "PTPN11",
  "PIK3CD", "MYC", "RAC1", "STAT3", "PIK3R3", "NFKB1", "CTNNB1", "RHOA",
  "AKT3", "STAT5B", "STAT5A", "STAT1", "CBL", "FYN"
)


# 1- Convert gene symbol to the corresponding id 
gene_entrez <- bitr(genes_symbol, fromType = "SYMBOL",
                    toType = "ENTREZID",
                    OrgDb = org.Hs.eg.db)$ENTREZID

print(gene_entrez)
write.csv(gene_entrez, "gene_id_HNSC.csv", row.names= FALSE)
#==============================

# 2- doing hallmark enrichment analysis 

hallmark_sets <- msigdbr(species = "Homo sapiens", category = "H") # Its name in Msigdb 
enrich_hallmark <- enricher(gene_entrez,
                            TERM2GENE = hallmark_sets %>% select(gs_name, entrez_gene),

                                                        pAdjustMethod = "BH", pvalueCutoff = 0.05) # define adjusted p-value
# This for Kegg pathway
kegg <- enrichKEGG(gene_entrez, organism = "hsa", pAdjustMethod = "BH", pvalueCutoff = 0.05)

#===============================
# 4- save the results 
save_path <- "~/Enrichment_Fig/"
if (!dir.exists(save_path)) dir.create(save_path, recursive = TRUE)

# plot function
save_plot <- function(enrich_res, filename, save_path = ".") {
  df <- as.data.frame(enrich_res) %>%
    arrange(p.adjust) %>%
    slice_head(n = 15)
  
  if (nrow(df) == 0) return(NULL)
  
  df$GeneRatio <- sapply(df$GeneRatio, function(x) {
    parts <- strsplit(x, "/")[[1]]
    as.numeric(parts[1]) / as.numeric(parts[2])
  })
  
  df$Description <- factor(df$Description, levels = rev(df$Description))

  p <- ggplot(df, aes(x = GeneRatio, y = Description)) +
    geom_segment(aes(x = 0, xend = GeneRatio, yend = Description), color = "darkred", linewidth = 1.0) +
    geom_point(aes(size = Count, color = p.adjust)) +
    scale_size(name = "Gene Count") +
    scale_color_gradient(
      name = "Adjusted p-value",
      low = "#1E9E9C",
      high = "#A63603",
      labels = function(x) formatC(x, format = "e", digits = 2)
    ) +
    guides(
      size = guide_legend(order = 1),
      color = guide_colorbar(order = 2)
    ) +
    theme_minimal(base_size = 14) +
    labs(x = "Gene Ratio", y = NULL) +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA),
      panel.grid.major = element_line(color = "gray60"),
      panel.grid.minor = element_blank(),
      text = element_text(color = "black"),
      axis.text = element_text(color = "black"),
      axis.title = element_text(color = "black"),
      plot.title = element_text(color = "black", face = "bold"),
      plot.margin = margin(10, 10, 10, 50)
    )
  
  # Save the plot
  ggsave(
    filename = file.path(save_path, filename),
    plot = p,
    width = 8,
    height = 6,
    dpi = 300
    
  )
  
}



save_plot(enrich_hallmark, "STAD_Hallmark.svg", save_path)
save_plot(kegg, "STAD_KEGG.svg", save_path)
