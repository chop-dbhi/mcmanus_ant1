import glob
from snakemake.utils import R
import re
import socket

def get_isilon_mount_path():
	if socket.gethostname()=='respublica':
		return '/mnt/isilon/cbmi/variome/'
	else:
		return '/nas/is1/'
		
ROOT =          get_isilon_mount_path()+"leipzig/martin/snake-env/"
MITOMAP =       "leipzigj@rescommap01.research.chop.edu:/var/www/html/martin-rna-seq/"
REFDIR =        ROOT+"refs/Mus_musculus/Ensembl/GRCm38/"
FASTAREF =      REFDIR+"Sequence/WholeGenomeFasta/genome.fa"
STARREFDIR =    REFDIR+"star/"
CHRNAME =       STARREFDIR+"chrName.txt"
GTFFILE =       REFDIR+"Annotation/Genes/genes.gtf"
PRIM_GTF =      REFDIR+"Annotation/Genes/primary_genes.gtf"
MASKFILE =      REFDIR+"Annotation/mask.gtf"
RRNA =          "mm10_rRNA.list"
TOOLDIR=        ROOT+"tools"
STAR =          TOOLDIR+"/STAR_2.3.0e.Linux_x86_64/STAR"
SAMTOOLS =      TOOLDIR+"/samtools/samtools"
CUTADAPT =      "../../../bin/cutadapt"
NOVO =          "../../../bin/Novoalign/3.00.02/novocraft"
BEDTOOLS =      "../../../bin/BEDTools/2.16.2"
RNASEQC =       TOOLDIR+"/RNA-SeQC_v1.1.7.jar"
ALIGN =         NOVO+"/novoalign"
INDEX =         NOVO+"/novoindex"
SORT =          NOVO+"/novosort"
CUFF =          TOOLDIR+"/cufflinks-2.1.1.Linux_x86_64/cufflinks"
EXPR =          TOOLDIR+"/express-1.5.1-linux_x86_64/express"

#ANT1 evens
MUSCLE_KO = "IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303 IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome"

#B6ME odds
MUSCLE_WT = "IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303 IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome"

#ANT1 evens
HEART_KO = "IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome  IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome  IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome"

#B6ME odds
HEART_WT = "IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome  IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome  IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome"

GROUP_NAMES = 'MUSCLE_KO MUSCLE_WT HEART_KO HEART_WT'.split()
SAMPLES = ' '.join([MUSCLE_KO,MUSCLE_WT,HEART_KO,HEART_WT]).split()
PRETTY_NAMES = ['{0}_{1}'.format(sample,i)  for sample in GROUP_NAMES for i in range(1, 5)]

SEQ_DIR = ROOT+"raw/"
MAPPED_DIR = ROOT+"mapped/"
COUNTS_DIR = ROOT+"counts/"
CUFF_DIR = ROOT+"cufflinks/"
EXPR_DIR = ROOT+"express/"
DIRS = [MAPPED_DIR,COUNTS_DIR,CUFF_DIR]
MAPPED = [MAPPED_DIR+f+'.sorted.bam' for f in SAMPLES]
GATKED = [MAPPED_DIR+f+'.sorted.gatk.bam.bai' for f in SAMPLES]
COUNTS = [COUNTS_DIR+f+'.tsv' for f in SAMPLES]
CUFFED = [CUFF_DIR+f+'/transcripts.gtf' for f in SAMPLES]
EXPRED = [EXPR_DIR+'reports/'+f for f in SAMPLES]
LOGS = 'starlogs.parsed.txt'
SAMPLEFILE = ROOT+"samplefile.rnaseqc.txt"
RNASEQC_DIR = ROOT+"RNASEQC_DIR/"
RNASEQC_SENT = RNASEQC_DIR+"index.html"
BIGWIGS = ['tracks/'+f+'.bw' for f in SAMPLES]
QCED = ['fastqc/'+f+'.trimmed_fastqc.zip' for f in SAMPLES]
ERCC = ['ercc/'+f+'.idxstats' for f in SAMPLES]

rule all:
	input: DIRS, CHRNAME, MAPPED, CUFFED, COUNTS, GATKED, RNASEQC_SENT, LOGS, QCED, BIGWIGS

rule expr:
	input: EXPRED

rule dirs:
	output: DIRS
	shell: "mkdir -p "+' '.join(DIRS)

rule dosomething:
	output: "something.txt"
	shell: """
			echo "soemthign\n" > {ROOT}/something.txt
			"""

