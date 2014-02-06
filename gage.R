library(org.Mm.eg.db)
library("biomaRt")
library("gageData")
library("gage")
library("plyr")

load("cds.df.RData")
cnts.norm<-data.frame(counts(cds, normalized=TRUE))
cnts.names<-names(cnts.norm)

data(go.subs.mm)
data(go.sets.mm)

mart <- useMart(biomart = "ensembl", dataset = "mmusculus_gene_ensembl")
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
go.mf.mm<-go.sets.mm[go.subs.mm$MF]
go.cc.mm<-go.sets.mm[go.subs.mm$CC]
go.bp.mm<-go.sets.mm[go.subs.mm$BP]

#write the csv files and return the gage results for graphing
writeGageTables<-function(tissue,category,geneSetType,geneSet,refCols,altCols,same.dir){
  gage_results <- gage(cnts.matrix, gsets = geneSet, ref = refCols, samp = altCols,  compare ="unpaired", same.dir=same.dir)
  if(same.dir==TRUE){
    write.csv(gage_results$greater,file=paste("GAGE/",geneSetType,".",tissue,".ant1.",category,".up.csv",sep=""),quote=FALSE)
    write.csv(gage_results$less,file=paste("GAGE/",geneSetType,".",tissue,".ant1.",category,".down.csv",sep=""),quote=FALSE)
  }else{
    write.csv(gage_results$greater,file=paste("GAGE/",geneSetType,".",tissue,".ant1.",category,".both.csv",sep=""),quote=FALSE)
  }
  greater<-data.frame(gage_results$greater)
  greater$term<-row.names(greater)
  return(subset(greater,p.val<0.05))
}

refMuscleCols<-5:8
altMuscleCols<-1:4
refHeartCols<-13:16
altHeartCols<-9:12

go.mf.muscle<-writeGageTables("muscle","molecular_function","GO",go.mf.mm,refMuscleCols,altMuscleCols,TRUE)
go.cc.muscle<-writeGageTables("muscle","cellular_component","GO",go.cc.mm,refMuscleCols,altMuscleCols,TRUE)
go.bp.muscle<-writeGageTables("muscle","biological_process","GO",go.bp.mm,refMuscleCols,altMuscleCols,TRUE)

go.mf.heart<-writeGageTables("heart","molecular_function","GO",go.mf.mm,refHeartCols,altHeartCols,TRUE)
go.cc.heart<-writeGageTables("heart","cellular_component","GO",go.cc.mm,refHeartCols,altHeartCols,TRUE)
go.bp.heart<-writeGageTables("heart","biological_process","GO",go.bp.mm,refHeartCols,altHeartCols,TRUE)

kg.mm<-kegg.gsets(species='mouse')
kegg.sigmet<-kg.mm$kg.sets[kg.mm$sigmet.idx]
kegg.muscle<-writeGageTables("muscle","signaling_or_metabolism_pathways","KEGG",kegg.sigmet,refMuscleCols,altMuscleCols,FALSE)
kegg.heart<-writeGageTables("heart","signaling_or_metabolism_pathways","KEGG",kegg.sigmet,refHeartCols,altHeartCols,FALSE)