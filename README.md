ant1-rnaseq
============

rna-seq analysis in heart (McManus) and muscle (Morrow)

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

###To run on raboso###
```
cd snake-env && source bin/activate
snakemake -j 16
```

###To run on variome###
```
source /nas/is1/leipzig/variome-env/bin/activate
snakemake --directory /nas/is1/leipzig/martin/src --snakefile /nas/is1/leipzig/martin/src/Snakefile  -c qsub -j 16
```

###To run on respublica###
Warning: Respublica has low RAM ceilings - some steps are better done on Raboso
```
source /mnt/isilon/cbmi/variome/leipzig/respublica-env/bin/activate
snakemake --directory /mnt/isilon/cbmi/variome/leipzig/martin/src --snakefile /mnt/isilon/cbmi/variome/leipzig/martin/src/Snakefile -c qsub -j 16
```

To install Snakemake on your own server read this: http://github.research.chop.edu/gist/leipzigj/8

[![Snakemake](https://img.shields.io/badge/snakemake-≥3.4.2-brightgreen.svg?style=flat-square)](https://bitbucket.org/johanneskoester/snakemake)
