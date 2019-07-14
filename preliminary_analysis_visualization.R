library("pheatmap")
library("RColorBrewer")
library("PoiClaClu")


### tpm Poisson distance heatmap
# taken from: http://achri.blogspot.com/2017/03/this-is-not-normal-dealing-with.html

PoisHeatMap <- function(df, pal){
  poisd <- PoissonDistance(t(df[,2:ncol(df)]))
  samplePoisDistMatrix <- as.matrix(poisd$dd)
  rownames(samplePoisDistMatrix) <- colnames(df[2:ncol(df)])
  colors <- colorRampPalette(rev(brewer.pal(9, pal)) )(255)
  pheatmap(samplePoisDistMatrix,  clustering_distance_rows=poisd$dd,clustering_distance_cols=poisd$dd, col=colors,
           labels_col = rownames(samplePoisDistMatrix))
}