##### TRIMMING #####
#cutadapt will auto-gz if .gz is in the output name
rule trim:
	input: "{sample}.fastq"
	output: "{sample}.trimmed.fastq.gz"
	threads: 1
	shell: "{CUTADAPT} -m 16 -b GGCCAAGGCG -o {output} {input}"

##### ALIGNMENT #####
rule starindex:
	input: FASTAREF
	output: CHRNAME
	shell: "{STAR} --limitGenomeGenerateRAM 54760833024 --runMode genomeGenerate --genomeDir {STARREFDIR} --genomeFastaFiles {input}"

rule map:
	input:  "raw/{sample}.trimmed.fastq.gz"
	output: "mapped/{sample}.sam"
	threads: 24
	shell:
		"""
		{STAR} --genomeDir {STARREFDIR} --outFileNamePrefix {wildcards.sample}_ --readFilesIn {input} --runThreadN 24 --genomeLoad NoSharedMemory --outSAMattributes All --outSAMstrandField intronMotif --sjdbGTFfile {GTFFILE}
		mv {wildcards.sample}_Aligned.out.sam {output}
		mv {wildcards.sample}_Log.final.out {wildcards.sample}_Log.out {wildcards.sample}_Log.progress.out {wildcards.sample}_SJ.out.tab starlogs
		"""

#this is for the table in the diffExp report
rule parselogs:
	input: expand('starlogs/{sample}_Log.final.out', sample=SAMPLES)
	output: "starlogs.parsed.txt"
	run:
		filename_p = re.compile('starlogs\/(\S+)_Log.final.out')
		input_reads_p = re.compile('Number of input reads\s+\|\s+(.*)')
		unique_reads_p = re.compile('Uniquely mapped reads %\s+\|\s+(.*)')
		multiple_hits_p = re.compile('% of reads mapped to multiple loci\s+\|\s+(.*)')
		input_reads=''
		unique_reads=''
		multiple_hits=''
		with open(output[0], 'w') as outfile:
			outfile.write('sample\tNumber of input reads\tUniquely mapped reads %\t% of reads mapped to multiple loci\n')
			for samplefilename in input:
				sample=filename_p.search(samplefilename).group(1)
				with open(samplefilename, 'r') as file:
				 
					for line in file:
						if input_reads_p.search(line):
							input_reads=input_reads_p.search(line).group(1)
						elif unique_reads_p.search(line):
							unique_reads=unique_reads_p.search(line).group(1)
						elif multiple_hits_p.search(line):
							multiple_hits=multiple_hits_p.search(line).group(1)
				outfile.write('{0}\t{1}\t{2}\t{3}\n'.format(sample,input_reads,unique_reads,multiple_hits))



#novosort can index
rule sortbam:
	input: "{sample}.bam"
	output: bam="{sample}.sorted.bam", bai="{sample}.sorted.bam.bai"
	threads: 24
	shell: "{SORT} -t /nas/is1/tmp -s -i -o {output.bam} {input}"

#if you ask for a sorted.bam don't look for a sorted.sam
#ruleorder: sortbam > samtobam	
# rule samtobam:
# 	input:  "{sample}.sam"
# 	output: temp("{sample}.bam")
# 	threads: 1
# 	shell:  "{SAMTOOLS} view -bS {input} > {output}"

#### ERCC #####
rule ERCCnix:
	output: "refs/ERCC92.nix"
	input: "refs/ERCC92.fa"
	shell: "{INDEX} {output} {input}"

rule ERCCbam:
	input: fastq="raw/{sample}.trimmed.fastq.gz", ref="refs/ERCC92.nix"
	output: temp("ercc/{sample}.bam")
	shell: "{ALIGN} -d refs/ERCC92.nix -f {input.fastq} -o SAM | {SAMTOOLS} view -bS - > {output}"

rule idxstats:
	input: "ercc/{sample}.sorted.bam"
	output: "ercc/{sample}.idxstats"
	shell: "{SAMTOOLS} idxstats {input} > {output}"

rule idxsummary:
	output: "ercc.counts"
	input: expand('ercc/{sample}.idxstats', sample=SAMPLES)
	shell: 
			"""
			grep '^\*' {input} | cut -f1,4 | sed -e 's/\.idxstats:\*//' | sed -e 's/ercc\///'> ercc.counts
			"""

#### QC #####
rule fastqc:
	input: "raw/{sample}.trimmed.fastq.gz"
	output: "fastqc/{sample}.trimmed_fastqc.zip"
	shell: "{TOOLDIR}/FastQC/fastqc -o fastqc {input}"
	
