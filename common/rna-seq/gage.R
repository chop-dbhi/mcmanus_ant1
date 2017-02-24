library("org.Hs.eg.db")
library("biomaRt")
library("gageData")
library("gage")
library("plyr")

cat("...loading cds.df.RData...")
load("cds.df.RData")

cnts.norm<-data.frame(counts(cds, normalized=TRUE))
cnts.names<-names(cnts.norm)

data(go.subs.hs)
data(go.sets.hs)

mart <- useMart(biomart = "ensembl", dataset = "hsapiens_gene_ensembl")
go_results <- getBM(attributes = c("ensembl_gene_id","go_id"),
                    filters = "ensembl_gene_id", values = row.names(cnts.norm),
                    mart = mart)
entrez_results <- getBM(attributes = c("ensembl_gene_id","entrezgene"),
                        filters = "ensembl_gene_id", values = row.names(cnts.norm),
                        mart = mart)

cnts.norm$entrez<-entrez_results[match(row.names(cnts.norm),entrez_results$ensembl_gene_id),"entrezgene"]

entrez.norm<-subset(cnts.norm,!is.na(entrez))

cnts.sums<-ddply(entrez.norm,.(entrez),function(d) colSums(d[cnts.names]))

cnts.matrix<-as.matrix(cnts.sums[,-1])
rownames(cnts.matrix)<-cnts.sums$entrez

# go.subs.hs is a named list of three elements: "BP", "CC" and "MF", corresponding to biological
# process, cellular component and molecular function subtrees.
go.mf.hs<-go.sets.hs[go.subs.hs$MF]
go.cc.hs<-go.sets.hs[go.subs.hs$CC]
go.bp.hs<-go.sets.hs[go.subs.hs$BP]

#write the csv files and return the gage results for graphing
writeGageTables<-function(tissue,experiment,category,geneSetType,geneSet,refCols,altCols,same.dir){
  gage_results <- gage(cnts.matrix, gsets = geneSet, ref = refCols, samp = altCols,  compare ="unpaired", same.dir=same.dir)
  if(same.dir==TRUE){
    write.csv(gage_results$greater,file=paste("GAGE/",geneSetType,".",tissue,".",experiment,".",category,".up.csv",sep=""),quote=FALSE)
    write.csv(gage_results$less,file=paste("GAGE/",geneSetType,".",tissue,".",experiment,".",category,".down.csv",sep=""),quote=FALSE)
  }else{
    write.csv(gage_results$greater,file=paste("GAGE/",geneSetType,".",tissue,".",experiment,".",category,".both.csv",sep=""),quote=FALSE)
  }
  greater<-data.frame(gage_results$greater)
  greater$term<-row.names(greater)
  return(subset(greater,p.val<0.05))
}
cat("...ready to gage...")