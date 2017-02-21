ant1-rnaseq
============

rna-seq analysis in heart (McManus) and muscle (Morrow)

##Sequences##
###Heart Biosamples###
```
Submission ID SUB2425516
BioProject ID PRJNA376146
BioSample accessions SAMN06350839, SAMN06350840, SAMN06350841, SAMN06350842, SAMN06350843, SAMN06350844, SAMN06350845, SAMN06350846
```

References from iGenomes:
[UCSC](ftp://ussd-ftp.illumina.com/Mus_musculus/UCSC/mm10/Mus_musculus_UCSC_mm10.tar.gz)
or
[ENSL](ftp://ussd-ftp.illumina.com/Mus_musculus/Ensembl/GRCm38/Mus_musculus_Ensembl_GRCm38.tar.gz)

Transcript fasta:
<ftp://ftp.ensembl.org/pub/release-74/fasta/mus_musculus/cdna/Mus_musculus.GRCm38.74.cdna.all.fa.gz>

###Requires###
- Python-3.3 (for Snakemake)
- Snakemake-2.4.9
- cutadapt
- STAR_2.3.0e
- Novosort-1.0
- Cufflinks-2.1.1
- express-1.5.1
- RNA-SeQC_v1.1.7

###Submodules###
```
git submodule add git@github.research.chop.edu:BiG/rna-seq-common-functions.git common/rna-seq
git submodule update --init
```

####To run
```
cd snake-env && source bin/activate
snakemake -j 16
```

[![Snakemake](https://img.shields.io/badge/snakemake-≥3.4.2-brightgreen.svg?style=flat-square)](https://bitbucket.org/johanneskoester/snakemake)
