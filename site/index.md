---
layout: wide
---
### Quality Control
#### FastQC Output
[FastQC] is quality control tool that can point to certain biases that represent contamination. Be aware, the report may reflect inherent biases in the RNA-Seq experiment.
> [`MUSCLE_KO_1`]({{ site.baseurl }}/fastqc/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_KO_2`]({{ site.baseurl }}/fastqc/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_KO_3`]({{ site.baseurl }}/fastqc/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_KO_4`]({{ site.baseurl }}/fastqc/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_1`]({{ site.baseurl }}/fastqc/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_2`]({{ site.baseurl }}/fastqc/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_3`]({{ site.baseurl }}/fastqc/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.trimmed_fastqc/fastqc_report.html)

> [`MUSCLE_WT_4`]({{ site.baseurl }}/fastqc/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_1`]({{ site.baseurl }}/fastqc/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_2`]({{ site.baseurl }}/fastqc/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_3`]({{ site.baseurl }}/fastqc/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_KO_4`]({{ site.baseurl }}/fastqc/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_1`]({{ site.baseurl }}/fastqc/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_2`]({{ site.baseurl }}/fastqc/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_3`]({{ site.baseurl }}/fastqc/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)

> [`HEART_WT_4`]({{ site.baseurl }}/fastqc/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.trimmed_fastqc/fastqc_report.html)


		
#### RNA-SeQC Output
[RNA-SeQC](http://bioinformatics.oxfordjournals.org/content/28/11/1530.long) produces extensive metrics for RNA-Seq runs. Not all of the sections will apply to the Ion Proton protocol.
Most interesting might be the rRNA rate in the multisample [summary document](RNASEQC_DIR/countMetrics.html).
> [RNA-SeQC reports](RNASEQC_DIR)

### Differential expression analysis report and significantly DE gene tables
> [diffExp.pdf](diffExp.pdf)

> [muscleResults.csv](muscleResults.csv)

> [heartResults.csv](heartResults.csv)

### Using BigWig Tracks in UCSC Genome Browser
Go to [http://genome.ucsc.edu/cgi-bin/hgCustom](http://genome.ucsc.edu/cgi-bin/hgCustom) and copy-paste one or more of these into the URL field.
> ```track type=bigWig name=MUSCLE_KO_1 smoothingWindow=4 color=141,211,199 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_KO_2 smoothingWindow=4 color=255,255,179 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_KO_3 smoothingWindow=4 color=190,186,218 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.bw```

> ```track type=bigWig name=MUSCLE_KO_4 smoothingWindow=4 color=251,128,114 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_WT_1 smoothingWindow=4 color=128,177,211 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_WT_2 smoothingWindow=4 color=253,180,98 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=MUSCLE_WT_3 smoothingWindow=4 color=179,222,105 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.bw```

> ```track type=bigWig name=MUSCLE_WT_4 smoothingWindow=4 color=252,205,229 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_1 smoothingWindow=4 color=217,217,217 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_2 smoothingWindow=4 color=188,128,189 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_3 smoothingWindow=4 color=204,235,197 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_KO_4 smoothingWindow=4 color=255,237,111 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_1 smoothingWindow=4 color=190,174,212 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_2 smoothingWindow=4 color=253,192,134 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_3 smoothingWindow=4 color=56,108,176 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.bw```

> ```track type=bigWig name=HEART_WT_4 smoothingWindow=4 color=191,91,23 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.baseurl }}/tracks/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.bw```


#### Code repository
Code used to generate this analysis is located here [http://github.research.chop.edu/BiG/martin-ant1-rnaseq](http://github.research.chop.edu/BiG/martin-ant1-rnaseq). Feel free to reuse.
