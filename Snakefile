import glob
FASTADIR = "/nas/is1/rnaseq_workspace/refs/mm38/fasta/"
FASTAREF = glob.glob(FASTADIR+"*fa")
STARREFDIR = "/nas/is1/rnaseq_workspace/refs/mm38/star/"
CHRNAME = STARREFDIR+"chrName.txt"
GTFFILE= "/nas/is1/rnaseq_workspace/refs/mm38/genes/genes.gtf"
TOOLDIR="/home/leipzig/leipzig/martin/snake-env/tools"
STAR = TOOLDIR+"/STAR_2.3.0e.Linux_x86_64/STAR"
SAMTOOLS = TOOLDIR+"/samtools/samtools"
NOVO = "/nas/is1/bin/Novoalign/3.00.02/novocraft"
ALIGN =NOVO+"/novoalign"
INDEX=NOVO+"/novoindex"
SORT=NOVO+"/novosort"
CUFF=TOOLDIR+"/cufflinks-2.1.1.Linux_x86_64/cufflinks"

#ANT1 evens
MUSCLE_KO = "raw/IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.fastq raw/IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.fastq raw/IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.fastq raw/IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.fastq".split()

#B6ME odds
MUSCLE_WT = "raw/IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome.fastq raw/IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome.fastq raw/IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303.fastq raw/IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome.fastq".split()

#ANT1 evens
HEART_KO = "raw/IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.fastq  raw/IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.fastq  raw/IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.fastq raw/IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.fastq".split()

#B6ME odds
HEART_WT = "raw/IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome.fastq raw/IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome.fastq  raw/IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome.fastq  raw/IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome.fastq".split()

SAMPLES = MUSCLE_KO + MUSCLE_WT + HEART_KO + HEART_WT

SAMPLE_ROOTS = [s.replace('raw/', '') for s in [f.replace('.fastq', '') for f in SAMPLES]]
MAPPED = [s.replace('raw', 'mapped') for s in [f.replace('fastq', 'sorted.bam.bai') for f in SAMPLES]]

CUFFED = ['cufflinks/'+f+'/transcripts.gtf' for f in SAMPLE_ROOTS]

rule all:
	input: "/nas/is1/rnaseq_workspace/refs/mm38/star/chrName.txt", MAPPED, CUFFED

#ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Mus_musculus/UCSC/mm10/Mus_musculus_UCSC_mm10.tar.gz;"

# input: "{dataset}/inputfile"
# output: "{dataset}/file.{group}.txt"
# shell: "somecommand --group {wildcards.group}  < {input}  > {output}"

rule starindex:
	input: FASTAREF
	output: CHRNAME
	shell: "{STAR} --limitGenomeGenerateRAM 54760833024 --runMode genomeGenerate --genomeDir {STARREFDIR} --genomeFastaFiles {input}"

rule trim:
	input: "raw/{sample}.fastq"
	output: "raw/{sample}.trimmed.fastq"
	threads: 1
	shell: "cutadapt -m 16 -b GGCCAAGGCG -o {output} {input}"
	
rule map:
	input:  "raw/{sample}.trimmed.fastq"
	output: "mapped/{sample}.sam"
	threads: 24
	shell:
		"""
		{STAR} --genomeDir {STARREFDIR} --outFileNamePrefix {wildcards.sample}_ --readFilesIn {input} --runThreadN 24 --genomeLoad NoSharedMemory --outSAMattributes All --outSAMstrandField intronMotif --sjdbGTFfile {GTFFILE}
		mv {wildcards.sample}_Aligned.out.sam {output}
		mv {wildcards.sample}_Log.final.out {wildcards.sample}_Log.out {wildcards.sample}_Log.progress.out {wildcards.sample}_SJ.out.tab starlogs
		"""

rule samtobam:
	input:  "mapped/{sample}.sam"
	output: "mapped/{sample}.bam"
	threads: 1
	shell:  "{SAMTOOLS} view -bS {input} > {output}"

rule sortbam:
	input: "{sample}.bam"
	output: "{sample}.sorted.bam", "{sample}.sorted.bam.bai"
	threads: 1
	shell: "{SORT} -t /nas/is1/tmp -s -i -o {output} {input}"

#samplefile.rnaseqc.txt was made by hand
rule rnaseqc:
	input: "samplefile.rnaseqc.txt"
	output: "rnaseqc/index.html"
	shell: "java -jar tools/RNA-SeQC_v1.1.7.jar -o rnaseqc -r {FASTAREF} -s samplefile.rnaseqc.txt -t {GTFFILE}"
	
rule mask:
	output: "refs/Mus_musculus/Ensembl/GRCm38/Annotation/mask.gtf"
	shell: "grep -P 'rRNA|tRNA|MT\t' refs/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf > refs/Mus_musculus/Ensembl/GRCm38/Annotation/mask.gtf"

#http://seqanswers.com/forums/showthread.php?t=9418
rule cufflinks:
	input: "mapped/{sample}.sorted.bam"
	output: "cufflinks/{sample}/transcripts.gtf","cufflinks/{sample}/isoforms.fpkm_tracking","cufflinks/{sample}/genes.fpkm_tracking"
	threads: 8
	shell: """
	       mkdir -p cufflinks/{wildcards.sample}
	       {CUFF} -p 8 -g {GTFFILE} -M refs/Mus_musculus/Ensembl/GRCm38/Annotation/mask.gtf --multi-read-correct --outFilterIntronMotifs RemoveNoncanonical --output-dir cufflinks/{wildcards.sample} {input}
	       """
#-library-type=fr-secondstrand

