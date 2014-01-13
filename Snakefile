import glob
from snakemake.utils import R

ROOT =          "/nas/is1/leipzig/martin/snake-env/"
REFDIR = 	ROOT+"refs/Mus_musculus/Ensembl/GRCm38/"
FASTAREF =      REFDIR+"Sequence/WholeGenomeFasta/genome.fa"
STARREFDIR =    REFDIR+"star"
CHRNAME =       STARREFDIR+"chrName.txt"
GTFFILE =       REFDIR+"Annotation/Genes/genes.gtf"
MASKFILE =      REFDIR+"Annotation/mask.gtf"
TOOLDIR=        ROOT+"tools"
STAR =          TOOLDIR+"/STAR_2.3.0e.Linux_x86_64/STAR"
SAMTOOLS =      TOOLDIR+"/samtools/samtools"
CUTADAPT =      "/nas/is1/bin/cutadapt"
NOVO =          "/nas/is1/bin/Novoalign/3.00.02/novocraft"
RNASEQC =       TOOLDIR+"/tools/RNA-SeQC_v1.1.7.jar"
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

SAMPLES = ' '.join([MUSCLE_KO,MUSCLE_WT,HEART_KO,HEART_WT]).split()

SEQ_DIR = ROOT+"raw/"
MAPPED_DIR = ROOT+"mapped/"
COUNTS_DIR = ROOT+"counts/"
CUFF_DIR = ROOT+"cufflinks/"
DIRS = MAPPED_DIR+COUNTS_DIR+CUFF_DIR
MAPPED = [MAPPED_DIR+f+'.sorted.bam' for f in SAMPLES]
COUNTS = [COUNTS_DIR+f+'.tsv' for f in SAMPLES]
CUFFED = [CUFF_DIR+f+'/transcripts.gtf' for f in SAMPLES]
EXPRED = ['express/'+f for f in SAMPLES]

SAMPLEFILE = ROOT+"samplefile.rnaseqc.txt"
RNASEQC_DIR = ROOT+"rnaseqc/"
RNASEQC_SENT = RNASEQC_DIR+"index.html"

rule all:
	input: DIRS, CHRNAME, MAPPED, CUFFED, COUNTS, RNASEQC_SENT, EXPR

rule expr:
	input: EXPRED

rule dirs:
	output: DIRS
	shell: "mkdir -p "+' '.join(DIRS)

rule counts:
	input: COUNTS
	
rule starindex:
	input: FASTAREF
	output: CHRNAME
	shell: "{STAR} --limitGenomeGenerateRAM 54760833024 --runMode genomeGenerate --genomeDir {STARREFDIR} --genomeFastaFiles {input}"

#cutadapt will auto-gz if .gz is in the output name
rule trim:
	input: "{sample}.fastq"
	output: "{sample}.trimmed.fastq.gz"
	threads: 1
	shell: "{CUTADAPT} -m 16 -b GGCCAAGGCG -o {output} {input}"

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

rule parselogs:
	input: "starlogs/{sample}_Log.final.out"
	output: "starlogs/{sample}.parsed.txt"
	run:
		input_reads_p = re.compile('Number of input reads |\s+(.*)')
		unique_reads_p = re.compile('Uniquely mapped reads % |\s+(.*)')
		multiple_hits_p = re.compile('% of reads mapped to multiple loci |\s+(.*)')
		with open({input}, 'rb') as s:
			if input_reads_p.search(s):
				input_reads=input_reads.search(s).group(1)
			elif unique_reads_p.search(s):
				unique_reads=unique_reads_p.search(s).group(1)
			elif multiple_hits_p.search(s):
				multiple_hits=multiple_hits_p.search(s).group(1)
		print '{0}\t{1}\t{2}\t{3}'.format({sample},input_reads,unique_reads,multiple_hits)
		
rule samtobam:
	input:  "{sample}.sam"
	output: "{sample}.bam"
	threads: 1
	shell:  "{SAMTOOLS} view -bS {input} > {output}"

#novosort can index
rule sortbam:
	input: "{sample}.bam"
	output: bam="{sample}.sorted.bam", bai="{sample}.sorted.bam.bai"
	threads: 24
	shell: "{SORT} -t /nas/is1/tmp -s -i -o {output.bam} {input}"

#samplefile.rnaseqc.txt was made by hand so sue me
rule rnaseqc:
	input: SAMPLEFILE, MAPPED
	output: RNASEQC_SENT
	shell: "java -jar {RNASEQC} -o RNASEQC_DIR -r {FASTAREF} -s {SAMPLEFILE} -t {GTFFILE}"

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
CDNA=REFDIR+"Sequence/Transcripts/Mus_musculus.GRCm38.74.cdna.all"
rule txIndex:
	input: CDNA+'.fa'
	output: CDNA+'.1.ebwt'
	shell: "bowtie-build  --offrate 1 {CDNA}.fa {CDNA}"

rule express:
	input: "raw/{sample}.fastq", 
	output: "express/{sample}"
	shell: """
	       mkdir -p {output}
	       bowtie -aS -X 800 --offrate 1 {CDNA} {input} | {EXPR} {CDNA}.fa -o {output}
	       """

rule htseq:
	input: "mapped/{sample}.sorted.bam"
	output: id="counts/{sample}.tsv"
	threads: 1
	shell:
			"""
			{SAMTOOLS} view -h {input} | htseq-count --mode intersection-strict --stranded no --minaqual 1 --type exon --idattr gene_id - {GTFFILE} > {output.id}
			"""


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
from snakemake.utils import R

#--outFilterIntronMotifs RemoveNoncanonical
#-library-type=fr-secondstrand unclear if this is appropriate
#http://seqanswers.com/forums/showthread.php?t=9418 
#http://ioncommunity.lifetechnologies.com/docs/DOC-7062
