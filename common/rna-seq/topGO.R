library(topGO)
library(org.Hs.eg.db)
library(xtable)

getSigOrNot<-function (allScore) 
{
  return(allScore < 0.01)
}
#res data frame withid field containing gene names and a quantitative column usually with significance
#desc caption description
#ontology one of BP, CC, MF
#print latex of go summary table
#return GOdata object, table object
getGO<-function(res,desc,ontology,nodes=5,species='hs', id.type='Ensembl', id.column='id', q.column='pval', geneSel=getSigOrNot, scoreOrder = 'increasing', doFisher=TRUE, debug=FALSE) {
  if (toupper(species) %in% c('HUMAN', 'HS', 'HG19', 'HG18', 'HG17', 'H. SAPIENS', 'HOMO SAPIENS', 'GRCH37')) mapping<-'org.Hs.eg.db' else 
    if (toupper(species) %in% c('MOUSE', 'MM', 'MM9', 'MM8', 'MM7', 'M. MUSCULUS', 'MUS MUSCULUS')) mapping<-'org.Mm.eg.db' else
      if (toupper(species) %in% c('RAT', 'RN', 'RATTUS NORVEGICUS', 'RN4', 'RN3', 'R. NORVEGICUS')) mapping<-'org.Rn.eg.db' else
        if (toupper(species) %in% c('WORM', 'C. ELEGANS', 'CAENORHABDITIS ELEGANS', 'ELEGANS', 'NEMATODE', 'WS190', 'WS170', 'CE6', 'CE4')) mapping<-'org.Ce.eg.db' else
          stop('Error: unknown species \"', species, '\"');
  
  
  #NA's will screw up the KS test
  geneList<-as.vector(res[!is.na(res[,q.column]),q.column])
  names(geneList)<-res[!is.na(res[,q.column]),id.column]
  
  GOdata <- new("topGOdata", ontology = ontology, allGenes = geneList, geneSel = geneSel, description = "Test", annot = annFUN.org, mapping = mapping, ID = id.type)
  
  resultKS <- runTest(GOdata, algorithm = "classic", statistic = "ks", scoreOrder = scoreOrder)
  resultKS.elim <- runTest(GOdata, algorithm = "elim", statistic = "ks", scoreOrder = scoreOrder)
  
  #fisher is inappropriate if, for example, the values are logFC
  if(doFisher){
    resultFisher <- runTest(GOdata, algorithm = "classic", statistic = "fisher", scoreOrder = scoreOrder)
  
    genTab <- GenTable(GOdata, Fisher = resultFisher,
                     KS = resultKS, elimKS = resultKS.elim, orderBy = "elimKS", ranksOf = "Fisher", topNodes = nodes)
    xtable<-xtable(genTab,type=tex,caption=desc,digits=3,display=c('d','s','s','d','d','f','d','g','g','g'))
  }else{    
    genTab <- GenTable(GOdata,
                       KS = resultKS, elimKS = resultKS.elim, orderBy = "elimKS", ranksOf = "elimKS", topNodes = nodes)
    xtable<-xtable(genTab,type=tex,caption=desc,digits=3,display=c('d','s','s','d','d','f','d','g','g'))
  }
  return(list(godata=GOdata,gentab=genTab,xtable=xtable))
}