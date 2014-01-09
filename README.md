martin-ant1-rnaseq
============

rna-seq analysis for Martin Picard

References from iGenomes:
<ftp://ussd-ftp.illumina.com/Mus_musculus/UCSC/mm10/Mus_musculus_UCSC_mm10.tar.gz>
or
<ftp://ussd-ftp.illumina.com/Mus_musculus/Ensembl/GRCm38/Mus_musculus_Ensembl_GRCm38.tar.gz>

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

###To run###
```
/usr/local/bin/virtualenv-3.3 snake-env
cd snake-env
. bin/activate
snakemake -j 24
```