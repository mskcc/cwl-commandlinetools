#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand:
- perl
- /usr/bin/vardict/var2vcf_paired.pl
id: vardict_var2vcf

arguments:
- position: 0
  prefix: -N
  valueFrom: "${\n    return inputs.N + \"|\" + inputs.N2;\n}"

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: 4
    ramMin: 32000
  DockerRequirement:
    dockerPull: mskcc/roslin-variant-vardict:1.5.1

inputs:

  C:
    type: boolean?
    doc: Indicate the chromosome names are just numbers, such as 1, 2, not chr1, chr2
    inputBinding:
      position: 0
      prefix: -C

  D:
    type: float?
    doc: Debug mode. Will print some error messages and append full genotype at the end.
    inputBinding:
      position: 0
      prefix: -D
  F:
    type: float?
    doc: The hexical to filter reads using samtools. Default - 0x500 (filter 2nd alignments and duplicates). Use -F 0 to turn it off.
    inputBinding:
      position: 0
      prefix: -F

  I:
    type: int?
    doc: The indel size. Default - 120bp
    inputBinding:
      position: 0
      prefix: -I

  M:
    type: boolean?
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

  P:
    type: float?
    doc: The read position filter. If the mean variants position is less that specified, it's considered false positive. Default - 5
    inputBinding:
      position: 0
      prefix: -P

  Q:
    type: string?
    doc: If set, reads with mapping quality less than INT will be filtered and ignored
    inputBinding:
      position: 0
      prefix: -Q

  S:
    type: boolean?
    doc: The column for region start, e.g. gene start
    inputBinding:
      position: 0
      prefix: -S
  f:
    type: string?
    doc: The threshold for allele frequency, default - 0.05 or 5%%
    inputBinding:
      position: 0
      prefix: -f

  m:
    type: int?
    doc: If set, reads with mismatches more than INT will be filtered and ignored. Gaps are not counted as mismatches. Valid only for bowtie2/TopHat or BWA aln followed by sampe. BWA mem is calculated as NM - Indels. Default - 8, or reads with more than 8 mismatches will not be used.
    inputBinding:
      position: 0
      prefix: -m
  o:
    type: float?
    doc: The Qratio of (good_quality_reads)/(bad_quality_reads+0.5). The quality is defined by -q option. Default - 1.5
    inputBinding:
      position: 0
      prefix: -o

  p:
    doc: Do pileup regarless the frequency
    type: float?
    inputBinding:
      position: 0
      prefix: -p

  vcf:
    type: string
    doc: output vcf file

  A:
    type: boolean?
    inputBinding:
      position: 0
      prefix: -A

  c:
    type: int?
    inputBinding:
      position: 0
      prefix: -c

  q:
    type: float?
    inputBinding:
      position: 0
      prefix: -q

  d:
    type: int?
    inputBinding:
      position: 0
      prefix: -d

  v:
    type: int?
    inputBinding:
      position: 0
      prefix: -v

  input_vcf:
    type: File?

outputs:
  output:
    type: File
    outputBinding:
      glob: ${ return inputs.vcf; }

stdin: $(inputs.input_vcf.path)
stdout: ${ return inputs.vcf; }