rule AddOrReplaceReadGroups:
	input: "{sample}.sorted.bam"
	output: "{sample}.sorted.gatk.bam"
	shell: "java -jar {TOOLDIR}/picard-tools-1.106/AddOrReplaceReadGroups.jar INPUT= {input} OUTPUT= {output} RGID= {wildcards.sample} LB= {wildcards.sample} RGPL= ionproton RGPU= martin RGSM= {wildcards.sample}"
	
rule index:
	input: "{sample}.sorted.gatk.bam"
	output: "{sample}.sorted.gatk.bam.bai"
	shell: "java -jar {TOOLDIR}/picard-tools-1.106/BuildBamIndex.jar INPUT= {input} OUTPUT= {output}"

rule dict:
	input: "{ref}.fa"
	output: "{ref}.dict"
	shell: "java -jar picard-tools-1.106/CreateSequenceDictionary.jar REFERENCE= {input} OUTPUT= {output}"

#samplefile.rnaseqc.txt was made by hand so sue me
rule rnaseqc:
	input: SAMPLEFILE, GATKED
	output: RNASEQC_SENT
	shell: "java -jar {RNASEQC} -o {RNASEQC_DIR} -r {FASTAREF} -s {SAMPLEFILE} -t {PRIM_GTF} -rRNA {RRNA}"

##### TX Quantification: Cufflinks #####
rule mask:
	output: MASKFILE
	shell: "grep -P 'rRNA|tRNA|MT\t' {GTFFILE} > {MASKFILE}"

rule cufflinks:
	input: "mapped/{sample}.sorted.bam"
	output: gtf="cufflinks/{sample}/transcripts.gtf",iso="cufflinks/{sample}/isoforms.fpkm_tracking",genes="cufflinks/{sample}/genes.fpkm_tracking"
	threads: 8
	shell: """
	       mkdir -p {CUFF_DIR}{wildcards.sample}
	       {CUFF} -p 8 -g {GTFFILE} -M {MASKFILE} --max-bundle-length 8000000 --multi-read-correct --library-type=fr-secondstrand --output-dir {CUFF_DIR}{wildcards.sample} {input}
	       """

#####  TX Quantification: Express  #####
CDNA=REFDIR+"Sequence/Transcripts/Mus_musculus.GRCm38.74.cdna.all"
rule txIndex:
	input: CDNA+'.fa'
	output: CDNA+'.nix'
	shell: "{INDEX} {output} {input}"

rule expressbam:
	input: fq="raw/{sample}.trimmed.fastq.gz", ref=CDNA+'.nix'
	output: "express/bams/{sample}.bam"
	log: "logs/express/{sample}.log"
	shell: "{ALIGN} -d {input.ref} -rALL -f {input.fq} -o SAM 2> {log} | {SAMTOOLS} view -bS - > {output}"
		
rule expressreps:
	input: fq="express/bams/{sample}.sorted.bam"
	output: "express/reports/{sample}"
	log: "logs/express/{sample}.log"
	shell:
			"""
			mkdir -p {output}
			{EXPR} {CDNA}.fa {input.fq} --max-read-len 500 -o {output} 2> {log}
			"""

##### Annotation #####
rule htseq:
	input: "mapped/{sample}.sorted.bam"
	output: id="counts/{sample}.tsv"
	threads: 1
	shell:
			"""
			{SAMTOOLS} view -h {input} | htseq-count --mode intersection-strict --stranded no --minaqual 1 --type exon --idattr gene_id - {GTFFILE} > {output.id}
			"""
			
##### Report #####
rule report:
	input: COUNTS
	output: "diffExp.tex"
	run:
		R("""
		MUSCLE_KO<-strsplit("{MUSCLE_KO}", " ");
		MUSCLE_WT<-strsplit("{MUSCLE_WT}", " ");
		HEART_KO<-strsplit("{HEART_KO}", " ");
		HEART_WT<-strsplit("{HEART_WT}", " ");
		Sweave("diffExp.Rnw")
		""")

#we do it twice for the TOC
rule pdflatex:
	input: "{report}.tex"
	output: "{report}.pdf"
	shell: "pdflatex {input}; pdflatex {input}"

#### Tracks #####
rule bamtobdg:
	input: "mapped/{sample}.sorted.bam"
	output: "mapped/{sample}.bdg"
	shell: "{BEDTOOLS}/bedtools genomecov -ibam {input} -g {FASTAREF} -bg > {output}"

