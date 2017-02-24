ant1-rnaseq
============

rna-seq analysis 

in heart McManus et al. (submitted)

in muscle [Morrow et al.](https://www.ncbi.nlm.nih.gov/pubmed/28223503) 

##Sequences##
###Heart Biosamples###
```
Submission ID SUB2425516
BioProject ID PRJNA376146
BioSample accessions SAMN06350839, SAMN06350840, SAMN06350841, SAMN06350842, SAMN06350843, SAMN06350844, SAMN06350845, SAMN06350846
```


###Muscle Biosamples###
```
Submission ID SUB2432979
BioProject ID PRJNA376587
BioSample accessions SAMN06435823, SAMN06435824, SAMN06435825, SAMN06435826, SAMN06435827, SAMN06435828, SAMN06435829, SAMN06435830

```

References from iGenomes:
[UCSC](ftp://ussd-ftp.illumina.com/Mus_musculus/UCSC/mm10/Mus_musculus_UCSC_mm10.tar.gz)
or
[ENSL](ftp://ussd-ftp.illumina.com/Mus_musculus/Ensembl/GRCm38/Mus_musculus_Ensembl_GRCm38.tar.gz)

Transcript fasta:
<ftp://ftp.ensembl.org/pub/release-74/fasta/mus_musculus/cdna/Mus_musculus.GRCm38.74.cdna.all.fa.gz>

###Fetching requirements with conda###
```
#install miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

conda create --name ant1env --file requirements.txt
source activate ant1env
```

####To run
```
source activate ant1env
snakemake -j 16
```

[![Snakemake](https://img.shields.io/badge/snakemake-≥3.4.2-brightgreen.svg?style=flat-square)](https://bitbucket.org/johanneskoester/snakemake)
