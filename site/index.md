
### Quality Control
#### FastQC Output
[FastQC](http://www.bioinformatics.babraham.ac.uk/projects/fastqc) is quality control tool that can point to certain biases that represent contamination. Be aware, the report may reflect inherent biases in the RNA-Seq experiment.
> [`MUSCLE_KO_1`]({{SLINK}}/fastqc/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_KO_2`]({{SLINK}}/fastqc/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_KO_3`]({{SLINK}}/fastqc/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_KO_4`]({{SLINK}}/fastqc/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_1`]({{SLINK}}/fastqc/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_2`]({{SLINK}}/fastqc/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_3`]({{SLINK}}/fastqc/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_4`]({{SLINK}}/fastqc/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_1`]({{SLINK}}/fastqc/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_2`]({{SLINK}}/fastqc/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_3`]({{SLINK}}/fastqc/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_4`]({{SLINK}}/fastqc/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_1`]({{SLINK}}/fastqc/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_2`]({{SLINK}}/fastqc/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_3`]({{SLINK}}/fastqc/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_4`]({{SLINK}}/fastqc/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)


		
#### RNA-SeQC Output
[RNA-SeQC](http://bioinformatics.oxfordjournals.org/content/28/11/1530.long) produces extensive metrics for RNA-Seq runs. Not all of the sections will apply to the Ion Proton protocol.
Most interesting might be the rRNA rate in the multisample [summary document]({0}/{1}/countMetrics.html).
> [RNA-SeQC home]({0}/{2})

> [RNA-SeQC reports]({0}/{1}/countMetrics.html)

> [RNA-SeQC reports]({0}/{1}/report.html)

### HT-Seq Counts
> [Raw HT-Seq Counts]({0}/raw_counts.tab.txt)

> [ERCC Spike-in Normalized Counts]({0}/normalized_counts.tab.txt)

### Gene Reads
For downstream amplification purposes, reads aligning to the following genes were extracted from the alignments

> MT-ND1 ENSMUSG00000064341

> MT-ND3 ENSMUSG00000064360

> MT-ND6 ENSMUSG00000064368

> MT-CYTB ENSMUSG00000064370

Note: Many of these reads are soft-clipped (i.e. a local alignment in which end of the read does not align with reference).
Also the intersection rules employed for differential expression are more strict than those used in the extraction. The [intersection-strict](http://www-huber.embl.de/users/anders/HTSeq/doc/count.html) mode was used for DE.
Counts will be proportional but different than those in [Raw HT-Seq Counts]({0}/raw_counts.tab.txt).

> [`gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.MT-CYTB.fa)

> [`gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND1.fa`]({{SLINK}}/gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND1.fa)

> [`gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND6.fa`]({{SLINK}}/gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND6.fa)

> [`gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND3.fa`]({{SLINK}}/gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-ND3.fa)

> [`gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-CYTB.fa`]({{SLINK}}/gene_reads/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.MT-CYTB.fa)


### Differential expression analysis report and significantly DE gene tables
> [diffExp.pdf]({{SLINK}}/diffExp.pdf)

> [muscleResults.csv]({{SLINK}}/muscleResults.csv)

> [heartResults.csv]({{SLINK}}/heartResults.csv)

### Convenience tables for Metacore aka GeneGo
These are just lists of entrez identifiers, fold changes, and padj
> [heart.genego.xls]({{SLINK}}/heart.genego.xls)

> [muscle.genego.xls]({{SLINK}}/muscle.genego.xls)    

### GAGE
GAGE was used to generate GO and KEGG pathway analysis using a ranked list analysis (read counts are taken into consideration)

#### Gene Ontology with GAGE
GO is divided into domains of cellular component, molecular function, and biological process.

The "up" and "down" tables test the model that ANT1 is overexpressing/underexpressing all genes in a geneset associated with a GO term relative to B6ME. The same GO terms are in both files.

This describes the tables included in this GAGE output.

Column    | Description
----------|------------
p.geomean | geometric mean of the individual p-values from multiple single array based gene set tests
stat.mean | mean of the individual statistics from multiple single array based gene set tests. Normally, its absoluate value measures the magnitude of gene-set level changes, and its sign indicates direction of the changes.
p.val     | global p-value or summary of the individual p-values from multiple single array based gene set tests. This is the default p-value being used.
q.val     | FDR q-value adjustment of the global p-value using the Benjamini & Hochberg procedure implemented in multtest package. This is the default q-value being used.
set.size  | the effective gene set size, i.e. the number of genes included in the gene set test
>[GAGE/GO.heart.ant1.biological_process.up.csv]({{SLINK}}/GAGE/GO.heart.ant1.biological_process.up.csv)

>[GAGE/GO.heart.ant1.biological_process.down.csv]({{SLINK}}/GAGE/GO.heart.ant1.biological_process.down.csv)

>[GAGE/GO.heart.ant1.cellular_component.up.csv]({{SLINK}}/GAGE/GO.heart.ant1.cellular_component.up.csv)

>[GAGE/GO.heart.ant1.cellular_component.down.csv]({{SLINK}}/GAGE/GO.heart.ant1.cellular_component.down.csv)

>[GAGE/GO.heart.ant1.molecular_function.up.csv]({{SLINK}}/GAGE/GO.heart.ant1.molecular_function.up.csv)

>[GAGE/GO.heart.ant1.molecular_function.down.csv]({{SLINK}}/GAGE/GO.heart.ant1.molecular_function.down.csv)

>[GAGE/GO.muscle.ant1.biological_process.up.csv]({{SLINK}}/GAGE/GO.muscle.ant1.biological_process.up.csv)

>[GAGE/GO.muscle.ant1.biological_process.down.csv]({{SLINK}}/GAGE/GO.muscle.ant1.biological_process.down.csv)

>[GAGE/GO.muscle.ant1.cellular_component.up.csv]({{SLINK}}/GAGE/GO.muscle.ant1.cellular_component.up.csv)

>[GAGE/GO.muscle.ant1.cellular_component.down.csv]({{SLINK}}/GAGE/GO.muscle.ant1.cellular_component.down.csv)

>[GAGE/GO.muscle.ant1.molecular_function.up.csv]({{SLINK}}/GAGE/GO.muscle.ant1.molecular_function.up.csv)

>[GAGE/GO.muscle.ant1.molecular_function.down.csv]({{SLINK}}/GAGE/GO.muscle.ant1.molecular_function.down.csv)


### KEGG Pathway Enrichment with GAGE
The GAGE KEGG analysis does not assume expression is in one direction.
>[GAGE/KEGG.heart.ant1.signaling_or_metabolism_pathways.both.csv]({{SLINK}}/GAGE/KEGG.heart.ant1.signaling_or_metabolism_pathways.both.csv)

>[GAGE/KEGG.muscle.ant1.signaling_or_metabolism_pathways.both.csv]({{SLINK}}/GAGE/KEGG.muscle.ant1.signaling_or_metabolism_pathways.both.csv)


### TopGO Analysis
TopGO provides additional tools for exploring GO enrichment.
> [topGO.pdf]({{SLINK}}/topGO.pdf)

### Using BigWig Tracks in UCSC Genome Browser
Go to [http://genome.ucsc.edu/cgi-bin/hgCustom](http://genome.ucsc.edu/cgi-bin/hgCustom), make sure mm10 is selected, and copy-paste one or more of these into the URL field.
> ```track type=bigWig name=MUSCLE_KO_1 db=mm10 smoothingWindow=4 color=141,211,199 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_KO_2 db=mm10 smoothingWindow=4 color=255,255,179 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_KO_3 db=mm10 smoothingWindow=4 color=190,186,218 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.bw```

> ```track type=bigWig name=MUSCLE_KO_4 db=mm10 smoothingWindow=4 color=251,128,114 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_WT_1 db=mm10 smoothingWindow=4 color=128,177,211 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_WT_2 db=mm10 smoothingWindow=4 color=253,180,98 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_WT_3 db=mm10 smoothingWindow=4 color=179,222,105 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.bw```

> ```track type=bigWig name=MUSCLE_WT_4 db=mm10 smoothingWindow=4 color=252,205,229 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_1 db=mm10 smoothingWindow=4 color=217,217,217 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_2 db=mm10 smoothingWindow=4 color=188,128,189 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_3 db=mm10 smoothingWindow=4 color=204,235,197 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_4 db=mm10 smoothingWindow=4 color=255,237,111 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_1 db=mm10 smoothingWindow=4 color=190,174,212 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_2 db=mm10 smoothingWindow=4 color=253,192,134 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_3 db=mm10 smoothingWindow=4 color=56,108,176 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_4 db=mm10 smoothingWindow=4 color=191,91,23 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl=https://s3.amazonaws.com/inx.wallacelab.ant1rnaseq/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.bw```


### Code repository
Code used to generate this analysis is located here [http://github.research.chop.edu/BiG/martin-ant1-rnaseq](http://github.research.chop.edu/BiG/martin-ant1-rnaseq). Feel free to reuse.

### Git hash
This should match the hash index on the last page of your report.
```35e2eb6923e1eebee1e720ae6a2a8458e2e979ff```

Last modified ```2015-09-01 11:35:12```