rule chrify:
	input: "{sample}.bdg"
	output: "{sample}.bdg.chr"
	shell:
			"""
			sed -e 's/^/chr/' {input} > {output}
			"""

rule bigwig:
	input: "mapped/{sample}.bdg.chr"
	output: "tracks/{sample}.bw"
	shell:
			"""
			{TOOLDIR}/bedGraphToBigWig {input} mm10.len {output}
			"""

#### Site #####
COLORS = """
141,211,199
255,255,179
190,186,218
251,128,114
128,177,211
253,180,98
179,222,105
252,205,229
217,217,217
188,128,189
204,235,197
255,237,111
190,174,212
253,192,134
56,108,176
191,91,23
""".split()

rule siteindex:
	input: BIGWIGS, "diffExp.pdf", QCED, RNASEQC_SENT
	output: "site/index.md"
	run:
		with open(output[0], 'w') as outfile:
			outfile.write("""---
layout: wide
---
### Quality Control
#### FastQC Output
[FastQC] is quality control tool that can point to certain biases that represent contamination. Be aware, the report may reflect inherent biases in the RNA-Seq experiment.
""")
			for s,p in zip(SAMPLES,PRETTY_NAMES):
				outfile.write("> [`{0}`]({{{{ site.baseurl }}}}/fastqc/{1}.trimmed_fastqc/fastqc_report.html)\n\n".format(p,s))
			outfile.write("""
		
#### RNA-SeQC Output
[RNA-SeQC](http://bioinformatics.oxfordjournals.org/content/28/11/1530.long) produces extensive metrics for RNA-Seq runs. Not all of the sections will apply to the Ion Proton protocol.
Most interesting might be the rRNA rate in the multisample [summary document](RNASEQC_DIR/countMetrics.html).
> [RNA-SeQC reports](RNASEQC_DIR)

### Differential expression analysis report and significantly DE gene tables
> [diffExp.pdf](diffExp.pdf)

> [muscleResults.csv](muscleResults.csv)

> [heartResults.csv](heartResults.csv)

### Using BigWig Tracks in UCSC Genome Browser
Go to [http://genome.ucsc.edu/cgi-bin/hgCustom](http://genome.ucsc.edu/cgi-bin/hgCustom), make sure mm10 is selected, and copy-paste one or more of these into the URL field.
""")
			for c, b, p in zip(COLORS, BIGWIGS, PRETTY_NAMES):
				outfile.write("> ```track type=bigWig name={0} db=mm10 smoothingWindow=4 color={1} autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{{{ site.baseurl }}}}/{2}```\n\n".format(p,c,b))
			outfile.write("""
### Code repository
Code used to generate this analysis is located here [http://github.research.chop.edu/BiG/martin-ant1-rnaseq](http://github.research.chop.edu/BiG/martin-ant1-rnaseq). Feel free to reuse.

### Git hash
This should match the hash index on the last page of your report.
""")
			outfile.write('```{0}```'.format(get_head_hash()))

rule publishsite:
	input: "site/index.md"
	shell:
		"""
		jekyll build --config site/_config.yml --source site --destination site/_site
		rsync -v --update --rsh=ssh -r site/_site/* {MITOMAP}
		"""

rule publishdata:
	input: BIGWIGS, QCED, "diffExp.pdf"
	shell:
		"""
		rsync -v --update --rsh=ssh -r diffExp.pdf muscleResults.csv heartResults.csv fastqc tracks RNASEQC_DIR {MITOMAP}
		"""

def get_head_hash():
	return os.popen('git rev-parse --verify HEAD 2>&1').read().strip()


##########################
#--outFilterIntronMotifs RemoveNoncanonical
#-library-type=fr-secondstrand unclear if this is appropriate
#http://seqanswers.com/forums/showthread.php?t=9418 
#http://ioncommunity.lifetechnologies.com/docs/DOC-7062

#java -jar picard-tools-1.106/CreateSequenceDictionary.jar REFERENCE= ../refs/Mus_musculus/Ensembl/GRCm38/Sequence/WholeGenomeFasta/genome.fa OUTPUT= ../refs/Mus_musculus/Ensembl/GRCm38/Sequence/WholeGenomeFasta/genome.dict
#perl -ne 'm/^([0-9]+|MT|X|Y)/ && print' /nas/is1/leipzig/martin/snake-env/refs/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf > /nas/is1/leipzig/martin/snake-env/refs/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/primary_genes.gtf
