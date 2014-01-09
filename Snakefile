import glob
ROOT =          "/home/leipzig/leipzig/martin/snake-env/"
FASTAREF =      ROOT+"refs/Mus_musculus/Ensembl/GRCm38/Sequence/WholeGenomeFasta/genome.fa"
STARREFDIR =    "/nas/is1/rnaseq_workspace/refs/mm38/star/"
CHRNAME =       STARREFDIR+"chrName.txt"
GTFFILE =       ROOT+"refs/Mus_musculus/Ensembl/GRCm38/Annotation/Genes/genes.gtf"
MASKFILE =      ROOT+"refs/Mus_musculus/Ensembl/GRCm38/Annotation/mask.gtf"
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

#ANT1 evens
MUSCLE_KO = "IonXpressRNA_002.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome IonXpressRNA_004.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome IonXpressRNA_006.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303 IonXpressRNA_008.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome".split()

#B6ME odds
MUSCLE_WT = "IonXpressRNA_001.R_2013_11_26_13_55_09_user_1PR-8-RNA-Seq_whole_transcriptome IonXpressRNA_003.R_2013_11_26_20_48_53_user_1PR-9-RNA-Seq_whole_transcriptome IonXpressRNA_005.R_2013_12_04_09_37_33_1PR-10-RNA-Seq_whole_transcriptome_76303 IonXpressRNA_007.R_2013_12_06_12_45_12_user_1PR-11-RNA-Seq_whole_transcriptome".split()

#ANT1 evens
HEART_KO = "IonXpressRNA_010.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome  IonXpressRNA_012.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome  IonXpressRNA_014.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome IonXpressRNA_016.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome".split()

#B6ME odds
HEART_WT = "IonXpressRNA_009.R_2013_12_19_16_11_21_user_1PR-13-RNA-Seq_whole_transcriptome IonXpressRNA_011.R_2013_12_18_20_25_40_user_1PR-12-RNA-Seq_whole_transcriptome  IonXpressRNA_013.R_2013_12_20_12_50_23_user_1PR-14-RNA-Seq_whole_transcriptome  IonXpressRNA_015.R_2013_12_21_20_34_59_user_1PR-15-RNA-Seq_whole_transcriptome".split()

SAMPLES = MUSCLE_KO + MUSCLE_WT + HEART_KO + HEART_WT

MAPPED = [ROOT+'mapped/'+f+'.sorted.bam' for f in SAMPLES]
COUNTS = [ROOT+'counts/'+f+'.tsv' for f in SAMPLES]
CUFFED = [ROOT+'cufflinks/'+f+'/transcripts.gtf' for f in SAMPLES]

SAMPLEFILE = ROOT+"samplefile.rnaseqc.txt"

rule all:
	input: STARREFDIR+"chrName.txt", MAPPED, CUFFED, COUNTS, ROOT+"rnaseqc/index.html"

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
	input:  ROOT+"raw/{sample}.trimmed.fastq.gz"
	output: ROOT+"mapped/{sample}.sam"
	threads: 24
	shell:
		"""
		{STAR} --genomeDir {STARREFDIR} --outFileNamePrefix {wildcards.sample}_ --readFilesIn {input} --runThreadN 24 --genomeLoad NoSharedMemory --outSAMattributes All --outSAMstrandField intronMotif --sjdbGTFfile {GTFFILE}
		mv {wildcards.sample}_Aligned.out.sam {output}
		mv {wildcards.sample}_Log.final.out {wildcards.sample}_Log.out {wildcards.sample}_Log.progress.out {wildcards.sample}_SJ.out.tab starlogs
		"""

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
	output: ROOT+"rnaseqc/index.html"
	shell: "java -jar {RNASEQC} -o rnaseqc -r {FASTAREF} -s samplefile.rnaseqc.txt -t {GTFFILE}"

rule mask:
	output: MASKFILE
	shell: "grep -P 'rRNA|tRNA|MT\t' {GTFFILE} > {MASKFILE}"

rule cufflinks:
	input: ROOT+"mapped/{sample}.sorted.bam"
	output: ROOT+"cufflinks/{sample}/transcripts.gtf",ROOT+"cufflinks/{sample}/isoforms.fpkm_tracking",ROOT+"cufflinks/{sample}/genes.fpkm_tracking"
	threads: 8
	shell: """
	       mkdir -p {ROOT}cufflinks/{wildcards.sample}
	       {CUFF} -p 8 -g {GTFFILE} -M {MASKFILE} --max-bundle-length 8000000 --multi-read-correct --library-type=fr-secondstrand --output-dir {ROOT}cufflinks/{wildcards.sample} {input}
	       """

rule htseq:
	input: ROOT+"mapped/{sample}.sorted.bam"
	output: id=ROOT+"counts/{sample}.tsv"
	threads: 1
	shell:
			"""
			{SAMTOOLS} view -h {input} | htseq-count --mode intersection-strict --stranded no --minaqual 1 --type exon --idattr gene_id - {GTFFILE} > {output.id}
			"""

#--outFilterIntronMotifs RemoveNoncanonical
#-library-type=fr-secondstrand unclear if this is appropriate
#http://seqanswers.com/forums/showthread.php?t=9418 
#http://ioncommunity.lifetechnologies.com/docs/DOC-7062
