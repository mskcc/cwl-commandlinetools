#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand:
- /usr/bin/vardict/bin/VarDict
id: vardict

arguments:
- position: 1
  prefix: -b
  valueFrom: "${\n    return inputs.b.path + \"|\" + inputs.b2.path;\n}"
- position: 0
  prefix: -N
  valueFrom: "${\n    if (inputs.N2)\n        return [inputs.N, inputs.N2];\n    else\n\
    \        return inputs.N;\n}"


requirements:
  EnvVarRequirement:
      envDef:
        JAVA_OPTS: '"-Xms8g" "-Xmx95g"'
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: 4
    ramMin: 64000
  DockerRequirement:
    dockerPull: ghcr.io/msk-access/vardictjava

inputs:

  B:
    type: int?
    doc: The minimum # of reads to determine strand bias, default: 2
    inputBinding:
      position: 0
      prefix: -B

  C:
    type: boolean?
    doc: Indicate the chromosome names are just numbers, such as 1, 2, not chr1, chr2 (deprecated!!!)
    inputBinding:
      position: 0
      prefix: -C

  D:
    type: boolean?
    doc: Debug mode. Will print some error messages and append full genotype at the end.
    inputBinding:
      position: 0
      prefix: -D

  E:
    type: string?
    doc: The column for region end, e.g. gene end
    inputBinding:
      position: 0
      prefix: -E

  F:
    type: boolean?
    doc: The hexical to filter reads using samtools. Default - 0x500 (filter 2nd alignments and duplicates). Use -F 0 to turn it off.
    inputBinding:
      position: 0
      prefix: -F

  G:
    type: File
    doc: The reference fasta. Should be indexed (.fai)
    secondaryFiles:
      - .fai
    inputBinding:
      position: 0
      prefix: -G

  H:
    type: boolean?
    doc: Print this help page
    inputBinding:
      position: 0
      prefix: -H

  I:
    type: string?
    doc: #The indel size. Default: 50bp. Be cautious with -I option, especially in the amplicon mode, as amplicon sequencing is not a way to find large indels. Increasing the search size might be slow and false positives may appear in low complexity regions. Increasing it to 200-300 bp is only recommend for hybrid capture sequencing.
    inputBinding:
      position: 0
      prefix: -I

  J:
    type: boolean?
    doc: The genomic position that CRISPR/Cas9 suppose to cut, typically 3bp from the PAM NGG site and within the guide. For CRISPR mode only. It will adjust the variants (mostly In-Del) start and end sites to as close to this location as possible, if there are alternatives. The option should only be used for CRISPR mode.
    inputBinding:
      position: 0
      prefix: -J

  K:
    type: boolean?
    doc: Include Ns in the total depth calculation
    inputBinding:
      position: 0
      prefix: -K

  L:
    type: boolean?
    doc: The minimum structural variant length to be presented using <DEL> <DUP> <INV> <INS>, etc. Default 1000. Any indel, complex variants less than this will be spelled out with exact nucleotides
    inputBinding:
      position: 0
      prefix: -L

  M:
    type: string?
    doc: The minimum matches for a read to be considered. If, after soft-clipping, the matched bp is less than INT, then the read is discarded. It's meant for PCR based targeted sequencing where there's no insert and the matching is only the primers. Default - 0, or no filtering
    inputBinding:
      position: 0
      prefix: -M

  N:
    type: string?
    doc: Tumor Sample Name

  N2:
    type: string?
    doc: Normal Sample Name

  O:
    type: string?
    doc: The reads should have at least mean MapQ to be considered a valid variant. Default - no filtering
    inputBinding:
      position: 0
      prefix: -O

  P:
    type: string?
    doc: The read position filter. If the mean variants position is less that specified, its considered false positive. Default 5
    inputBinding:
      position: 0
      prefix: -P

  Q:
    type: string?
    doc: If set, reads with mapping quality less than INT will be filtered and ignored
    inputBinding:
      position: 0
      prefix: -Q

  R:
    type: string?
    doc: The region of interest. In the format of chr -start-end. If end is omitted, then a single position. No BED is needed.
    inputBinding:
      position: 0
      prefix: -R

  S:
    type: string?
    doc: The column for region start, e.g. gene start
    inputBinding:
      position: 0
      prefix: -S

  T:
    type: string?
    doc: Trim bases after [INT] bases in the reads
    inputBinding:
      position: 0
      prefix: -T

  U:
    type: string?
    doc: Turn off structural variant calling
    inputBinding:
      position: 0
      prefix: -U

  UN:
    type: string?
    doc: Indicate unique mode, which when mate pairs overlap, the overlapping part will be counted only once using first read only. Default unique mode disabled, all reads are counted.
    inputBinding:
      position: 0
      prefix: -UN

  V:
    type: string?
    doc: The lowest frequency in normal sample allowed for a putative somatic mutations. Default to 0.05
    inputBinding:
      position: 0
      prefix: -V

  VS:
    type: string?
    doc: How strict to be when reading a SAM or BAM. STRICT - throw an exception if something looks wrong. LENIENT - Emit warnings but keep going if possible. SILENT - Like LENIENT, only dont emit warning messages. Default - LENIENT
    inputBinding:
      position: 0
      prefix: -VS

  W:
    type: string?
    doc: The insert size STD. Used for SV calling. Default 100
    inputBinding:
      position: 0
      prefix: -W

  X:
    type: string?
    doc: Extension of bp to look for mismatches after insersion or deletion. Default to 2 bp, or only calls when they are within 2 bp.
    inputBinding:
      position: 0
      prefix: -X

  Y:
    type: string?
    doc: Extension of bp of reference to build lookup table. Default to 1200 bp. Increasing the number will slow down the program. The main purpose is to call large indels with 1000 bp that can be missed by discordant mate pairs.
    inputBinding:
      position: 0
      prefix: -Y

  Z:
    type: string?
    doc: For downsampling fraction. e.g. 0.7 means roughly 70%% downsampling. Default - No downsampling. Use with caution. The downsampling will be random and non-reproducible.
    inputBinding:
      position: 0
      prefix: -Z

  a:
    type: string?
    doc: Indicate its amplicon based calling. Reads dont map to the amplicon will be skipped. A read pair is considered belonging the amplicon if the edges are less than int bp to the amplicon, and overlap fraction is at least float. Default 10 0.95
    inputBinding:
      position: 0
      prefix: -a

  b:
    type: File?
    secondaryFiles:
      - .bai
    doc: Tumor bam

  b2:
    type: File?
    secondaryFiles:
      - .bai
    doc: Normal bam

  bedfile:
    type: File?
    inputBinding:
      position: 1

  c:
    type: string?
    doc: The column for chromosome
    inputBinding:
      position: 0
      prefix: -c

  d:
    type: string?
    doc: The delimiter for split region_info, default to tab "\t"
    inputBinding:
      position: 0
      prefix: -d

  e:
    type: string?
    doc: The column for segment ends in the region, e.g. exon ends
    inputBinding:
      position: 0
      prefix: -e

  f:
    type: string?
    doc: The threshold for allele frequency, default - 0.01 or 1%%
    inputBinding:
      position: 0
      prefix: -f

  g:
    type: string?
    doc: The column for gene name, or segment annotation
    inputBinding:
      position: 0
      prefix: -g

  h:
    type: boolean?
    doc: Print a header row decribing columns
    inputBinding:
      position: 0
      prefix: -h

  i:
    type: boolean?
    doc: Output splicing read counts
    inputBinding:
      position: 0
      prefix: -i

  j:
    type: boolean?
    doc: CRISPR_filtering_bp In CRISPR mode, the minimum amount in bp that a read needs to overlap with cutting site. If a read does not meet the criteria, it will not be used for variant calling, since it is likely just a partially amplified PCR. Default not set, or no filtering
    inputBinding:
      position: 0
      prefix: -j


  k:
    type: string?
    doc: Indicate whether to perform local realignment. Default - 1. Set to 0 to disable it. For Ion or PacBio, 0 is recommended.
    inputBinding:
      position: 0
      prefix: -k

  m:
    type: string?
    doc: If set, reads with mismatches more than INT will be filtered and ignored. Gaps are not counted as mismatches. Valid only for bowtie2/TopHat or BWA aln followed by sampe. BWA mem is calculated as NM - Indels. Default - 8, or reads with more than 8 mismatches will not be used.
    inputBinding:
      position: 0
      prefix: -m

  n:
    type: string?
    doc: The regular expression to extract sample name from bam filenames. Default to - /([^\/\._]+?)_[^\/]*.bam/
    inputBinding:
      position: 0
      prefix: -n

  o:
    type: string?
    doc: The Qratio of (good_quality_reads)/(bad_quality_reads+0.5). The quality is defined by -q option. Default - 1.5
    inputBinding:
      position: 0
      prefix: -o

  p:
    type: boolean?
    doc: Do pileup regarless the frequency
    inputBinding:
      position: 0
      prefix: -p

  q:
    type: string?
    doc: The phred score for a base to be considered a good call. Default - 22.5 (for Illumina) For PGM, set it to ~15, as PGM tends to under estimate base quality.
    inputBinding:
      position: 0
      prefix: -q

  r:
    type: string?
    doc: The minimum # of variance reads, default: 2
    inputBinding:
      position: 0
      prefix: -r

  s:
    type: string?
    doc: The column for segment starts in the region, e.g. exon starts
    inputBinding:
      position: 0
      prefix: -s

  t:
    type: boolean?
    doc: Indicate to remove duplicated reads. Only one pair with same start positions will be kept
    inputBinding:
      position: 0
      prefix: -t

  th:
    type: string?
    doc: Threads count.
    inputBinding:
      position: 0
      prefix: -th

  three:
    type: boolean?
    doc: Indicate to move indels to 3-prime if alternative alignment can be achieved.
    inputBinding:
      position: 0
      prefix: '-3'

  u:
    type: boolean?
    doc: Indicate unique mode, which when mate pairs overlap, the overlapping part will be counted only once using forward read only. Default unique mode disabled, all reads are counted.
    inputBinding:
      position: 0
      prefix: -u

  w:
    type: string?
    doc: The insert size. Used for SV calling. Default 300
    inputBinding:
      position: 0
      prefix: -w

  x:
    type: string?
    doc: The number of nucleotide to extend for each segment, default 0
    inputBinding:
      position: 0
      prefix: -x

  y:
    type: string?
    doc: Verbose
    inputBinding:
      position: 0
      prefix: -y

  z:
    type: string?
    doc: #Indicate whether the BED file contains zero-based coordinates, the same way as the Genome browser IGV does. -z 1 indicates that coordinates in a BED file start from 0. -z 0 indicates that the coordinates start from 1. Default 1 for a BED file or amplicon BED file (0-based). Use 0 to turn it off. When using -R option, it is set to 0
    inputBinding:
      position: 0
      prefix: -z

outputs:
  output:
    type: File
    outputBinding:
      glob: vardict_app_output.vcf


stdout: vardict_app_output.vcf
